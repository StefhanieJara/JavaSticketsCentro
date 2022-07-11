package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;
import com.example.javasticketscentro.JavaMail;
import com.example.javasticketscentro.JavaPDF;
import com.example.javasticketscentro.JavaQR;
import com.google.zxing.WriterException;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;

public class CarritoDao extends BaseDao {

    public int ingresarTarjeta(String numeroTarjeta, int cvv, String fechaVencimiento, String bancoNombre, String tipoTarjeta, int id_cliente) {
        int key;
        String sql = "insert into tarjeta (numerotarjeta, fechavencimiento, cvv, banco,Persona_idPersona, tipo) value (?,?,?,?,?,?)";
        ResultSet rskey;
        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
            preparedStatement.setString(1, numeroTarjeta);
            preparedStatement.setString(2, fechaVencimiento);
            preparedStatement.setInt(3, cvv);
            preparedStatement.setString(4, bancoNombre);
            preparedStatement.setInt(5, id_cliente);
            preparedStatement.setString(6, tipoTarjeta);
            preparedStatement.executeUpdate();
            rskey = preparedStatement.getGeneratedKeys();
            rskey.next();
            key = rskey.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return key;
    }

    public boolean fVen_valido(String a) {
        boolean valido = false;
        String[] a2 = a.split("/");
        if (a2.length == 2) {
            try {
                Integer.parseInt(a2[0]);
                Integer.parseInt(a2[1]);
                if(a2[0].length()==2 &&a2[1].length()==2){
                    valido = true;
                }else{
                    return false;
                }
            } catch (NumberFormatException e) {
                return false;
            }
        }
        return valido;
    }

