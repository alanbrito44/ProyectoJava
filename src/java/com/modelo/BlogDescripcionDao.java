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

    public boolean insertarBlog(BlogDescripcion b) {
        try {
            this.conectar();
            String sql = "INSERT INTO blog_descripcion(id_blog,titulo,imagen_desc,"
                    + "descripcion,contenido,id_cat,fecha_creacion)"
                    + " VALUES(?,?,?,?,?,?,?)";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, b.getIdBlog());
            pre.setString(2, b.getTitulo());
            pre.setString(3, b.getImgPortada());
            pre.setString(4, b.getDescrip());
            pre.setString(5, b.getContenido());
            pre.setInt(6, b.getIdCat());
            pre.setString(7, b.getFecha());

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }
        return true;

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
                b.setFecha(rs.getString(8));
                lista.add(b);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public String cargarCategoria(int id){
       String cat = "";
        try {
            this.conectar();
            String sql = "select a.catergoriat from blog_categoria a inner join blog_descripcion b on a.id_cat = b.id_cat\n" +
                            "where b.id_cat = ? ";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                cat = rs.getString(1);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
       
       
       return cat;
    }
    
    public String usuarioBlog(int idBlog){
        String nombre = "";
        try {
            this.conectar();
            String sql = "select a.usuario from usuarios a inner join blog b on a.id_usuario = b.id_usuario\n" +
            "where b.id_blog = ?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, idBlog);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                nombre = rs.getString(1);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
       
        return nombre;
    }
    
    
    public boolean eliminarBlogContenido(int id){
        try {
            this.conectar();
            String sql = "delete from blog_descripcion where id_blog = ?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        }finally{
            this.desconectar();
        }
        
        return true;
    }
    
    
   
    public boolean modificarBlogImg(BlogDescripcion b){
        try {
            this.conectar();
            String sql = "UPDATE blog_descripcion SET titulo=?,imagen_desc=?,"
                    + "descripcion =?,contenido=?,id_cat=?,fecha_creacion=? WHERE id_blog =?";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, b.getTitulo());
            pre.setString(2, b.getImgPortada());
            pre.setString(3, b.getDescrip());
            pre.setString(4, b.getContenido());
            pre.setInt(5, b.getIdCat());
            pre.setString(6, b.getFecha());
            pre.setInt(7, b.getIdBlog());

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }
 
        return true;
    }
    
    public boolean modificarBlogNoImg(BlogDescripcion b){
        try {
            this.conectar();
            String sql = "UPDATE blog_descripcion SET titulo=?,"
                    + "descripcion =?,contenido=?,id_cat=?,fecha_creacion=? WHERE id_blog =?";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, b.getTitulo());
            pre.setString(2, b.getDescrip());
            pre.setString(3, b.getContenido());
            pre.setInt(4, b.getIdCat());
            pre.setString(5, b.getFecha());
            pre.setInt(6, b.getIdBlog());

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }
 
        return true;
    }
}
