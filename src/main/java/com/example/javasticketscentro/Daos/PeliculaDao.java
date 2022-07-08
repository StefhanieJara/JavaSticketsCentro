package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class PeliculaDao extends BaseDao {

    public BPelicula devolverPelicula(int id) {
        BPelicula pelicula = new BPelicula();

        String sql = "select p.idPelicula, p.nombre, p.restriccionEdad, p.sinopsis, p.duracion, p.foto, p.calificacionPelicula, p.genero, c.nombre, c.apellido, c.rol from pelicula p left join celebridad_por_pelicula k on (k.Pelicula_idPelicula=p.idPelicula) left join celebridad c on (c.idCelebridad=k.Celebridad_idCelebridad) where p.idPelicula= ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                int i = 1;
                while (resultSet.next()) {
                    if (i == 1) {
                        pelicula = new BPelicula();
                        pelicula.setIdPelicula(resultSet.getInt(1));
                        pelicula.setNombre(resultSet.getString(2));
                        pelicula.setRestriccionEdad(resultSet.getString(3));
                        pelicula.setSinopsis(resultSet.getString(4));
                        pelicula.setDuracion(resultSet.getString(5));
                        pelicula.setFoto(resultSet.getString(6));
                        pelicula.setCalificacionPelicula(resultSet.getDouble(7));
                        pelicula.setGenero(resultSet.getString(8));
                    }
                    BCelebridad bCelebridad = new BCelebridad();
                    bCelebridad.setNombre(resultSet.getString(9));
                    bCelebridad.setApellido(resultSet.getString(10));
                    bCelebridad.setRol(resultSet.getString(11));
                    if (bCelebridad.getRol() == null || bCelebridad.getRol().equals("director")) {
                        //Por si no hay ninguna celebridad
                        if (bCelebridad.getRol() == null) {
                            bCelebridad.setNombre("");
                            bCelebridad.setApellido("");
                        }
                        pelicula.getDirectores().add(bCelebridad);
                    } else {
                        pelicula.getActores().add(bCelebridad);
                    }
                    i++;
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return pelicula;
    }
    public ArrayList<BFuncion> detectarFunciones(int id){

        ArrayList<BFuncion> listaFunciones= new ArrayList<>();
        String sql="select f.idFuncion, f.precio,f.stock,f.fecha, f.horaInicio, s2.nombre, s.numero, f.stock, sub.butacasRestantes from funcion f " +
                "                                left join pelicula p on (p.idPelicula=f.Pelicula_idPelicula) " +
                "                                left join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion " +
                "                                left join sala s on fhs.Sala_idSala = s.idSala " +
                "                                left join sede s2 on s.Sede_idSede = s2.idSede " +
                "                                left join (select  f.stock-sum(t.cantidadButaca) as `butacasRestantes`, f.idFuncion " +
                "                                            from funcion f " +
                "                                                   inner join ticket t on f.idFuncion = t.Funcion_idFuncion " +
                "                                                   inner join compra c on t.Compra_idCompra = c.idCompra " +
                "                                           where c.cancelado=1 group by f.idFuncion) sub on sub.idFuncion=f.idFuncion " +
                "                                where p.idPelicula=? and f.habilitado=1";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,id);
            try(ResultSet resultSet= pstmt.executeQuery()){
                while(resultSet.next()){

                    BFuncion bFuncion= new BFuncion();
                    bFuncion.setIdFuncion(resultSet.getInt(1));
                    bFuncion.setPrecio(resultSet.getDouble(2));
                    bFuncion.setStock(resultSet.getInt(3));
                    bFuncion.setFecha(resultSet.getString(4));
                    bFuncion.setHoraInicio(resultSet.getString(5));
                    BSala bSala= new BSala();
                    BSede bSede= new BSede();
                    bSede.setNombre(resultSet.getString(6));
                    bSala.setNumero(resultSet.getInt(7));
                    bFuncion.setStock(resultSet.getInt(9)==0? resultSet.getInt(8) : resultSet.getInt(9));
                    bSala.setbSede(bSede);
                    bFuncion.setbSala(bSala);
                    if(!deshabilitarFuncion(bFuncion, false)){
                        listaFunciones.add(bFuncion);
                    }
                }
            }
        }catch(SQLException | ParseException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaFunciones;
    }

    public void habilitarFuncion(int idFuncion){
        String sql="update funcion set habilitado=1 where idFuncion=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1,idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deshabilitarFuncion(BFuncion bFuncion, boolean sinButacas) throws ParseException {
        boolean deshabilitar= true;
        CarritoDao carrito=new CarritoDao();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
        Date date_now=dateFormat.parse(carrito.obtenerFechaActual());
        Date date_funcion= dateFormat.parse(bFuncion.getFecha());
        if(sinButacas){
            String sql="update funcion set habilitado=0 where idFuncion=?";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql);){
                pstmt.setInt(1,bFuncion.getIdFuncion());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            if(date_funcion.before(date_now)){
                String sql="update funcion set habilitado=0 where idFuncion=?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql);){
                    pstmt.setInt(1,bFuncion.getIdFuncion());
                    pstmt.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else{
                deshabilitar=false;
            }
        }

        return deshabilitar;
    }
    public ArrayList<Bticket> funcionesDelCliente(int idClient){
        String sql= "select p.idPersona , c.idCompra,c.cancelado, " +
                "                       t.cantidadButaca, t.carrito,f.idFuncion, f.fecha, f.horaInicio, s2.nombre, s.numero from persona p " +
                "                left join compra c on p.idPersona = c.persona_idPersona " +
                "                    left join ticket t on c.idCompra = t.Compra_idCompra " +
                "                    left join funcion f on t.Funcion_idFuncion = f.idFuncion " +
                "                    left join pelicula p2 on f.Pelicula_idPelicula = p2.idPelicula " +
                "                    left join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion " +
                "                    left join sala s on fhs.Sala_idSala = s.idSala " +
                "                    left join sede s2 on s.Sede_idSede = s2.idSede " +
                "                    where idPersona=?;";
        ArrayList<Bticket> lista= new ArrayList<>();
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idClient);
            try(ResultSet resultSet= pstmt.executeQuery()){
                while(resultSet.next()){
                    Bticket ticket= new Bticket();
                    BFuncion bFuncion= new BFuncion();
                    bFuncion.setIdFuncion(resultSet.getInt(6));
                    if(resultSet.getString(7)==null){
                        bFuncion.setFecha("");
                    }else{
                        bFuncion.setFecha(resultSet.getString(7));
                    }
                    if(resultSet.getString(8)==null){
                        bFuncion.setHoraInicio("");
                    }else{
                        bFuncion.setHoraInicio(resultSet.getString(8));
                    }
                    BSala bSala=new BSala();
                    bSala.setNumero(resultSet.getInt(10));
                    BSede bSede= new BSede();
                    if(resultSet.getString(9)==null){
                        bSede.setNombre("");
                    }else{
                        bSede.setNombre(resultSet.getString(9));
                    }
                    bSala.setbSede(bSede);
                    if(resultSet.getInt(5)==0){
                        ticket.setCarrito(false);
                    }else{
                        ticket.setCarrito(true);
                    }
                    ticket.setCantButaca(resultSet.getInt(4));
                    BCompra compra= new BCompra();
                    compra.setCancelado(resultSet.getInt(3));
                    compra.setIdCompra(resultSet.getString(2));
                    bFuncion.setbSala(bSala);
                    ticket.setbFuncion(bFuncion);
                    ticket.setbCompra(compra);
                    lista.add(ticket);
                }
            }
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return lista;
    }
}
