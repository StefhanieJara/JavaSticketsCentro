package com.example.javasticketscentro.Daos;
import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.BSala;
import com.example.javasticketscentro.Beans.BSede;

import java.sql.*;
import java.util.ArrayList;
import java.util.Locale;

public class AdminDao extends BaseDao{
    //  Gestión de Clientes:
    public ArrayList<BPersona> listaCliente(String nombre, String apellido, String dni, String codigoPUCP, int pagina, int cant_result, boolean limit){

        String tabla="persona";
        String rol="Cliente";
        ArrayList<BPersona> listCliente= new ArrayList<>();
        String sql=generarSQL_filtrosClie(tabla, rol, nombre, apellido, dni, codigoPUCP, cant_result, limit);

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int posicion=(pagina-1)*cant_result;
            enviar_PstmtClie(pstmt, posicion,nombre, apellido, dni,codigoPUCP, limit);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    BPersona p = new BPersona();
                    p.setIdPer(resultSet.getInt(1));
                    p.setNombre(resultSet.getString(3));
                    p.setDni(resultSet.getInt(2));
                    p.setApellido(resultSet.getString(4));
                    p.setFoto(resultSet.getString(5));
                    p.setNumCel(resultSet.getInt(6));
                    p.setFecha_Nc(resultSet.getString(7));
                    p.setEmail(resultSet.getString(8));
                    p.setUsuario(resultSet.getString(9));
                    p.setContrasenia(resultSet.getString(10));
                    p.setDireccion(resultSet.getString(11));
                    p.setRol(resultSet.getString(12));
                    p.setCodigoPUCP(resultSet.getInt(13));
                    listCliente.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listCliente;
    }
    //Métodos internos para filtrar Clientes
    public String generarSQL_filtrosClie(String tabla, String rol,String nombre, String apellido, String dni,String codigoPUCP,int cantidadResul, boolean limit){
        String sql, sql0,sql1,sql2,sql3;

        if(nombre!=null && !nombre.equals("")){
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like ? ";
        }else{
            sql0="Select * from "+tabla+" where rol= '"+rol+"' and(nombre like '%' ";
        }
        if(dni!=null && !dni.equals("")){
            sql1="and dni like ? ";
        }else{
            sql1="and dni like '%' ";
        }
        if(apellido!=null && !apellido.equals("")){
            sql2="and apellido like ? ";
        }else{
            sql2="and apellido like '%' ";
        }
        if(limit){
            if(codigoPUCP!=null && !codigoPUCP.equals("")) {
                sql3="and codigoPUCP like ?) limit ?,"+cantidadResul;
            }else{
                sql3=") limit ?,"+cantidadResul;
            }
        }else{
            if(codigoPUCP!=null && !codigoPUCP.equals("")) {
                sql3="and codigoPUCP like ?)";
            }else{
                sql3=")";
            }
        }
        sql=sql0+sql1+sql2+sql3;
        return sql;
    }
    public void enviar_PstmtClie(PreparedStatement pstmt, int posicion, String nombre, String apellido, String dni,String codigoPUCP, boolean limit) throws SQLException {
        int contador=0;
        if(nombre!=null && !nombre.equals("")){
            contador++;
            pstmt.setString(contador,"%"+nombre+"%");
        }
        if(dni!=null && !dni.equals("")){
            contador++;
            pstmt.setString(contador,"%"+dni+"%");
        }
        if(apellido!=null && !apellido.equals("")){
            contador++;
            pstmt.setString(contador,"%"+apellido+"%");
        }
        if(codigoPUCP!=null && !codigoPUCP.equals("")){
            contador++;
            pstmt.setString(contador,"%"+codigoPUCP+"%");
        }
        if(limit){
            contador++;
            pstmt.setInt(contador, posicion);
        }
    }

