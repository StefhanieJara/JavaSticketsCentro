package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;

import java.sql.*;
import java.util.ArrayList;

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
                        pelicula.setRestricconEdad(resultSet.getString(3));
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
        String sql="select * from funcion f " +
                "inner join pelicula p on (p.idPelicula=f.Pelicula_idPelicula) " +
                "where p.idPelicula=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,id);
            try(ResultSet resultSet= pstmt.executeQuery()){
                while(resultSet.next()){
                    BFuncion bFuncion= new BFuncion();
                    bFuncion.setId(resultSet.getInt(1));
                    bFuncion.setPrecio(resultSet.getDouble(2));
                    bFuncion.setStock(resultSet.getInt(3));
                    bFuncion.setFecha(resultSet.getString(5));
                    bFuncion.setHoraInicio(resultSet.getString(6));
                    listaFunciones.add(bFuncion);
                }
            }
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaFunciones;
    }

    public BFuncion detectarFuncionEscogida(int idPeli, int idCliente, int pagado, int carrito){
        BFuncion bFuncion= null;
        String sql="select f.idFuncion, f.fecha, f.horaInicio, f.precio, f.stock, c.cancelado, t.carrito " +
                "from persona p " +
                "inner join compra c on (p.idPersona = c.persona_idPersona) " +
                "inner join ticket t on (c.idCompra = t.Compra_idCompra) " +
                "inner join funcion f on (t.Funcion_idFuncion = f.idFuncion) " +
                "inner join pelicula p2 on (f.Pelicula_idPelicula = p2.idPelicula) " +
                "where p.idPersona= ? and p2.idPelicula=? and (c.cancelado= ? or t.carrito=?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idCliente);
            pstmt.setInt(2, idPeli);
            pstmt.setInt(3, pagado);
            pstmt.setInt(4, carrito);
            try(ResultSet resultSet= pstmt.executeQuery()){
                if(resultSet.next()){
                    bFuncion= new BFuncion();
                    //Por ahora, solo nos interesa el id
                    bFuncion.setId(resultSet.getInt(1));
                    bFuncion.setCancelado(resultSet.getInt(6));
                    bFuncion.setCarrito(resultSet.getInt(7));
                }
            }
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return bFuncion;
    }
}
