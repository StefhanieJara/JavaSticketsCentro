package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.concurrent.locks.StampedLock;

public class OperadorDao extends BaseDao{

    public ArrayList<BPelicula> listapeliculas(String nombre, int pagina, int cant_result, boolean limit) {
        String sql;
        ArrayList<BPelicula> listapeliculas = new ArrayList<>();
        int posicion=0;
        if(limit){
            posicion=(pagina-1)*cant_result;
            sql = "select pe.idPelicula,pe.nombre, pe.restriccionEdad, pe.sinopsis,pe.duracion,pe.genero, pe.foto from pelicula pe " +
                    "where pe.nombre like ? limit ?,"+cant_result;
        }else{
            sql = "select pe.idPelicula,pe.nombre, pe.restriccionEdad, pe.sinopsis,pe.duracion,pe.genero, pe.foto from pelicula pe " +
                    "where pe.nombre like ? ";
        }
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, "%"+nombre+"%");
            if(limit){
                pstmt.setInt(2, posicion);
            }
            try(ResultSet rs= pstmt.executeQuery();){
                while (rs.next()) {
                    BPelicula bPelicula = new BPelicula();
                    bPelicula.setIdPelicula(rs.getInt(1));
                    bPelicula.setNombre(rs.getString(2));
                    bPelicula.setRestriccionEdad(rs.getString(3));
                    bPelicula.setSinopsis(rs.getString(4));
                    bPelicula.setDuracion(rs.getString(5));
                    bPelicula.setGenero(rs.getString(6));
                    bPelicula.setFoto(rs.getString(7));
                    listapeliculas.add(bPelicula);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listapeliculas;
    }

    public void deshabilitarPelicula(int idPelicula){
        String sql = "UPDATE pelicula SET estado = 0 where pelicula.idPelicula=?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt= connection.prepareStatement(sql)){
            pstmt.setInt(1, idPelicula);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deshabilitarFuncion(int idFuncion){
        String sql = "UPDATE funcion SET habilitado = 0 where idFuncion=?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt= connection.prepareStatement(sql)){
            pstmt.setInt(1, idFuncion);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarPelicula(int idPelicula, String nombre, String genero, String duracion, String restriccion, String sinopsis, String URLFoto){
        String sql = "update pelicula set nombre = ?, restriccionEdad = ?, sinopsis = ?, duracion = ?, foto= ?, genero = ? where idPelicula=?;";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, nombre);
            pstmt.setString(2, restriccion);
            pstmt.setString(3, sinopsis);
            pstmt.setString(4, duracion);
            pstmt.setString(5, URLFoto);
            pstmt.setString(6, genero);
            pstmt.setInt(7, idPelicula);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void crearPelicula(String nombre, String genero, String duracion, String restriccion, String sinopsis, String URLFoto){
        String sql = "INSERT INTO centro1.pelicula (nombre, restriccionEdad, sinopsis, duracion, foto, calificacionPelicula, genero, estado)\n" +
                "values (?, ?, ?, ?, ?,?,?,1);";
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
    }

    public BPelicula obtenerPelicula(int idPelicula){
        BPelicula pelicula = new BPelicula();
        String sql = "select * from pelicula where idPelicula=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt= connection.prepareStatement(sql)){
            pstmt.setInt(1, idPelicula);
            try(ResultSet rs= pstmt.executeQuery();){
                while (rs.next()) {
                    pelicula.setIdPelicula(rs.getInt(1));
                    pelicula.setNombre(rs.getString(2));
                    pelicula.setRestriccionEdad(rs.getString(3));
                    pelicula.setSinopsis(rs.getString(4));
                    pelicula.setDuracion(rs.getString(5));
                    pelicula.setFoto(rs.getString(6));
                    pelicula.setGenero(rs.getString(8));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pelicula;
    }

    public ArrayList<BFuncion> listarFunciones(String fecha, String idSede, int pagina, int cant_result, boolean limit){
        PeliculaDao funcionDeshab=new PeliculaDao();
        ArrayList<BFuncion> listaDeFunciones = new ArrayList<>();
        String sql;
        int posicion=0;
        if(limit){
            posicion=(pagina-1)*cant_result;
            sql = "select p.idPelicula, p.nombre, p.foto, f.idFuncion, f.precio, f.stock, f.fecha, f.horaInicio, s.numero, se.nombre\n" +
                    "from pelicula p inner join funcion f on p.idPelicula = f.Pelicula_idPelicula\n" +
                    "inner join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion\n" +
                    "inner join sala s on fhs.Sala_idSala = s.idSala\n" +
                    "inner join sede se on s.Sede_idSede = se.idSede\n" +
                    "where (p.estado=1 and f.habilitado=1) and s.idSala like ? and f.fecha like ? limit ?,"+cant_result;
        }else{
            sql = "select p.idPelicula, p.nombre, p.foto, f.idFuncion, f.precio, f.stock, f.fecha, f.horaInicio, s.numero, se.nombre\n" +
                    "from pelicula p inner join funcion f on p.idPelicula = f.Pelicula_idPelicula\n" +
                    "inner join funcion_has_sala fhs on f.idFuncion = fhs.Funcion_idFuncion\n" +
                    "inner join sala s on fhs.Sala_idSala = s.idSala\n" +
                    "inner join sede se on s.Sede_idSede = se.idSede\n" +
                    "where (p.estado=1 and f.habilitado=1) and s.idSala like ? and f.fecha like ?;";
        }

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, "%"+idSede+"%");
            pstmt.setString(2, "%"+fecha+"%");
            if(limit){
                pstmt.setInt(3, posicion);
            }
            try(ResultSet rs= pstmt.executeQuery();){
                while (rs.next()) {
                    BFuncion bFuncion = new BFuncion();
                    BSala bSala = new BSala();
                    BSede bSede = new BSede();
                    BPelicula bPelicula = new BPelicula();
                    bPelicula.setIdPelicula(rs.getInt(1));
                    bPelicula.setNombre(rs.getString(2));
                    bPelicula.setFoto(rs.getString(3));
                    bFuncion.setIdFuncion(rs.getInt(4));
                    bFuncion.setPrecio(rs.getDouble(5));
                    bFuncion.setStock(rs.getInt(6));
                    bFuncion.setFecha(rs.getString(7));
                    bFuncion.setHoraInicio(rs.getString(8));
                    bSala.setNumero(rs.getInt(9));
                    bSede.setNombre(rs.getString(10));
                    bFuncion.setbSala(bSala);
                    bFuncion.setbPelicula(bPelicula);
                    bFuncion.setbSede(bSede);

                    funcionDeshab.deshabilitarFuncion(bFuncion);
                    listaDeFunciones.add(bFuncion);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaDeFunciones;
    }

    public ArrayList<BSala> listarSalas(){
        String sql="select * from sala " +
                "    inner join sede s on sala.Sede_idSede = s.idSede;";
        ArrayList<BSala> salas= new ArrayList<>();
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql);){
            while(rs.next()){
                BSala sala= new BSala();
                BSede sede= new BSede();
                sede.setIdSede(rs.getInt(1));
                sala.setAforo(rs.getInt(2));
                sala.setIdSala(rs.getInt(3));
                sala.setNumero(rs.getInt(4));
                sede.setNombre(rs.getString(6));
                sede.setDireccion(rs.getString(7));
                sala.setbSede(sede);
                salas.add(sala);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salas;
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
