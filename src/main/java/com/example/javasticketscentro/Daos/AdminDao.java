package com.example.javasticketscentro.Daos;
import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import java.sql.*;
import java.util.ArrayList;

public class AdminDao {
    public static ArrayList<BPersona> listarCliente() {
        ArrayList<BPersona> listaClientes = new ArrayList<>();
        String user = "root";
        String pass = "123456";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select idPersona,nombre,apellido,numeroCelular,fechaDeNacimiento,email,direccionCliente from persona where rol = 'Cliente'");) {

            while (rs.next()) {
                BPersona bPersona = new BPersona();

                bPersona.setIdPer(rs.getInt(1));
                bPersona.setNombre(rs.getString(2));
                bPersona.setApellido(rs.getString(3));
                bPersona.setNumCel(rs.getInt(4));
                bPersona.setFecha_Nc(rs.getDate(5));
                bPersona.setEmail(rs.getString(6));
                bPersona.setDireccion(rs.getString(7));
                listaClientes.add(bPersona);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaClientes;
    }

    public static ArrayList<BPersona> listarOperador() {
        ArrayList<BPersona> listaOperadores = new ArrayList<>();
        String user = "root";
        String pass = "123456";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre,apellido,numeroCelular,fechaDeNacimiento,email,rol from persona where rol = 'Operador'");) {

            while (rs.next()) {
                BPersona bPersona = new BPersona();

                bPersona.setNombre(rs.getString(1));
                bPersona.setApellido(rs.getString(2));
                bPersona.setNumCel(rs.getInt(3));
                bPersona.setFecha_Nc(rs.getDate(4));
                bPersona.setEmail(rs.getString(5));
                bPersona.setRol(rs.getString(6));
                listaOperadores.add(bPersona);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaOperadores;
    }

    public static ArrayList<BCelebridad> listarCelebridad() {
        ArrayList<BCelebridad> listaCelebridad = new ArrayList<>();
        String user = "root";
        String pass = "123456";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre,apellido,rol  from celebridad");) {

            while (rs.next()) {
                BCelebridad bCelebridad = new BCelebridad();

                bCelebridad.setNombre(rs.getString(1));
                bCelebridad.setApellido(rs.getString(2));
                bCelebridad.setRol(rs.getString(3));
                listaCelebridad.add(bCelebridad);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCelebridad;
    }


}