    public void anadirTicket(int idFuncion, int idClient) {
        String idCompra = detectarCompraActiva(idClient).getIdCompra();
        if (idCompra.equals("NoExiste")) {
            try {
                idCompra = generarCodigoCompra();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            crearCompra(idCompra, idClient);
        }
        String sql = "insert into ticket (Compra_idCompra, Funcion_idFuncion, qr, cantidadButaca, carrito) values (?,?,'xd',1,1)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void crearCompra(String idCompra, int idClient) {
        //La fecha se asignará al momento de cancelar la compra
        String sql = "insert into compra (idCompra, montoTotal, persona_idPersona, fechaCompra, cancelado) values (?,0.0,?,'0000-00-00',0)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idClient);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public String generarCodigoCompra() throws SQLException {
        String codigo;
        do{
            codigo = "";
            String[] letters = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"};
            for (int i = 0; i < 7; i++) {
                codigo += letters[(int) Math.round(Math.random() * 15)];
            }
        }while (existeCodigo(codigo));

        return codigo;
    }

    private boolean existeCodigo(String codigo) throws SQLException {
        boolean existe= false;
        String sql="select * from compra where idCompra=?";
        try(Connection conn= this.getConnection();
            PreparedStatement psmt= conn.prepareStatement(sql);){
            psmt.setString(1,codigo);
            try(ResultSet rs= psmt.executeQuery()){
                if(rs.next()){
                    existe=true;
                }
            }
        }
        return existe;
    }

    public BCompra detectarCompraActiva(int idClient) {
        BCompra bCompra = null;
        String sql = "select * from compra where persona_idPersona=? and cancelado=0";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idClient);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    bCompra = new BCompra();
                    bCompra.setCancelado(rs.getInt(5));
                    bCompra.setIdCompra(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (bCompra == null) {
            bCompra = new BCompra();
            bCompra.setIdCompra("NoExiste");
        }
        return bCompra;
    }

    public ArrayList<Bticket> listarCarrito(int idClient) {
        ArrayList<Bticket> carrito = new ArrayList<>();
        String sql = "select p.nombre,p.codigoPUCP,t.cantidadButaca,f.precio,f.fecha,f.horaInicio,s.numero, s2.nombre,\n" +
                "                       p2.foto, p2.nombre, t.Compra_idCompra, t.Funcion_idFuncion, sub.butacasRestantes, f.stock\n" +
                "                from persona p\n" +
                "            left join compra c on p.idPersona = c.persona_idPersona\n" +
                "                left join ticket t on c.idCompra = t.Compra_idCompra\n" +
                "                left join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "                left join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion\n" +
                "                left join sala s on fhs.Sala_idSala = s.idSala\n" +
                "                left join sede s2 on s.Sede_idSede = s2.idSede\n" +
                "            left join pelicula p2 on f.Pelicula_idPelicula = p2.idPelicula\n" +
                "                left join (select  f.stock-sum(t.cantidadButaca) as `butacasRestantes`, f.idFuncion\n" +
                "                           from funcion f\n" +
                "                                    inner join ticket t on f.idFuncion = t.Funcion_idFuncion\n" +
                "                                    inner join compra c on t.Compra_idCompra = c.idCompra\n" +
                "                           where c.cancelado=1 group by f.idFuncion) sub on (sub.idFuncion=f.idFuncion)\n" +
                "                where p.idPersona=? and c.cancelado=0;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idClient);
            try (ResultSet rs = pstmt.executeQuery()) {
                int contador = 0;
                while (rs.next()) {
                    if (contador == 0) {
                        carrito = new ArrayList<>();
                    }
                    BCompra bCompra = new BCompra();
                    bCompra.setIdCompra(rs.getString(11));

                    BFuncion bFuncion = new BFuncion();
                    Bticket bticket = new Bticket();
                    if (rs.getInt(2) != 0) {
                        bticket.setDescuento(true);
                    } else {
                        bticket.setDescuento(false);
                    }
                    bticket.setCantButaca(rs.getInt(3));
                    bFuncion.setPrecio(rs.getDouble(4));
                    bFuncion.setFecha(rs.getString(5));
                    bFuncion.setHoraInicio(rs.getString(6));
                    bFuncion.setIdFuncion(rs.getInt(12));
                    bFuncion.setStock(rs.getInt(13) == 0 ? rs.getInt(14) : rs.getInt(13));
                    BSala bSala = new BSala();
                    bSala.setNumero(rs.getInt(7));
                    BSede bSede = new BSede();
                    bSede.setNombre(rs.getString(8));

                    BPelicula bPelicula = new BPelicula();
                    bPelicula.setFoto(rs.getString(9));
                    bPelicula.setNombre(rs.getString(10));

                    bFuncion.setbSala(bSala);
                    bFuncion.setbSede(bSede);
                    bFuncion.setbPelicula(bPelicula);
                    bticket.setbFuncion(bFuncion);
                    bticket.setbCompra(bCompra);

                    carrito.add(bticket);
                    contador++;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return carrito;
    }

    public void cambiarButacasTicket(int butacas, int idFuncion, String idCompra) {
        String sql = "update ticket set cantidadButaca=? where Compra_idCompra=? and Funcion_idFuncion=?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, butacas);
            pstmt.setString(2, idCompra);
            pstmt.setInt(3, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en CarritoDao CambiarButacasTicket");
            throw new RuntimeException(e);
        }
    }

    public void borrarTicket(int idFuncion, String idCompra) {
        String sql = "delete from ticket where Compra_idCompra=? and Funcion_idFuncion=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en CarritoDao CambiarButacasTicket");
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BTarjeta> listarTarjetas(int idClient) {
        ArrayList<BTarjeta> listar = new ArrayList<>();
        String sql = "select  t.numeroTarjeta, t.fechaVencimiento, " +
                "       t.CVV, t.banco, t.tipo, t.idTarjeta from persona " +
                "inner join tarjeta t on persona.idPersona = t.persona_idPersona where idPersona=?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idClient);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BTarjeta tarjeta = new BTarjeta();
                    tarjeta.setNumerTar(rs.getString(1));
                    tarjeta.setFechaV(rs.getString(2));
                    tarjeta.setCVV(rs.getInt(3));
                    tarjeta.setBanco(rs.getString(4));
                    tarjeta.setTipo(rs.getString(5));
                    tarjeta.setIdTarjeta(rs.getInt(6));
                    listar.add(tarjeta);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listar;
    }

    public BTarjeta buscarTarjeta(int idTarjeta) {
        String sql = "select * from tarjeta where idTarjeta= ?";
        BTarjeta tarjeta = new BTarjeta();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idTarjeta);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    tarjeta.setIdTarjeta(rs.getInt(1));
                    tarjeta.setNumerTar(rs.getString(2));
                    tarjeta.setFechaV(rs.getString(3));
                    tarjeta.setCVV(rs.getInt(4));
                    tarjeta.setBanco(rs.getString(5));
                    tarjeta.setTipo(rs.getString(6));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tarjeta;
    }

    public void cancelarCompra(BPersona usuario) throws MessagingException, WriterException, IOException {
        BCompra compra = detectarCompraActiva(usuario.getIdPer());
        ArrayList<Bticket> btickets = listarCarrito(usuario.getIdPer());

        ArrayList<Integer> idFunciones= new ArrayList<>();//Almacenamos los id de las funciones

        ArrayList<String> detalleTicket= new ArrayList<>();//Almacenamos detalles de los tickets
        ArrayList<Double> subtotal= new ArrayList<>();
        ArrayList<String> nombrePeli= new ArrayList<>();
        double total = 0;
        //Obtenemos todos los detalles de los tickes a comprar
        for (Bticket bticket : btickets) {
            nombrePeli.add(bticket.getbFuncion().getbPelicula().getNombre()); //Nombres de pelis
            total += (bticket.getbFuncion().getPrecio() * bticket.getCantButaca());//Total de la compra
            detalleTicket.add("Función: " + bticket.getbFuncion().getbPelicula().getNombre() + " | Fecha: " +
                    bticket.getbFuncion().getFecha() + " | Hora: " + bticket.getbFuncion().getHoraInicio() + "\nSede: " + bticket.getbFuncion().getbSede().getNombre() +
                    " | Sala: " + bticket.getbFuncion().getbSala().getNumero() + " | Butacas: " + bticket.getCantButaca() +
                    " | Precio por Butacas: S/" + bticket.getbFuncion().getPrecio());
            idFunciones.add(bticket.getbFuncion().getIdFuncion());//ID de funciones
            subtotal.add(Math.round(bticket.getbFuncion().getPrecio()*bticket.getCantButaca()*100.0)/100.0);//Subtotales
        }
        //Iniciamos el envío por correo

        JavaMail javaMail = new JavaMail();
        String asunto = "JavaSticket: Recibo de Compra";

        String msg = "<h1>Completado!</h1><br>"+
                "Tu compra ha sido realizada!<br>" +
                "Código de Compra: " + compra.getIdCompra() +"<br><br>Total: <b>S/"+Math.round(total*100.0)/100.0+"</b>" ;

        ArrayList<BufferedImage> bufferQrs= new ArrayList<>();
        for(int id: idFunciones){
            JavaQR qr = new JavaQR();
            BufferedImage image = qr.downloadLocalQR(compra.getIdCompra(), id);//Obtenemos los qr
            bufferQrs.add(image);
        }
        JavaPDF pdf= new JavaPDF();
        ArrayList<byte[]> listaPdfs= new ArrayList<>();
        int contador=0;
        //Generamos los pdf
        for(BufferedImage buff: bufferQrs){
            byte[] bytes = pdf.generaPDF(buff, detalleTicket.get(contador), subtotal.get(contador),compra.getIdCompra(), usuario.getNombre()+" "+usuario.getApellido(), nombrePeli.get(contador));
            listaPdfs.add(bytes);
            contador++;
        }
        javaMail.sendMessage(usuario.getEmail(),msg,asunto, listaPdfs, idFunciones);//Enviamos


        int n=0;
        for(int id: idFunciones){
            cancelarTickets(compra, bufferQrs.get(n), id);//Una vez se envía el correo, procedemos a subirlo a la base de datos
            n++;
        }
        String fechaActual = obtenerFechaActual();
        String sql = "update compra set cancelado=1, montoTotal=?, fechaCompra=? where idCompra=?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDouble(1, total);
            pstmt.setString(2, fechaActual);
            pstmt.setString(3, compra.getIdCompra());

            //Si se compraron todos los boletos, se dehabilita
            PeliculaDao dehabilitar= new PeliculaDao();
            for (Bticket bticket : btickets) {
                if((bticket.getbFuncion().getStock()-bticket.getCantButaca())==0){
                    dehabilitar.deshabilitarFuncion(bticket.getbFuncion(), true);
                }
            }

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al comprar la compra");
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public void cancelarTickets(BCompra compra, BufferedImage image, int idFuncion) throws IOException {
        ByteArrayOutputStream baos = null;
        try {
            baos = new ByteArrayOutputStream();
            ImageIO.write(image, "png", baos);//Escribimos el buffer en el baos a byteArray[]
        } finally {
            try {
                baos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        InputStream in= new ByteArrayInputStream(baos.toByteArray());//Obtenemos el InputStream
        String sql = "update ticket set carrito=0, qr=? where Compra_idCompra= ? and Funcion_idFuncion=?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(2, compra.getIdCompra());
            pstmt.setBlob(1, in);
            pstmt.setInt(3, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al comprar los tickets");
            e.printStackTrace();
        }
    }

    public String obtenerFechaActual() {
        //OBTENEMOS FECHA
        int dia = Calendar.getInstance().get(Calendar.DATE);
        int mes = Calendar.getInstance().get(Calendar.MONTH) + 1;
        int year = Calendar.getInstance().get(Calendar.YEAR);

        String mes1, dia1;
        if (((int) Math.log10(mes) + 1) != 2) {
            mes1 = "0" + mes;
        } else {
            mes1 = "" + mes;
        }
        if (((int) Math.log10(dia) + 1) != 2) {
            dia1 = "0" + dia;
        } else {
            dia1 = "" + dia;
        }
        return year + "-" + mes1 + "-" + dia1;
    }

    /*public byte[] devolverBytesBD(String idCompra, int idFuncion) {
        byte[] bytes = null;
        String sql = "select * from ticket where Compra_idCompra=? and Funcion_idFuncion=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idFuncion);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    bytes = rs.getBytes(3);
                    InputStream img= rs.getBinaryStream(3);
                    BufferedImage bufferimage= ImageIO.read(img);
                    //Descargar la imagen generada
                    ImageIO.write(bufferimage, "png",new File("C:\\Users\\HP\\Desktop\\hola2.png"));
                    System.out.println("Descargar foto, exitoso!");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bytes;
    }*/
}
