package com.example.javasticketscentro.Daos;
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
             ResultSet rs = stmt.executeQuery("select idPersona,nombre,apellido,numeroCelular,fechaDeNacimiento,email,direccionCliente from persona");) {

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
}
