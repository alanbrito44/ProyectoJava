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
}
