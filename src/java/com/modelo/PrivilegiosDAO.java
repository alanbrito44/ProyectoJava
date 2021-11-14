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
public class PrivilegiosDAO extends Conexion{
    
    //funcion que solamente sirve para obtener el nombre del proveedor
    public Privilegios getPrivilegio(int id){
        Privilegios p = new Privilegios();
        try{
            this.conectar();
            String sql = "SELECT * FROM privilegios WHERE id_privilegios=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                p.setId_privilegios(rs.getInt(1));
                p.setNombre_privilegio(rs.getString(2));
                p.setDescripcion(rs.getString(3));
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return p;
    }
    
    public ArrayList<Privilegios> mostrarPrivilegis(){
        ArrayList<Privilegios> lista = new ArrayList<>();
        try{
            this.conectar();
            String sql = "SELECT * FROM privilegios";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Privilegios p = new Privilegios();
                p.setId_privilegios(rs.getInt(1));
                p.setNombre_privilegio(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                
                //agrenado los valores a la lista
                lista.add(p);
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
    
}
