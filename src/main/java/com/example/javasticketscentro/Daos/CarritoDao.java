package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BCompra;

import java.lang.invoke.StringConcatException;
import java.sql.*;
import java.util.ArrayList;

public class CarritoDao extends BaseDao{

    public void ingresarTarjeta(int numeroTarjeta, int cvv, String fechaVencimiento, String bancoNombre, String tipoTarjeta, String id_cliente){

        String sql = "insert into tarjeta (numerotarjeta, fechavencimiento, cvv, banco,Persona_idPersona, tipo) value (?,?,?,?,?,?)";

        try (Connection connection = this.getConnection();
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

    public void anadirTicket(int idFuncion, int idClient){
        String idCompra=detectarCompraActiva(idClient).getIdCompra();
        if(idCompra.equals("NoExiste")){
            idCompra= generarCodigoCompra();
            crearCompra(idCompra, idClient);
        }
        String sql="insert into ticket (Compra_idCompra, Funcion_idFuncion, qr, cantidadButaca, carrito) values (?,?,'xd',0,1)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void crearCompra(String idCompra, int idClient){
        //La fecha se asignará al momento de cancelar la compra
        String sql="insert into compra (idCompra, montoTotal, persona_idPersona, fechaCompra, cancelado) values (?,0.0,?,'0000-00-00',0)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, idCompra);
            pstmt.setInt(2,idClient);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public String generarCodigoCompra(){
        String codigo="";
        String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
        for (int i = 0; i < 7; i++ ) {
            codigo += letters[(int) Math.round(Math.random() * 15)];
        }
        System.out.println(codigo);
        return codigo;
    }
    public BCompra detectarCompraActiva(int idClient){
        BCompra bCompra=null;
        String sql = "select * from compra where persona_idPersona=? and cancelado=0";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, idClient);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    bCompra= new BCompra();
                    bCompra.setCancelado(rs.getInt(5));
                    bCompra.setIdCompra(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(bCompra==null){
            bCompra= new BCompra();
            bCompra.setIdCompra("NoExiste");
        }
        return bCompra;
    }
}
