package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bcarrito;

import java.sql.*;
import java.util.ArrayList;

public class CarritoDao {
    public ArrayList<Bcarrito> Resumen(String textoBuscar) {
        ArrayList<Bcarrito> listaCarrito = new ArrayList<>();

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
                    Bcarrito bcarrito = new Bcarrito();
                    bcarrito.setNombre_peli(rs.getString(1));
                    bcarrito.setCantidad(rs.getInt(2));
                    bcarrito.setSubtotal(rs.getDouble(3));
                    bcarrito.setPrecio(rs.getDouble(4));
                    bcarrito.setSede(rs.getString(5));
                    listaCarrito.add(bcarrito);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaCarrito;
    }

}
