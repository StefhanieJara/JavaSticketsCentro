package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BCalificacion;
import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPelicula;

import java.sql.*;
import java.util.ArrayList;

public class CalificacionDao extends BaseDao {

    public BPelicula listarPelicula(int idPelicula) {
        BPelicula pelicula = null;
        String sql = "select pe.nombre, pe.idPelicula, pe.foto from pelicula pe where idPelicula = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setIdPelicula(resultSet.getInt(2));
                    pelicula.setFoto(resultSet.getString(3));
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return pelicula;
    }

    public ArrayList<BCelebridad> listarDirectorPorID(int idPelicula) {
        ArrayList<BCelebridad> celebridades = null;
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.idCelebridad from pelicula pe \n" +
                "\t\t\tinner join celebridad_por_pelicula cp on pe.idPelicula = cp.Pelicula_idPelicula\n" +
                "            inner join celebridad ce on cp.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "where pe.idPelicula = ? and ce.rol = 'director' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BCelebridad celebridad = new BCelebridad();
                    celebridad.setNombre(resultSet.getString(1));
                    celebridad.setApellido(resultSet.getString(2));
                    celebridad.setFoto(resultSet.getString(3));
                    celebridad.setIdCelebridad(resultSet.getInt(4));
                    celebridades.add(celebridad);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return celebridades;
    }

    public ArrayList<BCelebridad> listarActorPorID(int idPelicula) {
        ArrayList<BCelebridad> celebridades = null;
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.idCelebridad from pelicula pe \n" +
                "\t\t\tinner join celebridad_por_pelicula cp on pe.idPelicula = cp.Pelicula_idPelicula\n" +
                "            inner join celebridad ce on cp.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "where pe.idPelicula = ? and ce.rol = 'actor' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BCelebridad celebridad = new BCelebridad();
                    celebridad.setNombre(resultSet.getString(1));
                    celebridad.setApellido(resultSet.getString(2));
                    celebridad.setFoto(resultSet.getString(3));
                    celebridad.setIdCelebridad(resultSet.getInt(4));
                    celebridades.add(celebridad);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return celebridades;
    }

    public void anadirPuntajePorPelicula(int idPersona, int idPelicula, int puntaje) {

        String sql = "INSERT INTO calificacion (Pelicula_idPelicula, puntaje, Persona_idPersona)\n" +
                "VALUES (?, ?, ?) ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(2, puntaje);
            pstmt.setInt(1, idPelicula);
            pstmt.setInt(3, idPersona);
            pstmt.executeUpdate();
        }

    catch( SQLException e){
        System.out.println("Hubo un error en la conexión!");
        e.printStackTrace();
    }
}


    public void anadirPuntajePorCelebridad(int idPersona,int idCelebridad,int puntaje){
        String sql = "INSERT INTO calificacion_celebridad (Celebridad_idCelebridad, puntaje, Persona_idPersona)\n" +
                "VALUES (?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idCelebridad);
            pstmt.setInt(2, puntaje);
            pstmt.setInt(3, idPersona);
            pstmt.executeUpdate();
        }

        catch( SQLException e){
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

}
