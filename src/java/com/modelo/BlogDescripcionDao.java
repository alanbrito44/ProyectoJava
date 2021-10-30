/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

/**
 *
 * @author dougl
 */
public class BlogDescripcionDao extends Conexion {
    
        public void insertarBlog(BlogDescripcion b){
        try {
            this.conectar();
            String sql = "INSERT INTO blog_descripcion(id_blog,titulo,imagen_desc,"
                    + "descripcion,contenido,imagen_cont,id_cat)"
                    + " VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, b.getIdBlog());
            pre.setString(2,b.getTitulo());
            pre.setString(3,b.getImgPortada());
            pre.setString(4, b.getDescrip());
            pre.setString(5,b.getContenido());
            pre.setString(6, b.getImgContent());
            pre.setInt(7, b.getIdCat());
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
}