    // Gestión de Operadores
    public ArrayList<BPersona> listarOperador() {
        ArrayList<BPersona> listaOperadores = new ArrayList<>();
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select nombre,apellido,numeroCelular,fechaDeNacimiento,email,rol,idPersona,direccionCliente from persona where rol = 'Operador'");) {

            while (rs.next()) {
                BPersona bPersona = new BPersona();

                bPersona.setNombre(rs.getString(1));
                bPersona.setApellido(rs.getString(2));
                bPersona.setNumCel(rs.getInt(3));
                bPersona.setFecha_Nc(rs.getString(4));
                bPersona.setEmail(rs.getString(5));
                bPersona.setRol(rs.getString(6));
                bPersona.setIdPer(rs.getInt(7));
                bPersona.setDireccion(rs.getString(8));
                listaOperadores.add(bPersona);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaOperadores;
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

    public void anadirOperadores(String nombre, int dni, String apellido,  int numCel, String foto,
                                 String fecha_Nc, String email, String usuario, String contrasenia,
                                 String direccion, String rol){
        String sql="insert into persona (dni, nombre, apellido, foto, numeroCelular, fechaDeNacimiento, "+
                "email, usuario, contrasenia, direccionCliente, rol) values (?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,dni);
            pstmt.setString(2,nombre);
            pstmt.setString(3,apellido);
            pstmt.setString(4,foto);
            pstmt.setInt(5,numCel);
            pstmt.setString(6,fecha_Nc);
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

    public void eliminarOperador(int id){
        String sql="delete from persona where idPersona=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    public BPersona buscarOperadorPorId(int id){
        BPersona operador = null;
        String sql = "select * from centro1.persona where idPersona=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    operador = new BPersona();
                    operador.setIdPer(rs.getInt(1));
                    operador.setDni(rs.getInt(2));
                    operador.setNombre(rs.getString(3));
                    operador.setApellido(rs.getString(4));
                    operador.setFoto(rs.getString(5));
                    operador.setNumCel(rs.getInt(6));
                    operador.setFecha_Nc(rs.getString(7));
                    operador.setEmail(rs.getString(8));
                    operador.setUsuario(rs.getString(9));
                    operador.setContrasenia(rs.getString(10));
                    operador.setDireccion(rs.getString(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return operador;
    }
    public void editarOperadores(BPersona operador){
        String sql="UPDATE centro1.persona SET nombre = ?, apellido = ?, numeroCelular = ?, email = ?, direccionCliente = ? where idPersona = ?";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,operador.getNombre());
            pstmt.setString(2,operador.getApellido());
            pstmt.setInt(3, operador.getNumCel());
            pstmt.setString(4, operador.getEmail());
            pstmt.setString(5, operador.getDireccion());
            pstmt.setInt(6, operador.getIdPer());
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    // Gestión de Celebridades
    public ArrayList<BCelebridad> listarDirector() {

        ArrayList<BCelebridad> listarDirector = new ArrayList<>();

        String sql = "select concat(nombre,\" \", apellido) from celebridad where rol ='director';";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BCelebridad bCelebridad = new BCelebridad();
                bCelebridad.setNombre(rs.getString(1));
                listarDirector.add(bCelebridad);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listarDirector;
    }
    public ArrayList<BCelebridad> listarActor() {

        ArrayList<BCelebridad> listarActor = new ArrayList<>();


        String sql = "select concat(nombre,\" \", apellido) from celebridad where rol ='actor';";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BCelebridad bCelebridad = new BCelebridad();
                bCelebridad.setNombre(rs.getString(1));
                listarActor.add(bCelebridad);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listarActor;
    }


    public ArrayList<BCelebridad> listarCelebridad(String nombreCompleto, boolean limit, int cantResul, int pagina) {
        ArrayList<BCelebridad> listaCelebridad = new ArrayList<>();
        String[] nombreApellido= nombreCompleto.split(" ");
        String sql;
        if(limit){
            if(nombreApellido.length!=1){
                sql= "select idCelebridad,nombre,apellido,rol, foto  from celebridad c where c.nombre like ? and c.apellido like ? limit ?,"+cantResul;
            }else{
                sql= "select idCelebridad,nombre,apellido,rol, foto from celebridad c where c.nombre like ? limit ?, "+cantResul;
            }
        }else{
            if(nombreApellido.length!=1){
                sql= "select idCelebridad,nombre,apellido,rol, foto  from celebridad c where c.nombre like ? and c.apellido like ?";
            }else{
                sql= "select idCelebridad,nombre,apellido,rol, foto  from celebridad c where c.nombre like ?";
            }
        }
        int posicion=(pagina-1)*cantResul;
        try (Connection connection = this.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);) {
            if(limit){
                stmt.setString(1, "%"+nombreApellido[0]+"%");
                if(nombreApellido.length!=1){
                    stmt.setString(2, "%"+nombreApellido[1]+"%");
                    stmt.setInt(3, posicion);
                }else{
                    stmt.setInt(2, posicion);
                }
            }else{
                stmt.setString(1, "%"+nombreApellido[0]+"%");
                if(nombreApellido.length!=1){
                    stmt.setString(2, "%"+nombreApellido[1]+"%");
                    System.out.println(nombreApellido[0]+" "+nombreApellido[1]);
                }
            }
            try(ResultSet rs =stmt.executeQuery()) {
                while (rs.next()) {
                    BCelebridad bCelebridad = new BCelebridad();
                    bCelebridad.setIdCelebridad(rs.getInt(1));
                    bCelebridad.setNombre(rs.getString(2));
                    bCelebridad.setApellido(rs.getString(3));
                    bCelebridad.setRol(rs.getString(4));
                    bCelebridad.setFoto(rs.getString(5));
                    listaCelebridad.add(bCelebridad);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCelebridad;
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
        //Eliminar Celebridad
    public void eliminarCelebridad(int id_Celebridad){
        eliminarCelebridadPorPelicula(id_Celebridad, 0);
        eliminarCalificacionCelebridad(id_Celebridad,0);
        String sql="delete from celebridad where idCelebridad= ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
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
            try(Connection conn= this.getConnection();
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
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idPelicula);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }else{
                String sql="delete from celebridad_por_pelicula where (Celebridad_idCelebridad= ? and Pelicula_idPelicula= ?)";
                try(Connection conn= this.getConnection();
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
            try(Connection conn= this.getConnection();
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
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idPersona);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }else{
                String sql="delete from calificacion_celebridad where (Celebridad_idCelebridad= ? and persona_idPersona= ?)";
                try(Connection conn= this.getConnection();
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
    public BCelebridad buscarPorId(int id){
        BCelebridad celebridad = null;
        String sql = "select * from centro1.celebridad where idCelebridad=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    celebridad = new BCelebridad();
                    celebridad.setIdCelebridad(rs.getInt(1));
                    celebridad.setNombre(rs.getString(2));
                    celebridad.setApellido(rs.getString(3));
                    celebridad.setRol(rs.getString(4));
                    celebridad.setFoto(rs.getString(5));
                    celebridad.setCalificacion(rs.getInt(6));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  celebridad;
    }
    public void crearCelebridad(String nombre, String apellido, String rol, String foto){
        String sql="INSERT INTO centro1.celebridad (nombre, apellido, rol, foto, calificacion) VALUES (?, ?, ?, ?, ?) ";

        try(Connection conn= this.getConnection();
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
    public void editarCelebridad(BCelebridad bCelebridad){
        String sql;
        if (bCelebridad.getFoto().equals("mantener")){
            sql="UPDATE centro1.celebridad SET nombre = ?, apellido = ?, rol = ? where idCelebridad = ?";
        }
        else{
            sql="UPDATE centro1.celebridad SET nombre = ?, apellido = ?, rol = ?, foto = ? where idCelebridad = ?";
        }
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,bCelebridad.getNombre());
            pstmt.setString(2,bCelebridad.getApellido());
            pstmt.setString(3,bCelebridad.getRol());
            if (bCelebridad.getFoto().equals("mantener")){
                pstmt.setInt(4, bCelebridad.getIdCelebridad());
            }else{
                pstmt.setString(4,bCelebridad.getFoto());
                pstmt.setInt(5, bCelebridad.getIdCelebridad());
            }
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    //Añadimos nuevas salas
    public void anadirSala(int idSede,int aforo,int numero){

        String sql="insert into sala (Sede_idSede, aforo, numero) values (?,?,?)";
        try(Connection conn= this.getConnection();
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
    //Editamos Salas
    public void editarSala(int idSede,int aforo,int numero, int id){

        String sql="update sala set Sede_idSede=?, aforo=?, numero=? where idSala=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idSede);
            pstmt.setInt(2,aforo);
            pstmt.setInt(3,numero);
            pstmt.setInt(4,id);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    public ArrayList<BSala> listasala() {

        ArrayList<BSala> listasala = new ArrayList<>();

        String sql = "select aforo, numero from sala;";

        try (Connection connection =this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                BSala bSala = new BSala();
                bSala.setAforo(rs.getInt(1));
                bSala.setNumero(rs.getInt(2));
                listasala.add(bSala);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listasala;
    }


    //eliminamos Salas
    //Eliminar Sala
    public void eliminarSala(int idSala){
        eliminarFuncionSala(idSala, 0);

        String sql="delete from sala where idSala=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idSala);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    //Eliminar Función por Sala
    public void eliminarFuncionSala(int idSala, int idFuncion){
        if(idFuncion==0){
            String sql="delete from funcion_has_sala where Sala_idSala=?";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql)){
                pstmt.setInt(1,idSala);
                pstmt.executeUpdate();
            }catch(SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            if(idSala==0){
                String sql="delete from funcion_has_sala where Funcion_idFuncion= ?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idFuncion);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }else{
                String sql="delete from funcion_has_sala where (Funcion_idFuncion= ? and Sala_idSala= ?)";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql)){
                    pstmt.setInt(1,idFuncion);
                    pstmt.setInt(2, idSala);
                    pstmt.executeUpdate();
                }catch(SQLException e) {
                    System.out.println("Hubo un error en la conexión!");
                    e.printStackTrace();
                }
            }
        }
    }

    //actualizar sala
    public  BSala buscarSala(int idSala) {
        BSala bsala = null;

        String sql = "select * from sala where idSala = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idSala);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    bsala = new BSala();
                    bsala.setIdSala(rs.getInt(3));
                    bsala.setAforo(rs.getInt(2));
                    bsala.setNumero(rs.getInt(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return bsala;
    }

    //Filtrar Sala y listarla:
    public ArrayList<BSala> filtrarSala(String nombre, boolean limit, int cant_resul, int pagina) {
        ArrayList<BSala> listaSala= new ArrayList<>();
        String sql;
        int posicion=0;
        if(limit){
            posicion=(pagina-1)*cant_resul;
            sql= "select idSala,Sede_idSede,numero, aforo, nombre " +
                    "from sala sa " +
                    "    inner join sede s on sa.Sede_idSede= s.idSede " +
                    "where nombre like ? limit ?, "+ cant_resul;
        }else{
            sql= "select idSala,Sede_idSede,numero, aforo, nombre " +
                    "from sala sa " +
                    "    inner join sede s on sa.Sede_idSede= s.idSede " +
                    "where nombre like ?;";
        }
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);) {
            stmt.setString(1,"%"+nombre+"%");
            if(limit){
                stmt.setInt(2, posicion);
            }
            try(ResultSet rs= stmt.executeQuery()){
                while (rs.next()){
                    BSala bSala = new BSala();
                    bSala.setIdSala(rs.getInt(1));
                    bSala.setIdSede(rs.getInt(2));
                    bSala.setNumero(rs.getInt(3));
                    bSala.setAforo(rs.getInt(4));
                    bSala.setNombre(rs.getString(5));
                    listaSala.add(bSala);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaSala;
    }
    public int encontrarIDSede(String sede){
        int id=0;
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement("select * from sede where nombre like ?")){
            stmt.setString(1, "%"+sede+"%");
            try(ResultSet rs = stmt.executeQuery()){
                while (rs.next()) {
                    id=rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return id;
    }

    //Listar Sedes:
    public ArrayList<BSede> listarSedes(){
        ArrayList<BSede> lista= new ArrayList<>();
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery("select * from sede")){
            while(rs.next()){
                BSede bSede= new BSede();
                bSede.setIdSede(rs.getInt(1));
                bSede.setNombre(rs.getString(2));
                bSede.setDireccion(rs.getString(3));
                lista.add(bSede);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public BPersona buscarOperadorPorId_editar(int id){
        BPersona operador = null;
        String sql = "select * from centro1.persona where idPersona=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    operador = new BPersona();
                    operador.setIdPer(rs.getInt(1));
                    operador.setDni(rs.getInt(2));
                    operador.setNombre(rs.getString(3));
                    operador.setApellido(rs.getString(4));
                    operador.setFoto(rs.getString(5));
                    operador.setNumCel(rs.getInt(6));
                    operador.setFecha_Nc(rs.getString(7));
                    operador.setEmail(rs.getString(8));
                    operador.setUsuario(rs.getString(9));
                    operador.setContrasenia(rs.getString(10));
                    operador.setDireccion(rs.getString(11));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return operador;
    }

}