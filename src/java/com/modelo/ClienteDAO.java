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
public class ClienteDAO extends Conexion{       
    public void insertarCliente(Cliente c){
        try {
            this.conectar();
            String sql = "INSERT INTO cliente VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, c.getId_cliente());
            pre.setString(2, c.getNombre());
            pre.setString(3, c.getApellido());
            pre.setInt(4, c.getEdad());
            pre.setString(5, c.getTelefono()); 
            pre.setString(6, c.getDireccion());
            pre.setString(7, c.getNumerodeidentidad());
            pre.setString(8, c.getNit());
            pre.setInt(9, c.getId_categoria_cliente());
            
            pre.executeUpdate();          
            
                        
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    public ArrayList<Cliente> mostrarCliente(){
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM cliente";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Cliente c = new Cliente();
                c.setId_cliente(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellido(rs.getString(3));
                c.setEdad(rs.getInt(4));
                c.setTelefono(rs.getString(5));
                c.setDireccion(rs.getString(6));
                c.setNumerodeidentidad(rs.getString(7));
                c.setNit(rs.getString(8));
                c.setId_categoria_cliente(rs.getInt(9));
                
                lista.add(c);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public void modificarCliente(Cliente c){
        try {
            this.conectar();
            String sql = "UPDATE cliente SET nombre=?, apellido=?, edad=?, telefono=?, direccion=?,"
                    + "numero_de_identidad=?, nit=?, id_categoria_cliente=? WHERE id_cliente=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);            
            pre.setString(1, c.getNombre());
            pre.setString(2, c.getApellido());
            pre.setInt(3, c.getEdad());
            pre.setString(4, c.getDireccion());
            pre.setString(5, c.getTelefono());
            pre.setString(6, c.getNumerodeidentidad());
            pre.setString(7, c.getNit());
            pre.setInt(8, c.getId_categoria_cliente());
            pre.setInt(9, c.getId_cliente());
            pre.executeUpdate();
            
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public void eliminarCliente(Cliente c){
        try {
            this.conectar();
            String sql = "DELETE FROM cliente WHERE id_cliente=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, c.getId_cliente());
            
            pre.executeUpdate();
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public ArrayList<Cliente> buscarCliente(int codigo){
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT nombre, numero_de_indentidad, nit  FROM cliente WHERE id_cliente=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, codigo);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Cliente c = new Cliente();
                c.setId_cliente(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setNumerodeidentidad(rs.getString(3));
                c.setNit(rs.getString(4));
                
                lista.add(c);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
     public Cliente getCliente(int codigo){
        Cliente c = new Cliente();
        try {
            this.conectar();
            String sql = "SELECT * FROM cliente WHERE id_cliente=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, codigo);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                c.setId_cliente(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellido(rs.getString(3));
                c.setEdad(rs.getInt(4));
                c.setTelefono(rs.getString(5));
                c.setDireccion(rs.getString(6));
                c.setNumerodeidentidad(rs.getString(7));
                c.setNit(rs.getString(8));
                c.setId_categoria_cliente(rs.getInt(9));
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return c;
    }
  
}

    


