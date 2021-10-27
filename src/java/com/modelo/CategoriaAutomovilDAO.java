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
    
    public ArrayList<CategoriaAutomovil> mostrarCategoriaAuto(){
        ArrayList<CategoriaAutomovil> lista = new ArrayList<>();
        try{
            this.conectar();
            String sql = "SELECT * FROM categoria_automovil";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            //el resultSet se debe utilizar cuando la consulta sql es de tipo select
            ResultSet rs;
            //para ejecutar la consulta utilizamos executeQuery ya que es un select
            //en donde se almacena cada una de las filas y columnas en la sentencia que hemos realizado
            rs = pre.executeQuery();
            //aqui decimos que mientras rs tenga datos se recorra la variable
            //y que cuando se encuentren los valores se agreguen a la lista
            while(rs.next()){
                CategoriaAutomovil c = new CategoriaAutomovil();
                //cuando ponemos getInt y el getString podemos seleccionanr si queremos elegir el valor por el nombre 
                //de su columa o por el numero de su posicion
                c.setId_catAutomovil(rs.getInt(1));
                c.setNombre_categoria(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                
                //agrenado los valores a la lista
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
