package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Beans.Bhistorial_detalle;

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
                    Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));
                    bhistorial.setSede(rs.getString(3));
                    bhistorial.setTotal(rs.getDouble(4));

                    listaHistorial.add(bhistorial);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaHistorial;
    }

    public ArrayList<Bhistorial> Historial(String cliente) {
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
                    Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));
                    bhistorial.setSede(rs.getString(3));
                    bhistorial.setTotal(rs.getDouble(4));

                    listaHistorial.add(bhistorial);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaHistorial;
    }

    public ArrayList<Bhistorial_detalle> Historial_detalle(String cliente, String sede) {
        ArrayList<Bhistorial_detalle> lista_detalle = new ArrayList<>();

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
                    Bhistorial_detalle bdetalle = new Bhistorial_detalle();
                    bdetalle.setUnidades(rs.getInt(1));
                    bdetalle.setPelicula(rs.getString(2));
                    bdetalle.setFecha(rs.getString(3));
                    bdetalle.setPrecio(rs.getDouble(4));
                    bdetalle.setEstado(rs.getString(5));
                    bdetalle.setTotal(rs.getDouble(6));

                    lista_detalle.add(bdetalle);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return lista_detalle;
    }

}
