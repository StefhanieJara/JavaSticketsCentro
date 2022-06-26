package com.example.javasticketscentro.Daos;

import com.example.javasticketscentro.Beans.BPersona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.prefs.AbstractPreferences;

public class LoginDao extends BaseDao{
    public BPersona validarUsuario(String user, String pass){
        BPersona bPersona= new BPersona();
        String sql="select * from persona where usuario= ? and contrasenia= sha2(?,256);";
        try(Connection conn=this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, user);
            pstmt.setString(2, pass);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    bPersona.setIdPer(rs.getInt(1));
                    bPersona.setNombre(rs.getString(3));
                    bPersona.setApellido(rs.getString(4));
                    bPersona.setFoto(rs.getString(5));
                    bPersona.setRol(rs.getString(12));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bPersona;
    }
}
