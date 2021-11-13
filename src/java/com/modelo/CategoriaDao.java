/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author dougl
 */
public class CategoriaDao extends Conexion{
    
        public ArrayList<Categoria> mostrarCategorias(){
        ArrayList<Categoria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM blog_categoria";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Categoria c = new Categoria();
                c.setIdCat(rs.getInt(1));
            c.setNombreCat(rs.getString(2));
                lista.add(c);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    public boolean insertarCat(String nombre) {
        try {
            this.conectar();
            String sql = "INSERT INTO blog_categoria(catergoriat) VALUES (?)";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, nombre);

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }
        return true;

    }
    
        public boolean editarCat(String nombre, int id) {
        try {
            this.conectar();
            String sql = "UPDATE blog_categoria SET catergoriat=? where id_cat=?";

            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, nombre);
            pre.setInt(2, id);

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }
        return true;

    }
    public boolean delCat(int id) {
         try {
           
            
            int cantB = verificarCat(id);
            if(cantB !=0){
                return false;
            }else{
                 this.conectar();
                String sql = "delete from blog_categoria where id_cat=?";

                PreparedStatement pre = this.getConexion().prepareStatement(sql);
                pre.setInt(1, id);

                pre.executeUpdate();

                return true;
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            return false;
        } finally {
            this.desconectar();
        }

    }
    
        public int verificarCat(int id) {
            int cantidadBlog=0;
        try {
            this.conectar();
            String sql = "SELECT count(*) as cant_blog FROM blog_descripcion WHERE id_cat = ?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                cantidadBlog = rs.getInt(1);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            return 0;
        } finally {
            this.desconectar();
        }
        return cantidadBlog;

    }
}
