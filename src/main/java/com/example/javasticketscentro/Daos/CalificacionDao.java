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

    public ArrayList<BCelebridad> listarDirectorPorID(int idPersona, int idPelicula) {
        ArrayList<BCelebridad> celebridades = new ArrayList<>();
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.idCelebridad,  cc.puntaje, cc.Persona_idPersona from pelicula pe \n" +
                "            inner join celebridad_por_pelicula cp on pe.idPelicula = cp.Pelicula_idPelicula\n" +
                "            inner join celebridad ce on cp.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "            inner join calificacion_celebridad cc on cc.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "where pe.idPelicula = ? and cc.Persona_idPersona = ? and ce.rol = 'director' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            pstmt.setInt(2, idPersona);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BCelebridad celebridad = new BCelebridad();
                    celebridad.setNombre(resultSet.getString(1));
                    celebridad.setApellido(resultSet.getString(2));
                    celebridad.setFoto(resultSet.getString(3));
                    celebridad.setIdCelebridad(resultSet.getInt(4));
                    celebridad.setPuntaje(resultSet.getInt(5));
                    celebridad.setIdPersona(resultSet.getInt(6));
                    celebridades.add(celebridad);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return celebridades;
    }

    public ArrayList<BCelebridad> listarActorPorID(int idPersona, int idPelicula) {
        ArrayList<BCelebridad> celebridades = new ArrayList<>();
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.idCelebridad from pelicula pe " +
                "                               left join celebridad_por_pelicula cp on pe.idPelicula = cp.Pelicula_idPelicula " +
                "  left join celebridad ce on cp.Celebridad_idCelebridad = ce.idCelebridad " +
                " where pe.idPelicula=? and ce.rol = 'actor'";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if(resultSet.next()){
                    celebridades= new ArrayList<>();
                    BCelebridad celebridad = new BCelebridad();
                    celebridad.setNombre(resultSet.getString(1));
                    celebridad.setApellido(resultSet.getString(2));
                    celebridad.setFoto(resultSet.getString(3));
                    celebridad.setIdCelebridad(resultSet.getInt(4));
                    celebridades.add(celebridad);
                    while (resultSet.next()) {
                        celebridad = new BCelebridad();
                        celebridad.setNombre(resultSet.getString(1));
                        celebridad.setApellido(resultSet.getString(2));
                        celebridad.setFoto(resultSet.getString(3));
                        celebridad.setIdCelebridad(resultSet.getInt(4));
                        celebridades.add(celebridad);
                    }
                }
            }
            for(BCelebridad bCelebridad:celebridades){
                if(!existe_puntaje1(idPersona,bCelebridad.getIdCelebridad())) {
                    anadirPuntajePorCelebridad(idPersona,bCelebridad.getIdCelebridad(),0);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return celebridades;
    }



    public boolean existe_puntaje(int idPersona, int idPelicula){
        String sql="select * from calificacion where Pelicula_idPelicula=? and Persona_idPersona = ?";
        boolean existe = false;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPelicula);
            pstmt.setInt(2, idPersona);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    existe=true;
                }
            }
        }

        catch( SQLException e){
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return existe;
    }
    public void anadirPuntajePorPelicula(int idPersona, int idPelicula, int puntaje) {

        if(existe_puntaje(idPersona,idPelicula)){
            String sql = "UPDATE calificacion\n" +
                    "SET puntaje = ?\n" +
                    "where Pelicula_idPelicula = ? and Persona_idPersona = ?";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setInt(1, puntaje);
                pstmt.setInt(2, idPelicula);
                pstmt.setInt(3, idPersona);
                pstmt.executeUpdate();
            }

            catch( SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else {
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

}


    public boolean existe_puntaje1(int idPersona, int idCelebridad){
        String sql = "select * from calificacion_celebridad where Persona_idPersona = ? and Celebridad_idCelebridad = ?";
        boolean existe = false;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPersona);
            pstmt.setInt(2, idCelebridad);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    existe=true;
                }
            }
        }catch( SQLException e){
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return existe;
    }
    public void anadirPuntajePorCelebridad(int idPersona,int idCelebridad,int puntaje){
        if(existe_puntaje1(idPersona, idCelebridad)){
            String sql = "UPDATE calificacion_celebridad SET puntaje = ? " +
                    "where Celebridad_idCelebridad = ? and Persona_idPersona = ?";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, puntaje);
                pstmt.setInt(2, idCelebridad);
                pstmt.setInt(3, idPersona);
                pstmt.executeUpdate();
            } catch(SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            String sql = "INSERT INTO calificacion_celebridad (Celebridad_idCelebridad, Persona_idPersona,puntaje)\n" +
                    "VALUES (?, ?, ?)";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, idCelebridad);
                pstmt.setInt(2, idPersona);
                pstmt.setInt(3, puntaje);
                pstmt.executeUpdate();
            } catch(SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }
    }

    public int puntajePeliculaPorId(int idPersona, int idPelicula){
        int puntaje = 0;
        String sql = "select puntaje from calificacion where Persona_idPersona = ? and Pelicula_idPelicula = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,idPersona);
            pstmt.setInt(2, idPelicula);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    puntaje = resultSet.getInt(1);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return puntaje;
    }
    public int puntajeCelebridadPorId(int idPersona, int idCelebridad){
        int puntaje = 0;
        String sql = "select puntaje from calificacion_celebridad where Persona_idPersona = ? and Celebridad_idCelebridad = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,idPersona);
            pstmt.setInt(2, idCelebridad);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    puntaje = resultSet.getInt(1);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return puntaje;
    }
}
