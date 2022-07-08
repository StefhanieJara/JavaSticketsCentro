package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.sql.*;
import java.util.ArrayList;

public class OperadorDao extends BaseDao{

    public ArrayList<BPelicula> listapeliculas() {

        ArrayList<BPelicula> listapeliculas = new ArrayList<>();

        String sql = "select pe.nombre, pe.restriccionEdad, pe.sinopsis,pe.duracion,pe.genero, pe.foto, fu.precio, fu.stock, fu.horaInicio,fu.fecha from pelicula pe\n" +
                "\tinner join funcion fu on pe.idPelicula=fu.Pelicula_idPelicula;";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BPelicula bPelicula = new BPelicula();
                bPelicula.setNombre(rs.getString(1));
                bPelicula.setRestricconEdad(rs.getString(2));
                bPelicula.setSinopsis(rs.getString(3));
                bPelicula.setDuracion(rs.getString(4));
                bPelicula.setGenero(rs.getString(5));
                bPelicula.setFoto(rs.getString(6));
                bPelicula.setPrecio_peli(rs.getDouble(7));
                bPelicula.setStock(rs.getInt(8));
                bPelicula.setHoraInicio(rs.getString(9));
                bPelicula.setFecha(rs.getString(10));
                listapeliculas.add(bPelicula);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listapeliculas;
    }
    public ArrayList<BPersonal> listapersonal(String nombre, String apellido, int pagina, int cant_result, boolean limit) {

        ArrayList<BPersonal> listapersonal = new ArrayList<>();
        String sql;
        int posicion=0;
        if(limit){
            posicion=(pagina-1)*cant_result;
            sql = "select per.idPersonal,per.nombre, per. apellido, per.Sede_idSede, se.nombre from personal per " +
                    "                inner join sede se on per.Sede_idSede= se.idSede " +
                    "where per.nombre like ? and per.apellido like ? limit ?,"+cant_result;
        }else{
            sql = "select per.idPersonal,per.nombre, per. apellido, per.Sede_idSede, se.nombre from personal per " +
                    "                inner join sede se on per.Sede_idSede= se.idSede " +
                    "where per.nombre like ? and per.apellido like ?;";
        }
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, "%"+nombre+"%");
            pstmt.setString(2, "%"+apellido+"%");
            if(limit){
                pstmt.setInt(3, posicion);
            }
            try(ResultSet rs= pstmt.executeQuery();){
                while (rs.next()) {
                    BPersonal bPersonal = new BPersonal();
                    bPersonal.setIdPersonal(rs.getInt(1));
                    bPersonal.setNombre(rs.getString(2));
                    bPersonal.setApellido(rs.getString(3));
                    BSede bSede= new BSede();
                    bSede.setIdSede(rs.getInt(4));
                    bSede.setNombre(rs.getString(5));
                    bPersonal.setbSede(bSede);
                    listapersonal.add(bPersonal);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listapersonal;
    }

    public void añadirPersonal(String nombre, String apellido, int Sede_idSede) {

        String sql = "insert into personal (nombre, apellido, Sede_idSede) values (?,?,?);";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt= connection.prepareStatement(sql)){
             pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3,Sede_idSede);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public BPersonal buscarPorId(int id) {
        BPersonal bPersonal  = null;

        String sql = "select p.idPersonal,p.nombre, p. apellido, p.Sede_idSede, s.nombre from personal p " +
                "inner join sede s on p.Sede_idSede = s.idSede " +
                "where idPersonal= ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    bPersonal= new BPersonal();
                    bPersonal.setIdPersonal(rs.getInt(1));
                    bPersonal.setNombre(rs.getString(2));
                    bPersonal.setApellido(rs.getString(3));
                    BSede sede= new BSede();
                    sede.setIdSede(rs.getInt(4));
                    sede.setNombre(rs.getString(5));
                    bPersonal.setbSede(sede);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return bPersonal;
    }
    public void actualizarPersonal(int idPersonal, String nombre, String apellido, int Sede_idSede) {

        String sql = "update personal set nombre = ?, apellido= ?, Sede_idSede= ? where idPersonal= ?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt= connection.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3,Sede_idSede);
            pstmt.setInt(4,idPersonal);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void crearFuncion(String nombre, String genero, String fecha, String duracion, String restriccion,
                             int idsala, String sinopsis, String URLFoto, int stock, float precio, int idSede, int idDirector, int idActor1, String horaInicio){
        String sql = "INSERT INTO centro1.pelicula (nombre, restriccionEdad, sinopsis, duracion, foto, calificacionPelicula, genero)\n" +
                "values (?, ?, ?, ?, ?,?,?);";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, nombre);
            pstmt.setString(2, restriccion);
            pstmt.setString(3, sinopsis);
            pstmt.setString(4, duracion);
            pstmt.setString(5, URLFoto);
            pstmt.setDouble(6, 0.0);
            pstmt.setString(7, genero);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        int IDpeli = obtenerIdPelicula(nombre);
        asignarFuncion(precio, stock, IDpeli, fecha, horaInicio);
        int IDFuncion = obtenerIDFuncion(IDpeli, fecha, horaInicio);
        asignarCelebridad(IDpeli, idDirector);
        asignarCelebridad(IDpeli, idActor1);
        asignarSala(IDFuncion, idsala);
    }
    public int obtenerIdPelicula(String nombre){
        String sql = "Select idPelicula from pelicula where nombre = ?";
        int IDPeli=0;
        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, nombre);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    IDPeli = rs.getInt(1);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return IDPeli;
    }

    public int obtenerIDFuncion(int idPeli, String fecha, String horainicio){
        int IDfuncion = 0;
        String sql = "SELECT idFuncion from funcion where (Pelicula_idPelicula = ? AND fecha = ? AND horaInicio = ?)";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, idPeli);
            pstmt.setString(2, fecha);
            pstmt.setString(3, horainicio);
            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    IDfuncion = rs.getInt(1);
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return IDfuncion;
    }

    public void asignarFuncion(float precio, int stock, int IDPelicula, String fecha, String horaInicio){
        String sql = "INSERT INTO centro1.funcion (precio, stock, Pelicula_idPelicula, fecha, horaInicio)\n" +
                "values ( ? , ? , ? , ? , ?);";
        try (Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setFloat(1, precio);
            pstmt.setInt(2, stock);
            pstmt.setInt(3, IDPelicula);
            pstmt.setString(4, fecha);
            pstmt.setString(5, horaInicio);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void asignarSala(int IDFuncion, int idsala){
        String sql = "INSERT INTO funcion_has_sala (Funcion_idFuncion, Sala_idSala) VALUES (?,?)";
        try(Connection connection = this.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, IDFuncion);
            pstmt.setInt(2, idsala);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void asignarCelebridad(int IDpeli, int idCelebridad){
        String sql = "INSERT INTO celebridad_por_pelicula (Celebridad_idCelebridad, Pelicula_idPelicula) VALUES (?,?)";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, idCelebridad);
            pstmt.setInt(2, IDpeli);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void eliminarPersonal(int id){
        String sql="delete from personal where idPersonal=?;";
        try(Connection conn=this.getConnection();
            PreparedStatement ptmt= conn.prepareStatement(sql);){
            ptmt.setInt(1, id);
            ptmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
