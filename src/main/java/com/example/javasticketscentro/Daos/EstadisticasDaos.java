package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;

import java.sql.*;
import java.util.ArrayList;

public class EstadisticasDaos extends BaseDao{

    public ArrayList<BFuncion> listarAsistencia(String fecha1, String fecha2) {
        ArrayList<BFuncion> funciones = null;
        String sql = "select truncate(sum(cantidadButaca)*100/stock, 2), idFuncion , p.nombre  from sede se\n" +
                "\tinner join sala sa on se.idSede = sa.Sede_idSede\n" +
                "    inner join funcion_has_sala fs on sa.idSala = fs.Sala_idSala\n" +
                "    inner join funcion f on fs.Funcion_idFuncion = f.idFuncion\n" +
                "    inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "    inner join ticket t on f.idFuncion = t.Funcion_idFuncion\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, fecha1);
            pstmt.setString(2, fecha2);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setAsistencia(resultSet.getFloat(1));
                    funcion.setId(resultSet.getInt(2));
                    funciones.add(funcion);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return funciones;
    }

}
