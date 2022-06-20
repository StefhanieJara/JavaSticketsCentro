
package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Beans.Bhistorial_detalle;

import java.sql.*;
import java.util.ArrayList;

public class HistorialDao extends BaseDao{

    public ArrayList<Bhistorial> listaTickets(int idCliente) {

        ArrayList<Bhistorial> tickets = new ArrayList<>();


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
                "WHERE p.idPersona = ?) AS subquery;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1,idCliente);
            try(ResultSet rs= pstmt.executeQuery()){
                while (rs.next()) {
                    Bhistorial bhistorial = new Bhistorial();
                    bhistorial.setFecha_compra(rs.getString(1));
                    bhistorial.setCodigo(rs.getString(2));
                    bhistorial.setTotal(rs.getDouble(3));
                    tickets.add(bhistorial);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tickets;
    }

    public ArrayList<Bhistorial_detalle> buscarFuncionesDeTicket(String codigo) {
        ArrayList<Bhistorial_detalle> funcionesTicket = new ArrayList<>();

        String sql = "SELECT t.cantidadButaca as Unidades, " +
                "                    pel.nombre as Pelicula, " +
                "                    se.nombre as Sede, " +
                "                    concat(f.fecha,' - ',f.horaInicio) as FechaDeLaFuncion, " +
                "                    f.precio as PrecioPorTicket,  " +
                "                    pel.idPelicula as IdPelicula, " +
                "                    f.idFuncion as idFuncion " +
                "                FROM persona p  " +
                "                    inner join compra c on (p.idPersona = c.Persona_idPersona) " +
                "                    inner join ticket t on (c.idCompra = t.Compra_idCompra) " +
                "                    inner join funcion f on (t.Funcion_idFuncion = f.idFuncion) " +
                "                    inner join pelicula pel on (f.Pelicula_idPelicula = pel.idPelicula) " +
                "                    inner join funcion_has_sala fs on (f.idFuncion = fs.Funcion_idFuncion) " +
                "                    inner join sala sa on (fs.Sala_idSala = sa.idSala) " +
                "                    inner join sede se on (sa.Sede_idSede = se.idSede) " +
                "                WHERE c.idCompra = ?;";

        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);) {

            preparedStatement.setString(1,codigo);

            try(ResultSet rs = preparedStatement.executeQuery();){
                while (rs.next()) {
                    Bhistorial_detalle bhistorial_detalle = new Bhistorial_detalle();
                    bhistorial_detalle.setUnidades(rs.getInt(1));
                    bhistorial_detalle.setPelicula(rs.getString(2));
                    bhistorial_detalle.setSede(rs.getString(3));
                    bhistorial_detalle.setFecha(rs.getString(4));
                    bhistorial_detalle.setPrecio(rs.getDouble(5));
                    bhistorial_detalle.setIdPelicula(rs.getInt(6));
                    bhistorial_detalle.setIdFuncion(rs.getInt(7));
                    funcionesTicket.add(bhistorial_detalle);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return funcionesTicket;

    }

    public void borrar(String ticketId, int funcionId) {

        String sql = "delete from ticket where (Compra_idCompra = ? and Funcion_idFuncion = ?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, ticketId);
            pstmt.setInt(2, funcionId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
