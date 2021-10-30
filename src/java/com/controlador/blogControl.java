/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author dougl
 */
@MultipartConfig
public class blogControl extends HttpServlet {

    private String UPLOAD_DIR = "recursos/multimedia/imagenesupload";

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
            /* TODO output your page here. You may use following sample code. */
            
            String accion = request.getParameter("Accion");

            
            switch(accion){
                case "Ingresar":
                    String imgNombre = request.getPart("imgDescripcion").getSubmittedFileName();
                    Part imagen = request.getPart("imgDescripcion");
                    InputStream is = imagen.getInputStream();
                    
                    
                    
                    boolean resp = subirImagen(imgNombre, is);
                    
                    if(resp){
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Blog ingresado con exito');");
                        out.println("location='vistas/blogs.jsp';");
                        out.println("</script>");
                        //response.sendRedirect(request.getContextPath() + "/vistas/blogs.jsp");
                    }else{
                        out.print("<script>Alert('error');</script>");
                        response.sendRedirect(request.getContextPath() + "/vistas/blogs.jsp");
                    }
                    
                break;
                
            }
            

        }
    }
  
    private boolean subirImagen(String imgNombre, InputStream is) throws FileNotFoundException, IOException{
        String ruta1 = getServletContext().getRealPath("");
        String uploadPath = ruta1 + File.separator + UPLOAD_DIR + "\\";
        File f = new File(uploadPath + imgNombre);
        FileOutputStream ous = new FileOutputStream(f);
        int datoImg = is.read();
        
        try {
            while (datoImg != -1) {
                ous.write(datoImg);
                datoImg = is.read();
            }
        }catch (Exception e) {
            out.println(e.getMessage());
            return false;
        }finally{
            ous.flush();
            ous.close();
            is.close();
        }
        return true;
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
