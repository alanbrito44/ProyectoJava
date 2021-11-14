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
 * @author Karsa
 */
public class CategoriaAutomovilDAO extends Conexion{
    
    
    public void insertarCategoria(CategoriaAutomovil c){
        try {
            this.conectar();
            String sql = "INSERT INTO categoria_automovil (nombre_categoria,descripcion) VALUES (?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, c.getNombre_categoria());
            pre.setString(2, c.getDescripcion());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void modificarCategoria(CategoriaAutomovil c){
        try {
            this.conectar();
            String sql = "UPDATE categoria_automovil SET nombre_categoria=?, descripcion=? WHERE id_catAutomovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, c.getNombre_categoria());
            pre.setString(2, c.getDescripcion());
            pre.setInt(3, c.getId_catAutomovil());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public boolean eliminarCategoria(CategoriaAutomovil c){
        try {
            this.conectar();
            String sql = "DELETE FROM categoria_automovil WHERE id_catAutomovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, c.getId_catAutomovil());
            pre.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return false;
    }
    
    public ArrayList<CategoriaAutomovil> mostrarCategoriaAuto(){
        ArrayList<CategoriaAutomovil> lista = new ArrayList<>();
        try{
            this.conectar();
            String sql = "SELECT * FROM categoria_automovil";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                CategoriaAutomovil c = new CategoriaAutomovil();
                c.setId_catAutomovil(rs.getInt(1));
                c.setNombre_categoria(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                
                lista.add(c);
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
    
    public CategoriaAutomovil getCategoria(int id){
        CategoriaAutomovil c = new CategoriaAutomovil();
        try{
            this.conectar();
            String sql = "SELECT * FROM categoria_automovil WHERE id_catAutomovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                c.setId_catAutomovil(rs.getInt(1));
                c.setNombre_categoria(rs.getString(2));
                c.setDescripcion(rs.getString(3));
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return c;
    }
}
