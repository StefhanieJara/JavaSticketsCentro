package com.example.javasticketscentro.Daos;
import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import java.sql.*;
import java.util.ArrayList;

public class AdminDao {
    String user = "root";
    String pass = "root";
    String url = "jdbc:mysql://localhost:3306/centro1";
    public static ArrayList<BPersona> listarCliente() {
        ArrayList<BPersona> listaClientes = new ArrayList<>();
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select idPersona,nombre,apellido,numeroCelular,fechaDeNacimiento,email,direccionCliente from persona where rol = 'Cliente'");) {

            while (rs.next()) {
                BPersona bPersona = new BPersona();

                bPersona.setIdPer(rs.getInt(1));
                bPersona.setNombre(rs.getString(2));
                bPersona.setApellido(rs.getString(3));
                bPersona.setNumCel(rs.getInt(4));
                bPersona.setFecha_Nc(rs.getDate(5));
                bPersona.setEmail(rs.getString(6));
                bPersona.setDireccion(rs.getString(7));
                listaClientes.add(bPersona);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaClientes;
    }

    public static ArrayList<BPersona> listarOperador() {
        ArrayList<BPersona> listaOperadores = new ArrayList<>();
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre,apellido,numeroCelular,fechaDeNacimiento,email,rol,idPersona from persona where rol = 'Operador'");) {

            while (rs.next()) {
                BPersona bPersona = new BPersona();

                bPersona.setNombre(rs.getString(1));
                bPersona.setApellido(rs.getString(2));
                bPersona.setNumCel(rs.getInt(3));
                bPersona.setFecha_Nc(rs.getDate(4));
                bPersona.setEmail(rs.getString(5));
                bPersona.setRol(rs.getString(6));
                bPersona.setIdPer(rs.getInt(7));
                listaOperadores.add(bPersona);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaOperadores;
    }

    public static ArrayList<BCelebridad> listarCelebridad() {
        ArrayList<BCelebridad> listaCelebridad = new ArrayList<>();
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/centro1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select idCelebridad,nombre,apellido,rol  from celebridad");) {

            while (rs.next()) {
                BCelebridad bCelebridad = new BCelebridad();
                bCelebridad.setIdCelebridad(rs.getInt(1));
                bCelebridad.setNombre(rs.getString(2));
                bCelebridad.setApellido(rs.getString(3));
                bCelebridad.setRol(rs.getString(4));
                listaCelebridad.add(bCelebridad);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaCelebridad;
    }


    //Añadimos nuevas salas
    public void anadirSala(int idSede,int aforo,int numero){
        String sql="insert into sala (Sede_idSede, aforo, numero) values (?,?,?)";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idSede);
            pstmt.setInt(2,aforo);
            pstmt.setInt(3,numero);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    //Métodos internos para filtrar Clientes
    public String generarSQL_filtrosClie(String tabla, String rol,String nombre, String apellido, int dni,int codigoPUCP,int cantidadResul){
        String sql, sql0,sql1,sql2,sql3;

        if(nombre!=null){
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like ? ";
        }else{
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like '%' ";
        }
        if(dni!=0){
            sql1="and dni like ? ";
        }else{
            sql1="and dni like '%' ";
        }
        if(apellido!=null){
            sql2="and apellido like ? ";
        }else{
            sql2="and apellido like '%' ";
        }
        if(codigoPUCP!=0) {
            sql3="and codigoPUCP like ?) limit ?,"+cantidadResul;
        }else{
            sql3=") limit ?,"+cantidadResul;
        }
        sql=sql0+sql1+sql2+sql3;
        return sql;
    }
    public void enviar_PstmtClie(PreparedStatement pstmt, int posicion, String nombre, String apellido, int dni,int codigoPUCP) throws SQLException {
        int contador=0;
        if(nombre!=null){
            contador++;
            pstmt.setString(contador,"%"+nombre+"%");
        }
        if(dni!=0){
            contador++;
            pstmt.setString(contador,"%"+dni+"%");
        }
        if(apellido!=null){
            contador++;
            pstmt.setString(contador,"%"+apellido+"%");
        }
        if(codigoPUCP!=0){
            contador++;
            pstmt.setString(contador,"%"+codigoPUCP+"%");
        }
        contador++;
        pstmt.setInt(contador, posicion);
    }

    //Métodos internos para filtrar actores y directores
    public String generarSQL_filtrosCel(String tabla, String rol, String nombre,String apellido,int cant_result){
        String sql, sql0,sql1,sql2;

        if(rol!=null){
            sql0="Select * from "+tabla+" where (rol like ? ";
        }else{
            sql0="Select * from "+tabla+" where (rol like '%' ";
        }
        if(nombre!=null){
            sql1="and nombre like ? ";
        }else{
            sql1="and nombre like '%' ";
        }
        if(apellido!=null){
            sql2="and apellido like ?) limit ?,"+ cant_result;
        }else{
            sql2=") limit ?," + cant_result;
        }
        sql=sql0+sql1+sql2;
        return sql;
    }
    public void enviar_PstmtCel(PreparedStatement pstmt, int posicion, String rol, String nombre, String apellido) throws SQLException {
        int contador=0;
        if(rol != null){
            contador++;
            pstmt.setString(contador,"%"+rol+"%");
        }
        if(nombre!=null){
            contador++;
            pstmt.setString(contador,"%"+nombre+"%");
        }
        if(apellido!=null){
            contador++;
            pstmt.setString(contador,"%"+apellido+"%");
        }
        contador++;
        pstmt.setInt(contador, posicion);
    }

    //Métodos internos para filtrar Operadores
    public String generarSQL_filtrosOpe(String tabla, String rol,String nombre, String apellido, int id,int cantidadResul){
        String sql, sql0,sql1,sql2;

        if(nombre!=null){
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like ? ";
        }else{
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like '%' ";
        }
        if(id!=0){
            sql1="and idPersona like ? ";
        }else{
            sql1="and idPersona like '%' ";
        }
        if(apellido!=null){
            sql2="and apellido like ?) limit ?,"+cantidadResul;
        }else{
            sql2=") limit ?,"+cantidadResul;
        }
        sql=sql0+sql1+sql2;
        return sql;
    }
    public void enviar_PstmtOpe(PreparedStatement pstmt, int posicion, String nombre, String apellido, int id) throws SQLException {
        int contador=0;
        if(nombre!=null){
            contador++;
            pstmt.setString(contador,"%"+nombre+"%");
        }
        if(id!=0){
            contador++;
            pstmt.setString(contador,"%"+id+"%");
        }
        if(apellido!=null){
            contador++;
            pstmt.setString(contador,"%"+apellido+"%");
        }
        contador++;
        pstmt.setInt(contador, posicion);
    }

    //Añadir Operadores
    public void anadirOperadores(String nombre, int dni, String apellido,  int numCel, String foto,
                                 Date fecha_Nc, String email, String usuario, String contrasenia,
                                 String direccion, String rol){
        String sql="insert into persona (dni, nombre, apellido, foto, numeroCelular, fechaDeNacimiento, "+
                "email, usuario, contrasenia, direccionCliente, rol, codigoPUCP) values (?,?,?,?,?,?,?,?,?,?,?,NULL)";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,dni);
            pstmt.setString(2,nombre);
            pstmt.setString(3,apellido);
            pstmt.setString(4,foto);
            pstmt.setInt(5,numCel);
            pstmt.setDate(6,fecha_Nc);
            pstmt.setString(7, email);
            pstmt.setString(8, usuario);
            pstmt.setString(9, contrasenia);
            pstmt.setString(10, direccion);
            pstmt.setString(11, rol);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    //Eliminar Operador
    public void eliminarOperador(int id_Operador){
        String sql="delete from persona where idPersona=?";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,id_Operador);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    //Añadir Celebridades
    public void anadirCelebridades(String nombre,String apellido, String rol, String foto){
        String sql="insert into celebridad (nombre, apellido, rol, foto, calificacion) values (?,?,?,?,?)";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setString(3,rol);
            pstmt.setString(4,foto);
            pstmt.setDouble(5,0.0);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    //Eliminar Celebridad
    public void eliminarCelebridad(int id_Celebridad){
        eliminarCelebridadPorPelicula(id_Celebridad, 0);
        eliminarCalificacionCelebridad(id_Celebridad,0);
        String sql="delete from celebridad where idCelebridad= ?";
        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            System.out.println("El id a eliminar es: "+id_Celebridad);
            pstmt.setInt(1,id_Celebridad);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    //Eliminar Celebridad por Pelicula
    public void eliminarCelebridadPorPelicula(int idCelebridad, int idPelicula){
        if(idPelicula==0){
            String sql="delete from celebridad_por_pelicula where Celebridad_idCelebridad= ?";
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                PreparedStatement pstmt= conn.prepareStatement(sql)){
                pstmt.setInt(1,idCelebridad);
                pstmt.executeUpdate();
            }catch(SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            if(idCelebridad==0){
                String sql="delete from celebridad_por_pelicula where Pelicula_idPelicula= ?";
                try(Connection conn= DriverManager.getConnection(url,user,pass);
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idPelicula);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }else{
                String sql="delete from celebridad_por_pelicula where (Celebridad_idCelebridad= ? and Pelicula_idPelicula= ?)";
                try(Connection conn= DriverManager.getConnection(url,user,pass);
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idCelebridad);
                    pstmt.setInt(2, idPelicula);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }
        }
    }
    //Eliminar Calificacion de Personas a Celebridades
    public void eliminarCalificacionCelebridad(int idCelebridad, int idPersona){
        if(idPersona==0){
            String sql="delete from calificacion_celebridad where Celebridad_idCelebridad= ?";
            try(Connection conn= DriverManager.getConnection(url,user,pass);
                PreparedStatement pstmt= conn.prepareStatement(sql)){
                pstmt.setInt(1,idCelebridad);
                pstmt.executeUpdate();
            }catch(SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            if(idCelebridad==0){
                String sql="delete from calificacion_celebridad where persona_idPersona= ?";
                try(Connection conn= DriverManager.getConnection(url,user,pass);
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idPersona);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }else{
                String sql="delete from calificacion_celebridad where (Celebridad_idCelebridad= ? and persona_idPersona= ?)";
                try(Connection conn= DriverManager.getConnection(url,user,pass);
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idCelebridad);
                    pstmt.setInt(2, idPersona);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }
        }
    }

    public void crearCelebridad(String nombre, String apellido, String rol, String foto){
        String sql="INSERT INTO centro1.celebridad (nombre, apellido, rol, foto, calificacion) VALUES (?, ?, ?, ?, ?) ";

        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
              pstmt.setString(1,nombre);
              pstmt.setString(2,apellido);
              pstmt.setString(3,rol);
              pstmt.setString(4,foto);
              pstmt.setDouble(5,0.0);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    public void editarCelebridad(int id_Celebridad){
        String sql="INSERT INTO centro1.celebridad (nombre, apellido, rol, foto, calificacion) VALUES ( ?, ?, ?, ?, ?) ";

        try(Connection conn= DriverManager.getConnection(url,user,pass);
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            //       pstmt.setString(1,nombre);
            //       pstmt.setString(2,apellido);
            //       pstmt.setString(3,rol);
            //       pstmt.setString(4,foto);
            //       pstmt.setDouble(5,0.0);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
}