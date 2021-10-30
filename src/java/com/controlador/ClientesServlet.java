/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Cliente;
import com.modelo.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javier Amaya
 */
public class ClientesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Cliente c = new Cliente();
            ClienteDAO daoCliente = new ClienteDAO();
            
            
            c.setNombre(request.getParameter("txtNombre"));
            c.setApellido(request.getParameter("txtApellido"));
            c.setEdad(Integer.parseInt(request.getParameter("txtEdad")));
            c.setTelefono(request.getParameter("txtTelefono"));
            c.setDireccion(request.getParameter("txtDireccion"));
            c.setNumerodeidentidad(request.getParameter("txtIdentidad"));
            c.setNit(request.getParameter("txtNit"));
            c.setId_categoria_cliente(Integer.parseInt(request.getParameter("sCategoria")));
            
            if(request.getParameter("btnEliminar")!=null){
                daoCliente.eliminarCliente(c);
                out.println("<script type=\"text/javascript\">");
                out.println("location='vistas/clientes.jsp';");
                out.println("</script>");
            } else if(request.getParameter("btnEditar")!=null){
                daoCliente.modificarCliente(c);
                out.println("<script type=\"text/javascript\">");
                out.println("location='vistas/clientes.jsp';");
                out.println("</script>");
            } else if(request.getParameter("btnAgregar")!=null){
                daoCliente.insertarCliente(c);
                out.println("<script type=\"text/javascript\">");
                out.println("location='vistas/clientes.jsp';");
                out.println("</script>");
            }   
            
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
