/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.CategoriaAutomovil;
import com.modelo.CategoriaAutomovilDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karsa
 */
public class CatAutoServlet extends HttpServlet {

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

            CategoriaAutomovil c = new CategoriaAutomovil();
            CategoriaAutomovilDAO daoCat = new CategoriaAutomovilDAO();

            c.setNombre_categoria(request.getParameter("txtCategoria"));
            c.setDescripcion(request.getParameter("txtDescripCat"));

            if (request.getParameter("btnAgregarC") != null) {
                daoCat.insertarCategoria(c);
                String action = "Agregar categoria";
                request.setAttribute("action", action);
                request.setAttribute("resultado", true);
                request.getRequestDispatcher("vistas/cars.jsp").forward(request, response);
            } else if (request.getParameter("btnEditarC") != null) {
                c.setId_catAutomovil(Integer.parseInt(request.getParameter("txtIdCategotria")));
                daoCat.modificarCategoria(c);
                String action = "Editar categoria";
                request.setAttribute("action", action);
                request.setAttribute("resultado", true);
                request.getRequestDispatcher("vistas/cars.jsp").forward(request, response);;
            } else if (request.getParameter("btnEliminarC") != null) {
                c.setId_catAutomovil(Integer.parseInt(request.getParameter("txtIdCategotria")));
                boolean rs = daoCat.eliminarCategoria(c);
                String action = "Eliminar categoria";
                request.setAttribute("action", action);
                request.setAttribute("resultado", rs);
                request.getRequestDispatcher("vistas/cars.jsp").forward(request, response);
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
