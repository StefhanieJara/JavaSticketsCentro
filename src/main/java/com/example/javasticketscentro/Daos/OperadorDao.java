package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.sql.*;
import java.util.ArrayList;

public class OperadorDao {

    public static ArrayList<BPelicula> listapeliculas() {

        ArrayList<BPelicula> listapeliculas = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select pe.nombre, pe.restriccionEdad, pe.sinopsis,pe.duracion,pe.genero, pe.foto, fu.precio, fu.stock, fu.horaInicio,fu.fecha from pelicula pe\n" +
                "\tinner join funcion fu on pe.idPelicula=fu.Pelicula_idPelicula;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BPelicula bPelicula = new BPelicula();
                bPelicula.setNombre(rs.getString(1));
                bPelicula.setRestricconEdad(rs.getString(2));
                bPelicula.setSinopsis(rs.getString(3));
                bPelicula.setDuracion(rs.getString(4));
                bPelicula.setGenero(rs.getString(5));
                bPelicula.setFoto(rs.getString(6));
                bPelicula.setPrecio_peli(rs.getDouble(7));
                bPelicula.setStock(rs.getInt(8));
                bPelicula.setHoraInicio(rs.getString(9));
                bPelicula.setFecha(rs.getString(10));
                listapeliculas.add(bPelicula);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listapeliculas;
    }
    public static ArrayList<BPersonal> listapersonal() {

        ArrayList<BPersonal> listapersonal = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select per.idPersonal,per.nombre, per. apellido, per.Sede_idSede, se.nombre from personal per\n" +
                "\tinner join sede se on per.Sede_idSede= se.idSede;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BPersonal bPersonal = new BPersonal();
                bPersonal.setIdPersonal(rs.getInt(1));
                bPersonal.setNombre(rs.getString(2));
                bPersonal.setApellido(rs.getString(3));
                bPersonal.setIdSede(rs.getInt(4));
                bPersonal.setNombre_sede(rs.getString(5));
                listapersonal.add(bPersonal);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listapersonal;
    }

    public void añadirPersonal(String nombre, String apellido, int Sede_idSede) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into personal (nombre, apellido, Sede_idSede) values (?,?,?);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt= connection.prepareStatement(sql)){
             pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3,Sede_idSede);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public BPersonal buscarPorId(int id) {
        BPersonal bPersonal  = new BPersonal();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select * from personal where idPersonal= ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    bPersonal.setIdPersonal(rs.getInt(1));
                    bPersonal.setNombre(rs.getString(2));
                    bPersonal.setApellido(rs.getString(3));
                    bPersonal.setIdSede(rs.getInt(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return bPersonal;
    }
    public void actualizarPersonal(int idPersonal, String nombre, String apellido, int Sede_idSede) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "update personal set nombre = ?, apellido= ?, Sede_idSede= ? where idPersonal= ?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt= connection.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3,Sede_idSede);
            pstmt.setInt(4,idPersonal);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
