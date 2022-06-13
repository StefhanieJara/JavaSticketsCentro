package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bcarrito;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.util.ArrayList;

public class CarritoDao {

    public void ingresarTarjeta(int numeroTarjeta, int cvv, String fechaVencimiento, String bancoNombre, String tipoTarjeta, String id_cliente){
        ArrayList<Bcarrito> listaCarrito = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";



        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "insert into tarjeta (numerotarjeta, fechavencimiento, cvv, banco,Persona_idPersona, tipo) value (?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {
             preparedStatement.setInt(1,numeroTarjeta);
             preparedStatement.setString(2, fechaVencimiento);
             preparedStatement.setInt(3,cvv);
             preparedStatement.setString(4,bancoNombre);
            preparedStatement.setString(5,id_cliente);
             preparedStatement.setString(6,tipoTarjeta);
             preparedStatement.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        }

}
