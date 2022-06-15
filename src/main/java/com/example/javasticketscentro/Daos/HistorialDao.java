
package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Beans.Bhistorial_detalle;

import java.sql.*;
import java.util.ArrayList;

public class HistorialDao extends BaseDao{
    /*public ArrayList<Bhistorial> Resumen(String textoBuscar) {
        ArrayList<Bhistorial> listaHistorial = new ArrayList<>();


        String sql = "SELECT distinct subquery.FechaDeCompra as 'Fecha de compra', " +
                " subquery.Codigo as 'Codigo', " +
                " subquery.Total as 'Total' " +
                "FROM (SELECT p.idPersona as Usuario, " +
                "   c.fechaCompra as FechaDeCompra, " +
                "   c.idCompra as Codigo, " +
                "   se.nombre as Sede, " +
                "        concat(f.fecha,' - ',f.horaInicio) as FechaDeLaFuncion, " +
                "        c.montoTotal as Total, " +
                "        t.cantidadButaca as Unidades, " +
                "        pel.nombre as Pelicula, " +
                "        f.precio as PrecioPorTicket " +
                "FROM persona p " +
                "    inner join compra c on (p.idPersona = c.Persona_idPersona)" +
                "    inner join ticket t on (c.idCompra = t.Compra_idCompra) " +
                "    inner join funcion f on (t.Funcion_idFuncion = f.idFuncion) " +
                "    inner join pelicula pel on (f.Pelicula_idPelicula = pel.idPelicula) " +
                "    inner join funcion_has_sala fs on (f.idFuncion = fs.Funcion_idFuncion) " +
                "    inner join sala sa on (fs.Sala_idSala = sa.idSala) " +
                "    inner join sede se on (sa.Sede_idSede = se.idSede) " +
                "WHERE p.idPersona = 1) AS subquery;";

        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {


            try (ResultSet rs = preparedStatement.executeQuery();) {
                while (rs.next()) {
                    Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));

                    bhistorial.setTotal(rs.getDouble(3));

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

        String sql = "SELECT tablita.Unidades as 'Unidades', " +
                " tablita.Pelicula as 'Pelicula', " +
                "        tablita.Sede as 'Sede', " +
                "        tablita.FechaDeLaFuncion as 'Fecha de la funcion', " +
                "        tablita.PrecioPorTicket as 'Precio por ticket' " +
                "FROM (SELECT p.idPersona as Usuario, " +
                "   c.fechaCompra as FechaDeCompra, " +
                "   c.idCompra as Codigo, " +
                "   se.nombre as Sede, " +
                "   concat(f.fecha,' - ',f.horaInicio) as FechaDeLaFuncion, " +
                "   c.montoTotal as Total, " +
                "   t.cantidadButaca as Unidades, " +
                "   pel.nombre as Pelicula, " +
                "   f.precio as PrecioPorTicket " +
                "FROM persona p " +
                "    inner join compra c on (p.idPersona = c.Persona_idPersona) " +
                "    inner join ticket t on (c.idCompra = t.Compra_idCompra) " +
                "    inner join funcion f on (t.Funcion_idFuncion = f.idFuncion) " +
                "    inner join pelicula pel on (f.Pelicula_idPelicula = pel.idPelicula) " +
                "    inner join funcion_has_sala fs on (f.idFuncion = fs.Funcion_idFuncion) " +
                "    inner join sala sa on (fs.Sala_idSala = sa.idSala) " +
                "    inner join sede se on (sa.Sede_idSede = se.idSede) " +
                "WHERE p.idPersona = 1) AS tablita " +
                "WHERE tablita.Codigo = '10793DD';";

        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {


            try (ResultSet rs = preparedStatement.executeQuery();) {
                while (rs.next()) {
                    Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));
                    bhistorial.setTotal(rs.getDouble(3));

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

        String sql = "select * from  where blabla";

        try (Connection connection = this.getConnection();
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
                    bdetalle.setSede(rs.getString(7));

                    lista_detalle.add(bdetalle);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return lista_detalle;
    }*/

}
