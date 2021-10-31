/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dougl
 */
public class BlogDescripcionDao extends Conexion {

    public void insertarBlog(BlogDescripcion b) {
        try {
            this.conectar();
            String sql = "INSERT INTO blog_descripcion(id_blog,titulo,imagen_desc,"
                    + "descripcion,contenido,id_cat)"
                    + " VALUES(?,?,?,?,?,?)";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, b.getIdBlog());
            pre.setString(2, b.getTitulo());
            pre.setString(3, b.getImgPortada());
            pre.setString(4, b.getDescrip());
            pre.setString(5, b.getContenido());
            pre.setInt(6, b.getIdCat());

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }

    }

    public ArrayList<BlogDescripcion> mostrarBlogs() {
        ArrayList<BlogDescripcion> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM blog_descripcion";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                BlogDescripcion b = new BlogDescripcion();
                b.setIdBlogDesc(rs.getInt(1));
                b.setIdBlog(rs.getInt(2));
                b.setTitulo(rs.getString(3));
                b.setImgPortada(rs.getString(4));
                b.setDescrip(rs.getString(5));
                b.setContenido(rs.getString(6));
                b.setIdCat(rs.getInt(7));
                lista.add(b);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public Categoria cargarCategoria(int id){
       Categoria cat = new Categoria();
        try {
            this.conectar();
            String sql = "SELECT * FROM blog_categoria WHERE id_categoria=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
               cat.setIdCat(rs.getInt(1));
               cat.setNombreCat(rs.getString(2));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
       
       
       return cat;
    }
}
