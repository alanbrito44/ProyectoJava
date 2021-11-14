/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Usuario;
import com.modelo.UsuarioDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Karsa
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class UsuarioServlet extends HttpServlet {

    //variable global con la ruta donde se guardaran las imagens, la cual no cambiara de valor por el final
    public static final String UPLOAD_DIR = "recursos/Multimedia/ImagenesUpload";
    //variable donde se guarda el nombre de la imagen
    public String dbFileName = "";

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

            String accion = request.getParameter("accion");
            Usuario usu = new Usuario();
            UsuarioDAO daousu = new UsuarioDAO();

            usu.setUsuario(request.getParameter("txtUsuario"));
            usu.setContraseña(request.getParameter("txtContra"));
            usu.setId_privilegio(Integer.parseInt(request.getParameter("sPrivilegios")));
            usu.setNombre(request.getParameter("txtNombre"));
            usu.setApellido(request.getParameter("txtApellido"));

            switch (accion) {
                case "agregar": {

                    Part part = request.getPart("txtImagenUsu");
                    String fileName = extractFileName(part);

                    String applicationPath = getServletContext().getRealPath("");
                    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                    System.out.println("applicationPath:" + applicationPath);

                    File fileUploadDirectory = new File(uploadPath);

                    if (!fileUploadDirectory.exists()) {
                        fileUploadDirectory.mkdirs();
                    }

                    String savePath = uploadPath + File.separator + fileName;
                    System.out.println("savePath: " + savePath);
                    String sRootPath = new File(savePath).getAbsolutePath();
                    System.out.println("sRootPath: " + sRootPath);
                    part.write(savePath + File.separator);
                    File fileSaveDir1 = new File(savePath);

                    String dbFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(savePath + File.separator);

                    usu.setImagen(dbFileName);
                    daousu.insertarUsuario(usu);

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Automovil eliminado con exito');");
                    out.println("location='index.jsp';");
                    out.println("</script>");

                }
                break;
                case "eliminar": {

                    usu.setId_usuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
                    daousu.eliminarUsuario(usu);

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Automovil eliminado con exito');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
                break;

                case "editar": {

                    if (request.getPart("txtImagenUsu").getSize() <= 0) {
                        usu.setImagen(request.getParameter("txtRutaImg"));
                        usu.setId_usuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
                        daousu.modificarUsuario(usu);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('SIN IMAGEN');");
                        out.println("location='index.jsp';");
                        out.println("</script>");
                    } else if (request.getPart("txtImagenUsu").getSize() > 0) {

                        Part part = request.getPart("txtImagenUsu");
                        String fileName = extractFileName(part);

                        String applicationPath = getServletContext().getRealPath("");
                        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                        System.out.println("applicationPath:" + applicationPath);

                        File fileUploadDirectory = new File(uploadPath);

                        if (!fileUploadDirectory.exists()) {
                            fileUploadDirectory.mkdirs();
                        }

                        String savePath = uploadPath + File.separator + fileName;
                        System.out.println("savePath: " + savePath);
                        String sRootPath = new File(savePath).getAbsolutePath();
                        System.out.println("sRootPath: " + sRootPath);
                        part.write(savePath + File.separator);
                        File fileSaveDir1 = new File(savePath);

                        String dbFileName = UPLOAD_DIR + File.separator + fileName;
                        part.write(savePath + File.separator);

                        usu.setImagen(dbFileName);
                        usu.setId_usuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
                        daousu.modificarUsuario(usu);

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('CON IMAGEN');");
                        out.println("location='index.jsp';");
                        out.println("</script>");;

                    }
                }
                break;
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

    private String extractFileName(Part part) {//funcion que recibe como parametro part para extraer el nombre del multipart

        //aqui devolvemos el valor que viene en content-disposition como string ya que viene form-data name="dataFile" filename="PHOTO.JPG"
        String contentDisp = part.getHeader("content-disposition");
        //con esto haces un array donde guarda y separa lo que viene en content-disposition con ;
        String[] items = contentDisp.split(";");
        for (String s : items) {//luego recorremos el array
            //con trim, eliminamos los espacios que vienen en el string, y con startwith, le decimos que del string queremos es lo viene en filename
            if (s.trim().startsWith("filename")) {
                //con conseguimos el valor de filename
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
