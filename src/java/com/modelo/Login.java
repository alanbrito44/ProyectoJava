/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Karsa
 */
public class Login extends Conexion{
    //consulta que retonar el nivel, ya que segun el nivel de usuario tendra los permisos
    public int validarLogin(String usuario, String clave){
        int nivel = 0;
        try {
            this.conectar();
            String sql = "SELECT id_privilegio FROM usuarios WHERE usuario=? AND contraseña=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, clave);
            ResultSet rs;
            rs = pre.executeQuery();
            //si el query coindice entonces en rs vendra el valor de nivel y entra al while
            while(rs.next()){
                //se le pone uno porque es el primer valor del query osea nivel
                nivel = rs.getInt(1);
            }          
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return nivel;
    }
    
    public int validarIdUusario(String usuario, String clave){
        int id = 0;
        try {
            this.conectar();
            String sql = "SELECT id_usuario FROM usuarios WHERE usuario=? AND contraseña=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, clave);
            ResultSet rs;
            rs = pre.executeQuery();
            //si el query coindice entonces en rs vendra el valor de nivel y entra al while
            while(rs.next()){
                //se le pone uno porque es el primer valor del query osea nivel
                id = rs.getInt(1);
            }          
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return id;
    }
}
