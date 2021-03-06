package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.JavaMail;

import javax.mail.MessagingException;
import java.sql.*;

public class LoginDao extends BaseDao{
    public BPersona validarUsuario(String user, String pass){
        BPersona bPersona= new BPersona();
        String sql="select *, FLOOR((DATEDIFF(CURRENT_DATE(),p.fechaDeNacimiento))/365), p.fechaDeNacimiento from persona p where usuario= ? and contrasenia= sha2(?,256);";
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, user);
            pstmt.setString(2, pass);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    bPersona.setIdPer(rs.getInt(1));
                    bPersona.setDni(rs.getInt(2));
                    bPersona.setNombre(rs.getString(3));
                    bPersona.setApellido(rs.getString(4));
                    bPersona.setFoto(rs.getString(5));
                    bPersona.setNumCel(rs.getInt(6));
                    bPersona.setEmail(rs.getString(8));
                    bPersona.setUsuario(rs.getString(9));
                    bPersona.setDireccion(rs.getString(11));
                    bPersona.setRol(rs.getString(12));
                    bPersona.setCodigoPUCP(rs.getInt(13));
                    bPersona.setEdad(rs.getInt(14));
                    bPersona.setFecha_Nc(rs.getString(15));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bPersona;
    }
    public boolean existeEmail(String email){
        boolean existe= false;
        String sql="select * from persona where email=?";
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, email);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    existe=true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existe;
    }
    public void cambiarContra(String email, String pass) throws SQLException {
        String sql="update persona set contrasenia= sha2(?,256) where email=?;";
        Connection conn=this.getConnection();
        PreparedStatement pstmt= conn.prepareStatement(sql);
        pstmt.setString(1, pass);
        pstmt.setString(2,email);
        pstmt.executeUpdate();
    }
    public void crearCliente(String nombre,String apellido,String email,String pass,int codigo,int dni,int numTele,String fechaNacimiento) throws SQLException {
        String sql= "INSERT INTO persona (dni, nombre, apellido, foto, numeroCelular, fechaDeNacimiento, email, usuario, contrasenia, direccionCliente, rol,codigoPUCP) " +
             "values (?,?, ?, 'https://th.bing.com/th/id/R.eb691d29845dfbc97cd4f6545cd51ba8?rik=SntRktYYmk%2f6zA&riu=http%3a%2f%2fwww.cubiertasparacocina.com%2fimages%2fsinfoto.jpg&ehk=yAsKFdHTMSQezgFDs3RZvJU7iN02F9gvSGo5sEY7AgU%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1', ?, ?, ?, ?, sha2(?,256), '', 'Cliente', ?);";
        Connection conn= this.getConnection();
        PreparedStatement pstmt= conn.prepareStatement(sql);
        pstmt.setInt(1,dni);
        pstmt.setString(2,nombre);
        pstmt.setString(3, apellido);
        pstmt.setInt(4,numTele);
        pstmt.setString(5,fechaNacimiento);
        pstmt.setString(6,email);
        pstmt.setString(7,email);
        pstmt.setString(8,pass);
        if(codigo==0){
            pstmt.setNull(9, Types.INTEGER);
        }else{
            pstmt.setInt(9,codigo);
        }
        pstmt.executeUpdate();
    }

    public String enviarCodRecupe(String email) throws MessagingException {
        JavaMail mail= new JavaMail();
        String codigoConfirmacion=generarCodigo(7);
        String asunto="RECUPERAR CONTRASE??A! ID: "+ generarCodigo(5);
        String mensaje="Estimado cliente,\n"+
                "Su c??digo de recuperaci??n es el siguiente: \n"+
                codigoConfirmacion+"\n\nIngr??selo para continuar con la recuperaci??n de su cuenta.";
        mail.sendMessage(email,mensaje, asunto, null, null);
        return codigoConfirmacion;
    }
    private String generarCodigo(int tam){
        String codigo="";
        String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F",
                "a","b","c","d","e","d","@","-","*","#","=","?","!","&",":", "_", "$", "%", "+"};
        for (int i = 0; i < tam; i++ ) {
            codigo += letters[(int) Math.round(Math.random() * (letters.length-1))];
        }
        return codigo;
    }


    public int tiene_numeros(String texto){
        var numeros="0123456789";
        for(int i=0; i<texto.length(); i++){
            if (numeros.indexOf(texto.charAt(i),0)!=-1){
                return 1;
            }
        }
        return 0;
    }
}
