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

        String sql = "select p.nombre, f.precio, f.horaInicio as 'Hora de inicio', f.fecha, sa.numero as 'Sala', se.nombre as 'Sede'  from funcion f \n" +
                "\tinner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "    inner join ticket t on f.idFuncion = t.Funcion_idFuncion\n" +
                "    inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "    inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "    inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "    inner join compra c on t.Compra_idCompra = c.idCompra\n" +
                "    where c.Persona_idPersona = ?\n" +
                "    group by p.idPelicula";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {


            try (ResultSet rs = preparedStatement.executeQuery();) {
                while (rs.next()) {
                    Bcarrito bcarrito = new Bcarrito();
                    bcarrito.setPelicula(rs.getString(1));
                    bcarrito.setPrecio(rs.getDouble(2));
                    bcarrito.setHoraInicio(rs.getTime(3));
                    bcarrito.setFecha(rs.getDate(4));
                    bcarrito.setSala(rs.getInt(5));
                    bcarrito.setSede(rs.getString(6));
                    listaCarrito.add(bcarrito);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return listaCarrito;
    }

}
