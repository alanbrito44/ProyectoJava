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
 * @author Javier Amaya
 */
public class CategoriaClienteDAO extends Conexion{
    public void insertarCategoriaCliente(CategoriaCliente c){
        try {
            this.conectar();
            String sql = "INSERT INTO categoria_cliente (nombre_categoria,descripcion_categoria) VALUES (?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, c.getNombre_categoria());
            pre.setString(2, c.getDescripcion_categoria());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void modificarCategoriaCliente(CategoriaCliente c){
        try{
            this.conectar();
            String sql = "UPDATE categoria_cliente SET nombre_categoria=?, descripcion_categoria=? WHERE id_categoria=? ";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, c.getNombre_categoria());
            pre.setString(2, c.getDescripcion_categoria());
            pre.setInt(3, c.getId_categoria());
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void eliminarCategoriaCliente(CategoriaCliente c){
        try{
            this.conectar();
            String sql = "DELETE FROM categoria_cliente WHERE id_categoria=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, c.getId_categoria());
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public ArrayList<CategoriaCliente> mostrarCategoriaCliente(){
        ArrayList<CategoriaCliente> lista = new ArrayList<>();
        try{
            this.conectar();
            String sql = "SELECT * FROM categoria_cliente";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                CategoriaCliente c = new CategoriaCliente();
                c.setId_categoria(rs.getInt(1));
                c.setNombre_categoria(rs.getString(2));
                c.setDescripcion_categoria(rs.getString(3));
                lista.add(c);
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
    
    public CategoriaCliente getCategoriaCliente(int codigo){
        CategoriaCliente ct = new CategoriaCliente();
        try{
            this.conectar();
            String sql = "SELECT * FROM categoria_cliente WHERE id_categoria=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, codigo);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                ct.setId_categoria(rs.getInt(1));
                ct.setNombre_categoria(rs.getString(2));
                ct.setDescripcion_categoria(rs.getString(3));
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return ct;
    }
}
