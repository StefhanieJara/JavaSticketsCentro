package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IndexDao extends BaseDao{
    public ArrayList<BPelicula> listaPeliculas(String filtro){
        ArrayList<BPelicula> listaPelis= new ArrayList<>();
        if(!filtro.equals("")){
            String sql = "SELECT idPelicula, nombre, foto FROM pelicula where nombre like ? and estado=1";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "%"+filtro+"%");
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        BPelicula pelicula = new BPelicula();
                        pelicula.setIdPelicula(rs.getInt(1));
                        pelicula.setNombre(rs.getString(2));
                        pelicula.setFoto(rs.getString(3));
                        listaPelis.add(pelicula);
                    }
                }
            } catch (SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            listaPelis= this.mejores6PeliculasActivas();
        }
        return listaPelis;
    }
    private ArrayList<BPelicula> mejores6PeliculasActivas(){
        ArrayList<BPelicula> lista= new ArrayList<>();
        String sql= "select p.idPelicula, p.nombre, p.foto, p.calificacionPelicula, f.fecha from pelicula p " +
                "inner join funcion f on p.idPelicula = f.Pelicula_idPelicula " +
                "where f.fecha>=CURRENT_DATE and p.estado=1" +
                " group by p.idPelicula " + //APARECE ERROR, PERO FUNCIONA XD NO TOCAR
                "order by p.calificacionPelicula desc, f.fecha asc " +
                "limit 0,16"; //Inprimimos los 16 mejores calificados, que no hayan pasado sus funciones y
                //que los más próximos
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BPelicula pelicula = new BPelicula();
                    pelicula.setIdPelicula(rs.getInt(1));
                    pelicula.setNombre(rs.getString(2));
                    pelicula.setFoto(rs.getString(3));
                    lista.add(pelicula);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return lista;
    }
}
