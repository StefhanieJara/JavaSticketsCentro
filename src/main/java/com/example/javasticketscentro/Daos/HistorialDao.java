package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bhistorial;

import java.sql.*;
import java.util.ArrayList;

public class HistorialDao {
    public ArrayList<Bhistorial> Resumen(String textoBuscar) {
        ArrayList<Bhistorial> listaHistorial = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select * from centro1 where blabla";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {


            try (ResultSet rs = preparedStatement.executeQuery();) {
                while (rs.next()) {
  /*                  Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));
                    bhistorial.setSede(rs.getString(3));
                    bhistorial.setFecha_funcion(rs.getString(4));
                    bhistorial.setTotal(rs.getDouble(5));
                    bhistorial.setEstado(rs.getString(5));
                    bhistorial.setUnidadades(rs.getInt(5));
                    bhistorial.setPelicula(rs.getString(5));
                    bhistorial.setPrecio_por_peli(rs.getDouble(5));
                    bhistorial.setTotal_detalle(rs.getDouble(5));

                    listaHistorial.add(bhistorial);*/
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaHistorial;
    }
}
