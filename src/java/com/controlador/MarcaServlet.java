/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Marca;
import com.modelo.MarcaDAO;
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
public class MarcaServlet extends HttpServlet {

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

            Marca m = new Marca();
            MarcaDAO daoMarca = new MarcaDAO();
            String mensaje = "";

            m.setNombre_marca(request.getParameter("txtMarca"));
            m.setDescripcion(request.getParameter("txtDescripcion"));
            m.setPais_marca(request.getParameter("txtPais"));

            if (request.getParameter("btnAgregar") != null) {
                daoMarca.insertarMarca(m);
                //response.sendRedirect(request.getContextPath() + "/vistas/cars.jsp");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Modelo ingresado con exito');");
                out.println("location='vistas/cars.jsp';");
                out.println("</script>");
            } else if (request.getParameter("btnEditar") != null) {
                m.setId_marca(Integer.parseInt(request.getParameter("txtIdMarca")));
                daoMarca.modificarMarca(m);
                //response.sendRedirect(request.getContextPath() + "/vistas/cars.jsp");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Modelo editado con exito');");
                out.println("location='vistas/cars.jsp';");
                out.println("</script>");
            } else if (request.getParameter("btnEliminar") != null) {
                m.setId_marca(Integer.parseInt(request.getParameter("txtIdMarca")));
                daoMarca.eliminarMarca(m);
                //response.sendRedirect(request.getContextPath() + "/vistas/cars.jsp");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Modelo elimanado con exito');");
                out.println("location='vistas/cars.jsp';");
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
