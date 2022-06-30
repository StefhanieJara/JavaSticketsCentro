package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.lang.invoke.StringConcatException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class CarritoDao extends BaseDao{

    public int ingresarTarjeta(String numeroTarjeta, int cvv, String fechaVencimiento, String bancoNombre, String tipoTarjeta, int id_cliente){
        int key;
        String sql = "insert into tarjeta (numerotarjeta, fechavencimiento, cvv, banco,Persona_idPersona, tipo) value (?,?,?,?,?,?)";
        ResultSet rskey;
        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
             preparedStatement.setString(1,numeroTarjeta);
             preparedStatement.setString(2, fechaVencimiento);
             preparedStatement.setInt(3,cvv);
             preparedStatement.setString(4,bancoNombre);
            preparedStatement.setInt(5,id_cliente);
             preparedStatement.setString(6,tipoTarjeta);
             preparedStatement.executeUpdate();
             rskey= preparedStatement.getGeneratedKeys();
             rskey.next();
            key=rskey.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return key;
    }

    public boolean fVen_valido(String a){
       boolean valido= false;
       String[] a2= a.split("/");
       if(a2.length==2){
           try{
               Integer.parseInt(a2[0]);
               Integer.parseInt(a2[1]);
               valido=true;
           }catch(NumberFormatException e){
               return false;
           }
       }
       return valido;
    }

    public void anadirTicket(int idFuncion, int idClient){
        String idCompra=detectarCompraActiva(idClient).getIdCompra();
        if(idCompra.equals("NoExiste")){
            idCompra= generarCodigoCompra();
            crearCompra(idCompra, idClient);
        }
        String sql="insert into ticket (Compra_idCompra, Funcion_idFuncion, qr, cantidadButaca, carrito) values (?,?,'xd',1,1)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void crearCompra(String idCompra, int idClient){
        //La fecha se asignará al momento de cancelar la compra
        String sql="insert into compra (idCompra, montoTotal, persona_idPersona, fechaCompra, cancelado) values (?,0.0,?,'0000-00-00',0)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2,idClient);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String generarCodigoCompra(){
        String codigo="";
        String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
        for (int i = 0; i < 7; i++ ) {
            codigo += letters[(int) Math.round(Math.random() * 15)];
        }
        return codigo;
    }
    public BCompra detectarCompraActiva(int idClient){
        BCompra bCompra=null;
        String sql = "select * from compra where persona_idPersona=? and cancelado=0";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idClient);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    bCompra= new BCompra();
                    bCompra.setCancelado(rs.getInt(5));
                    bCompra.setIdCompra(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(bCompra==null){
            bCompra= new BCompra();
            bCompra.setIdCompra("NoExiste");
        }
        return bCompra;
    }

    public ArrayList<Bticket> listarCarrito(int idClient){
        ArrayList<Bticket> carrito= new ArrayList<>();
        String sql = "select p.nombre,p.codigoPUCP,t.cantidadButaca,f.precio,f.fecha,f.horaInicio,s.numero, s2.nombre, " +
                "       p2.foto, p2.nombre, t.Compra_idCompra, t.Funcion_idFuncion " +
                "from persona p " +
                "inner join compra c on p.idPersona = c.persona_idPersona " +
                "inner join ticket t on c.idCompra = t.Compra_idCompra " +
                "inner join funcion f on t.Funcion_idFuncion = f.idFuncion " +
                "inner join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion " +
                "inner join sala s on fhs.Sala_idSala = s.idSala " +
                "inner join sede s2 on s.Sede_idSede = s2.idSede " +
                "inner join pelicula p2 on f.Pelicula_idPelicula = p2.idPelicula " +
                "where p.idPersona=? and c.cancelado=0 ";
        try (Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idClient);
            try(ResultSet rs= pstmt.executeQuery()){
                int contador=0;
                while(rs.next()){
                    if(contador==0){
                        carrito= new ArrayList<>();
                    }
                    BCompra bCompra= new BCompra();
                    bCompra.setIdCompra(rs.getString(11));

                    BFuncion bFuncion= new BFuncion();
                    Bticket bticket= new Bticket();
                    if(rs.getInt(2)!=0){
                        bticket.setDescuento(true);
                    }else{
                        bticket.setDescuento(false);
                    }
                    bticket.setCantButaca(rs.getInt(3));
                    bFuncion.setPrecio(rs.getDouble(4));
                    bFuncion.setFecha(rs.getString(5));
                    bFuncion.setHoraInicio(rs.getString(6));
                    bFuncion.setId(rs.getInt(12));
                    BSala bSala= new BSala();
                    bSala.setNumero(rs.getInt(7));
                    BSede bSede= new BSede();
                    bSede.setNombre(rs.getString(8));

                    BPelicula bPelicula= new BPelicula();
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

    public void cambiarButacasTicket(int butacas, int idFuncion, String idCompra){
        String sql = "update ticket set cantidadButaca=? where Compra_idCompra=? and Funcion_idFuncion=?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, butacas);
            pstmt.setString(2,idCompra);
            pstmt.setInt(3,idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en CarritoDao CambiarButacasTicket");
            throw new RuntimeException(e);
        }
    }

    public void borrarTicket(int idFuncion, String idCompra){
        String sql = "delete from ticket where Compra_idCompra=? and Funcion_idFuncion=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);){
            pstmt.setString(1,idCompra);
            pstmt.setInt(2,idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en CarritoDao CambiarButacasTicket");
            throw new RuntimeException(e);
        }
    }

    public ArrayList<BTarjeta> listarTarjetas(int idClient){
        ArrayList<BTarjeta> listar= new ArrayList<>();
        String sql="select  t.numeroTarjeta, t.fechaVencimiento, " +
                "       t.CVV, t.banco, t.tipo, t.idTarjeta from persona " +
                "inner join tarjeta t on persona.idPersona = t.persona_idPersona where idPersona=?";
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1, idClient);
            try(ResultSet rs= pstmt.executeQuery()){
                while(rs.next()){
                    BTarjeta tarjeta= new BTarjeta();
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
    public BTarjeta buscarTarjeta(int idTarjeta){
        String sql="select * from tarjeta where idTarjeta= ?";
        BTarjeta tarjeta=new BTarjeta();
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1, idTarjeta);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
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

    public void cancelarCompra(int idPersona){
        BCompra compra=detectarCompraActiva(idPersona);
        cancelarTickets(compra);
        ArrayList<Bticket> btickets= listarCarrito(idPersona);
        double total=0;
        for(Bticket bticket: btickets){
            total+= (bticket.getbFuncion().getPrecio()*bticket.getCantButaca());
        }
        String fechaActual =obtenerFechaActual();
        String sql="update compra set cancelado=1, montoTotal=?, fechaCompra=? where idCompra=?";
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setDouble(1, total);
            pstmt.setString(2, fechaActual);
            pstmt.setString(3, compra.getIdCompra());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al comprar la compra");
            e.printStackTrace();
        }
    }
    public void cancelarTickets(BCompra compra){
        String sql="update ticket set carrito=0 where Compra_idCompra= ?";

        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, compra.getIdCompra());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al comprar los tickets");
            e.printStackTrace();
        }
    }
    public String obtenerFechaActual(){
        //OBTENEMOS FECHA
        int dia= Calendar.getInstance().get(Calendar.DATE);
        int mes= Calendar.getInstance().get(Calendar.MONTH)+1;
        int year= Calendar.getInstance().get(Calendar.YEAR);

        String mes1,dia1;
        if(((int)Math.log10(mes)+1)!=2){
            mes1= "0"+mes;
        }else{
            mes1= ""+mes;
        }
        if(((int)Math.log10(dia)+1)!=2){
            dia1= "0"+dia;
        }else{
            dia1= ""+dia;
        }
        return year+"-"+mes1+"-"+dia1;
    }
}
