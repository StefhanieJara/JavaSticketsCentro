package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.*;

import java.sql.*;
import java.util.ArrayList;

public class EstadisticasDaos extends BaseDao{

    public ArrayList<BFuncion> listarAsistencia(String fecha1, String fecha2) {
        ArrayList<BFuncion> funciones = new ArrayList<>();
        String sql = "select truncate(sum(cantidadButaca)*100/stock, 2) as ´Porcentaje´, idFuncion , p.nombre, sa.numero, se.nombre  from sede se\n" +
                "\tinner join sala sa on se.idSede = sa.Sede_idSede\n" +
                "    inner join funcion_has_sala fs on sa.idSala = fs.Sala_idSala\n" +
                "    inner join funcion f on fs.Funcion_idFuncion = f.idFuncion\n" +
                "    inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "    inner join ticket t on f.idFuncion = t.Funcion_idFuncion\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion order by ´Porcentaje´ desc ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, fecha1);
            pstmt.setString(2, fecha2);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setAsistencia(resultSet.getFloat(1));
                    funcion.setIdFuncion(resultSet.getInt(2));
                    BPelicula bPelicula = new BPelicula();
                    bPelicula.setNombre(resultSet.getString(3));
                    funcion.setbPelicula(bPelicula);
                    BSala sala = new BSala();
                    sala.setNumero(resultSet.getInt(4));
                    funcion.setbSala(sala);
                    BSede sede = new BSede();
                    sede.setNombre(resultSet.getString(5));
                    funcion.setbSede(sede);
                    funciones.add(funcion);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return funciones;
    }

    public ArrayList<BFuncion> listarAsistencia1() {
        ArrayList<BFuncion> funciones = new ArrayList<>();
        String sql = "select truncate(sum(cantidadButaca)*100/stock, 2) as ´Porcentaje´, idFuncion , p.nombre, sa.numero, se.nombre  from sede se\n" +
                "\tinner join sala sa on se.idSede = sa.Sede_idSede\n" +
                "    inner join funcion_has_sala fs on sa.idSala = fs.Sala_idSala\n" +
                "    inner join funcion f on fs.Funcion_idFuncion = f.idFuncion\n" +
                "    inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "    inner join ticket t on f.idFuncion = t.Funcion_idFuncion\n" +
                "where f.fecha > (select fecha from funcion order by fecha asc limit 1) and f.fecha < now() \n" +
                "group by f.idFuncion order by ´Porcentaje´ desc ";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setAsistencia(resultSet.getFloat(1));
                    funcion.setIdFuncion(resultSet.getInt(2));
                    BPelicula bPelicula = new BPelicula();
                    bPelicula.setNombre(resultSet.getString(3));
                    funcion.setbPelicula(bPelicula);
                    BSala sala = new BSala();
                    sala.setNumero(resultSet.getInt(4));
                    funcion.setbSala(sala);
                    BSede sede = new BSede();
                    sede.setNombre(resultSet.getString(5));
                    funcion.setbSede(sede);
                    funciones.add(funcion);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return funciones;
    }

    public ArrayList<BFuncion> listarGenero(){
        ArrayList<BFuncion> generos = new ArrayList<>();
        String sql = "select  p.nombre , p.genero \n" +
                "from funcion f  inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "group by p.nombre";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
                while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setGenero(resultSet.getString(2));
                    funcion.setbPelicula(pelicula);
                    generos.add(funcion);
                }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return generos;
    }


    public ArrayList<BFuncion> listarPorGenero(String genero){
        ArrayList<BFuncion> generos = new ArrayList<>();
        String sql = "select  p.nombre, p.genero \n" +
                "from funcion f  inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "where p.genero = ?\n" +
                "group by p.nombre";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1,genero);
            try(ResultSet resultSet = pstmt.executeQuery()){
                while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setGenero(resultSet.getString(2));
                    funcion.setbPelicula(pelicula);
                    generos.add(funcion);
                }
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return generos;
    }

    public ArrayList<BFuncion> listarGenero1(){
        ArrayList<BFuncion> generos = new ArrayList<>();
        String sql = "select p.genero \n" +
                "from funcion f  inner join pelicula p on p.idPelicula = f.Pelicula_idPelicula\n" +
                "group by p.genero";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                BFuncion funcion = new BFuncion();
                BPelicula pelicula = new BPelicula();
                pelicula.setGenero(resultSet.getString(1));
                funcion.setbPelicula(pelicula);
                generos.add(funcion);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return generos;
    }


    public ArrayList<BFuncion> listarMasVista(String fecha1, String fecha2){
        ArrayList<BFuncion> vistas = new ArrayList<>();
        String sql = "select * from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre, f.stock, p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ desc) t1\n" +
                "where t1.´Butacas´ = (select max(´Butacas´) from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre, f.stock, p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ desc) t)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, fecha1);
            pstmt.setString(2, fecha2);
            pstmt.setString(3, fecha1);
            pstmt.setString(4, fecha2);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setIdFuncion(resultSet.getInt(2));
                    funcion.setStock(resultSet.getInt("stock"));
                    funcion.setButacas(resultSet.getInt(3));
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setFoto(resultSet.getString("foto"));
                    funcion.setbPelicula(pelicula);
                    BSala sala = new BSala();
                    sala.setNumero(resultSet.getInt("numero"));
                    funcion.setbSala(sala);
                    BSede sede = new BSede();
                    sede.setNombre(resultSet.getString("nombre"));
                    funcion.setbSede(sede);
                    vistas.add(funcion);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return vistas;
    }

    public ArrayList<BFuncion> listarMasVista1(){
        ArrayList<BFuncion> vistas = new ArrayList<>();
        String sql = "select * from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > (select fecha from funcion order by fecha asc limit 1) and f.fecha < now()\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ desc) t1\n" +
                "where t1.´Butacas´ = (select max(´Butacas´) from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where  f.fecha > (select fecha from funcion order by fecha asc limit 1) and f.fecha < now()\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ desc) t)";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
             while (resultSet.next()) {
                 BFuncion funcion = new BFuncion();
                 funcion.setIdFuncion(resultSet.getInt(2));
                 funcion.setStock(resultSet.getInt("stock"));
                 funcion.setButacas(resultSet.getInt(3));
                 BPelicula pelicula = new BPelicula();
                 pelicula.setNombre(resultSet.getString(1));
                 pelicula.setFoto(resultSet.getString("foto"));
                 funcion.setbPelicula(pelicula);
                 BSala sala = new BSala();
                 sala.setNumero(resultSet.getInt("numero"));
                 funcion.setbSala(sala);
                 BSede sede = new BSede();
                 sede.setNombre(resultSet.getString("nombre"));
                 funcion.setbSede(sede);
                 vistas.add(funcion);
             }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return vistas;
    }

    public ArrayList<BFuncion> listarMenosVista(String fecha1, String fecha2){
        ArrayList<BFuncion> vistas = new ArrayList<>();
        String sql = "select * from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ asc) t1\n" +
                "where t1.´Butacas´ = (select min(´Butacas´) from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > ? and f.fecha < ?\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ asc) t)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, fecha1);
            pstmt.setString(2, fecha2);
            pstmt.setString(3, fecha1);
            pstmt.setString(4, fecha2);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setIdFuncion(resultSet.getInt(2));
                    funcion.setStock(resultSet.getInt("stock"));
                    funcion.setButacas(resultSet.getInt(3));
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setFoto(resultSet.getString("foto"));
                    funcion.setbPelicula(pelicula);
                    BSala sala = new BSala();
                    sala.setNumero(resultSet.getInt("numero"));
                    funcion.setbSala(sala);
                    BSede sede = new BSede();
                    sede.setNombre(resultSet.getString("nombre"));
                    funcion.setbSede(sede);
                    vistas.add(funcion);
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return vistas;
    }

    public ArrayList<BFuncion> listarMenosVista1(){
        ArrayList<BFuncion> vistas = new ArrayList<>();
        String sql = "select * from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > (select fecha from funcion order by fecha asc limit 1) and f.fecha < now()\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ asc) t1\n" +
                "where t1.´Butacas´ = (select min(´Butacas´) from (select   p.nombre as 'Nombre de pelicula', f.idFuncion as 'Función', sum(cantidadButaca) as ´Butacas´ , fecha, sa.numero, se.nombre,f.stock,p.foto\n" +
                "from ticket t inner join funcion f on t.Funcion_idFuncion = f.idFuncion\n" +
                "\t\t\t  inner join pelicula p on f.Pelicula_idPelicula = p.idPelicula\n" +
                "              inner join funcion_has_sala fs on f.idFuncion = fs.Funcion_idFuncion\n" +
                "              inner join sala sa on fs.Sala_idSala = sa.idSala\n" +
                "              inner join sede se on sa.Sede_idSede = se.idSede\n" +
                "where f.fecha > (select fecha from funcion order by fecha asc limit 1) and f.fecha < now()\n" +
                "group by f.idFuncion\n" +
                "order by ´Butacas´ asc) t)";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                    BFuncion funcion = new BFuncion();
                    funcion.setIdFuncion(resultSet.getInt(2));
                    funcion.setStock(resultSet.getInt("stock"));
                    funcion.setButacas(resultSet.getInt(3));
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(1));
                    pelicula.setFoto(resultSet.getString("foto"));
                    funcion.setbPelicula(pelicula);
                    BSala sala = new BSala();
                    sala.setNumero(resultSet.getInt("numero"));
                    funcion.setbSala(sala);
                    BSede sede = new BSede();
                    sede.setNombre(resultSet.getString("nombre"));
                    funcion.setbSede(sede);
                    vistas.add(funcion);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return vistas;
    }


    public ArrayList<BPelicula>  peliculaMejorCalificada1(){
        ArrayList<BPelicula> peliculas = new ArrayList<>();
        String sql = "select pe.nombre, pe.foto, pe.calificacionPelicula, pe.idPelicula from pelicula pe\n" +
                "inner join funcion f on pe.idPelicula = f.Pelicula_idPelicula\n"+
                "group by pe.nombre\n"+
                "order by pe.calificacionPelicula desc limit 3";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                BPelicula pelicula = new BPelicula();
                pelicula.setNombre(resultSet.getString(1));
                pelicula.setFoto(resultSet.getString(2));
                pelicula.setCalificacionPelicula(resultSet.getDouble(3));
                pelicula.setIdPelicula(resultSet.getInt(4));
                peliculas.add(pelicula);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return peliculas;
    }


    public ArrayList<BCelebridad> actorMejorCalificado1(){
        ArrayList<BCelebridad> actores = new ArrayList<>();
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.calificacion, ce.idCelebridad,  pe.nombre, pe.idPelicula from celebridad ce\n" +
                "inner join celebridad_por_pelicula cp on cp.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "inner join pelicula pe on cp.Pelicula_idPelicula = pe.idPelicula\n" +
                "inner join funcion f on pe.idPelicula = f.Pelicula_idPelicula\n" +
                "where ce.rol= 'actor'\n"+
                "group by ce.nombre\n"+
                "order by ce.calificacion desc limit 3";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                    BCelebridad actor = new BCelebridad();
                    actor.setNombre(resultSet.getString(1));
                    actor.setApellido(resultSet.getString(2));
                    actor.setFoto(resultSet.getString(3));
                    actor.setCalificacion(resultSet.getDouble(4));
                    actor.setIdCelebridad(resultSet.getInt(5));
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(6));
                    pelicula.setIdPelicula(resultSet.getInt(7));
                    actor.setbPelicula(pelicula);
                    actores.add(actor);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return  actores;
    }


    public ArrayList<BCelebridad> directorMejorCalificado1(){
        ArrayList<BCelebridad> directores = new ArrayList<>();
        String sql = "select ce.nombre, ce.apellido, ce.foto, ce.calificacion, ce.idCelebridad,  pe.nombre, pe.idPelicula  from celebridad ce\n" +
                "inner join celebridad_por_pelicula cp on cp.Celebridad_idCelebridad = ce.idCelebridad\n" +
                "inner join pelicula pe on cp.Pelicula_idPelicula = pe.idPelicula\n" +
                "inner join funcion f on pe.idPelicula = f.Pelicula_idPelicula\n" +
                "where ce.rol= 'director'\n"+
                "group by ce.nombre\n"+
                "order by ce.calificacion desc limit 3";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                    BCelebridad director = new BCelebridad();
                    director.setNombre(resultSet.getString(1));
                    director.setApellido(resultSet.getString(2));
                    director.setFoto(resultSet.getString(3));
                    director.setCalificacion(resultSet.getDouble(4));
                    director.setIdCelebridad(resultSet.getInt(5));
                    BPelicula pelicula = new BPelicula();
                    pelicula.setNombre(resultSet.getString(6));
                    pelicula.setIdPelicula(resultSet.getInt(7));
                    director.setbPelicula(pelicula);
                    directores.add(director);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return  directores;
    }

    public String firstFecha(){
        String fecha = null;
        String sql = "select fecha from funcion order by fecha asc limit 1";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            if (resultSet.next()) {
                fecha = resultSet.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return fecha;
    }

    public String lastFecha(){
        String fecha = null;
        String sql = "SELECT CURDATE() today";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            if (resultSet.next()) {
                fecha = resultSet.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return fecha;
    }
}
