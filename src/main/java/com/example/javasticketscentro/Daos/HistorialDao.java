
package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Beans.Bhistorial_detalle;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;

public class HistorialDao extends BaseDao{

    public ArrayList<Bhistorial> listaTickets(int idCliente) {
        ArrayList<Bhistorial> tickets = new ArrayList<>();

        String sql = "SELECT distinct subquery.FechaDeCompra as 'Fecha de compra', \n" +
                "                 subquery.Codigo as 'Codigo', \n" +
                "                 subquery.Total as 'Total',\n" +
                "                 subquery.EstaCancelado as 'Cancelado'\n" +
                "                FROM (SELECT p.idPersona as Usuario, \n" +
                "                   c.fechaCompra as FechaDeCompra, \n" +
                "                   c.idCompra as Codigo,\n" +
                "                   se.nombre as Sede, \n" +
                "                        concat(f.fecha,' - ',f.horaInicio) as FechaDeLaFuncion, \n" +
                "                        c.montoTotal as Total, \n" +
                "                        t.cantidadButaca as Unidades, \n" +
                "                        pel.nombre as Pelicula, \n" +
                "                        f.precio as PrecioPorTicket,\n" +
                "                        c.cancelado as EstaCancelado\n" +
                "                FROM persona p \n" +
                "                    inner join compra c on (p.idPersona = c.Persona_idPersona)\n" +
                "                    inner join ticket t on (c.idCompra = t.Compra_idCompra) \n" +
                "                    inner join funcion f on (t.Funcion_idFuncion = f.idFuncion) \n" +
                "                    inner join pelicula pel on (f.Pelicula_idPelicula = pel.idPelicula) \n" +
                "                    inner join funcion_has_sala fs on (f.idFuncion = fs.Funcion_idFuncion) \n" +
                "                    inner join sala sa on (fs.Sala_idSala = sa.idSala) \n" +
                "                    inner join sede se on (sa.Sede_idSede = se.idSede) \n" +
                "                WHERE p.idPersona = ?) AS subquery\n" +
                "                WHERE subquery.EstaCancelado = 1;";

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

        if(entradasAgotadas(funcionId)){
            PeliculaDao habilitar= new PeliculaDao();
            habilitar.habilitarFuncion(funcionId);
        }
        actualizarCompra(ticketId,costoTotalCompra(ticketId)-calcularCostoTicket(ticketId,funcionId));
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, ticketId);
            pstmt.setInt(2, funcionId);
            pstmt.executeUpdate();
            if(!existeTicket(ticketId)){
                borrarCompra(ticketId);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    private double costoTotalCompra(String idCompra){
        String sql="select c.montoTotal from compra c where idCompra=?";
        double costo=0.0;
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idCompra);
            try(ResultSet rs= pstmt.executeQuery();){
                if(rs.next()){
                    costo= rs.getDouble(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return costo;
    }
    private void actualizarCompra(String idCompra,double costo){
        String sql="update compra set montoTotal=? where idCompra=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setDouble(1,costo);
            pstmt.setString(2, idCompra);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private double calcularCostoTicket(String ticketId,int funcionId){
        String sql="select t.cantidadButaca*f.precio from ticket t " +
                "inner join funcion f on t.Funcion_idFuncion = f.idFuncion " +
                "where t.Compra_idCompra=? and f.idFuncion=?;";
        double costo= 0.0;
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql)){
            pstmt.setString(1, ticketId);
            pstmt.setInt(2, funcionId);
            try(ResultSet rs= pstmt.executeQuery()  ;){
                if(rs.next()){
                    costo= rs.getDouble(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return costo;
    }
    private boolean entradasAgotadas(int idFuncion){
        boolean agotado=false;
        String sql="select  f.stock-sum(t.cantidadButaca) as `butacasRestantes`, f.idFuncion " +
                "from funcion f " +
                "   inner join ticket t on f.idFuncion = t.Funcion_idFuncion " +
                "   inner join compra c on t.Compra_idCompra = c.idCompra " +
                "where c.cancelado=1 and idFuncion=? " +
                "group by f.idFuncion";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1,idFuncion);
            try(ResultSet rs= pstmt.executeQuery();){
                if(rs.next()){
                    if(rs.getInt(1)==0){
                        agotado=true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return agotado;
    }
    private void borrarCompra(String idCompra){
        String sql = "delete from compra where idCompra = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private boolean existeTicket(String idCompra){
        boolean existe=true;
        String sql="select t.Compra_idCompra from compra c " +
                "left join ticket t on c.idCompra = t.Compra_idCompra " +
                "where c.idCompra=?;";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,idCompra);
            try(ResultSet rs=pstmt.executeQuery();){
                if(rs.next()){
                    if(rs.getString(1)==null){
                        existe=false;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existe;
    }
}
