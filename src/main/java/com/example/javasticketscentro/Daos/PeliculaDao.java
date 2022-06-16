package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;

import java.sql.*;
import java.util.ArrayList;

public class PeliculaDao extends BaseDao {

    public BPelicula devolverPelicula(String id) {
        BPelicula pelicula = null;

        try{
            int id_int=Integer.parseInt(id);
            String sql="select p.idPelicula, p.nombre, p.restriccionEdad, p.sinopsis, p.duracion, p.foto, p.calificacionPelicula, p.genero, c.nombre, c.apellido, c.rol from pelicula p inner join celebridad_por_pelicula k on (k.Pelicula_idPelicula=p.idPelicula) inner join celebridad c on (c.idCelebridad=k.Celebridad_idCelebridad) where p.idPelicula= ?";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql)){
                pstmt.setInt(1,id_int);
                try(ResultSet resultSet= pstmt.executeQuery()){
                    int i=1;
                    while(resultSet.next()){
                        if(i==1){
                            pelicula= new BPelicula();
                            pelicula.setIdPelicula(resultSet.getInt(1));
                            pelicula.setNombre(resultSet.getString(2));
                            pelicula.setRestricconEdad(resultSet.getString(3));
                            pelicula.setSinopsis(resultSet.getString(4));
                            pelicula.setDuracion(resultSet.getString(5));
                            pelicula.setFoto(resultSet.getString(6));
                            pelicula.setCalificacionPelicula(resultSet.getDouble(7));
                            pelicula.setGenero(resultSet.getString(8));
                        }
                        BCelebridad bCelebridad= new BCelebridad();
                        bCelebridad.setNombre(resultSet.getString(9));
                        bCelebridad.setApellido(resultSet.getString(10));
                        bCelebridad.setRol(resultSet.getString(11));
                        if(bCelebridad.getRol().equals("director")){
                            pelicula.getDirectores().add(bCelebridad);
                        }else{
                            pelicula.getActores().add(bCelebridad);
                        }
                        i++;
                    }
                }
            }catch(SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }catch (NumberFormatException e){
            System.out.println("Debe ingresar un tipo int");;
        }
        return pelicula;
    }
    public ArrayList<BFuncion> detectarFunciones(String id){
        ArrayList<BFuncion> listaFunciones= new ArrayList<>();


        try{
            int id_int=Integer.parseInt(id);
            String sql="select * from funcion f " +
                    "inner join pelicula p on (p.idPelicula=f.Pelicula_idPelicula) " +
                    "where p.idPelicula=?";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql)){
                pstmt.setInt(1,id_int);
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
        }catch (NumberFormatException e){
            System.out.println("Debe ingresar un tipo int");;
        }
        return listaFunciones;
    }
}
