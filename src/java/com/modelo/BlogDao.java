/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import com.conexion.Conexion;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

/**
 *
 * @author dougl
 */
public class BlogDao extends Conexion{
    
    
    public void crearBlog(int id){
        try {
            this.conectar();
            String sql = "INSERT into BLOG(id_usuario) values(?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
           
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public int obtenerIdBlog(){
        int id = 0;
        try {
            this.conectar();
            String sql = "SELECT MAX(id_blog) AS id FROM blog";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.executeQuery();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        
        return id;
    }
    
    public void eliminarBlog(Blog b){
        try {
            this.conectar();
            String sql = "DELETE from BLOG where id_blog=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, b.getIdBlog());           
            pre.executeUpdate();
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    
}