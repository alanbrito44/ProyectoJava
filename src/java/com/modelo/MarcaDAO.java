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
public class MarcaDAO extends Conexion{
    public void insertarMarca(Marca m){
        try {
            this.conectar();
            String sql = "INSERT INTO marca_automovil (nombre_marca,descripcion,pais_marca) VALUES (?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, m.getNombre_marca());
            pre.setString(2, m.getDescripcion());
            pre.setString(3, m.getPais_marca());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void modificarMarca(Marca m){
        try{
            this.conectar();
            String sql = "UPDATE marca_automovil SET nombre_marca=?, descripcion=?, pais_marca=? WHERE id_marca=? ";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, m.getNombre_marca());
            pre.setString(2, m.getDescripcion());
            pre.setString(3, m.getPais_marca());
            pre.setInt(4, m.getId_marca());
            //en este caso como se esta realizando un update se ocupa el executeUpdate, para ejecutar la consulta
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void eliminarMarca(Marca m){
        try{
            this.conectar();
            String sql = "DELETE FROM marca_automovil WHERE id_marca=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, m.getId_marca());
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public ArrayList<Marca> mostrarMarcas(){
        ArrayList<Marca> lista = new ArrayList<>();
        try{
            this.conectar();
            String sql = "SELECT * FROM marca_automovil";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            //el resultSet se debe utilizar cuando la consulta sql es de tipo select
            ResultSet rs;
            //para ejecutar la consulta utilizamos executeQuery ya que es un select
            //en donde se almacena cada una de las filas y columnas en la sentencia que hemos realizado
            rs = pre.executeQuery();
            //aqui decimos que mientras rs tenga datos se recorra la variable
            //y que cuando se encuentren los valores se agreguen a la lista
            while(rs.next()){
                Marca m = new Marca();
                //cuando ponemos getInt y el getString podemos seleccionanr si queremos elegir el valor por el nombre 
                //de su columa o por el numero de su posicion
                m.setId_marca(rs.getInt(1));
                m.setNombre_marca(rs.getString(2));
                m.setDescripcion(rs.getString(3));
                m.setPais_marca(rs.getString(4));
                
                //agrenado los valores a la lista
                lista.add(m);
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
}
