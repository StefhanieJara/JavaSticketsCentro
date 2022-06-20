package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IndexDao extends BaseDao{
    public ArrayList<BPelicula> listaPeliculas(){
        ArrayList<BPelicula> listaPelis= new ArrayList<>();
        String sql = "SELECT idPelicula, nombre, foto FROM pelicula";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
        return listaPelis;
    }
}
