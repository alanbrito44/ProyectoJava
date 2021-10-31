/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Blog;
import com.modelo.BlogDao;
import com.modelo.BlogDescripcion;
import com.modelo.BlogDescripcionDao;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author dougl
 */
@MultipartConfig
public class blogControl extends HttpServlet {

    private String UPLOAD_DIR = "recursos/Multimedia/imagenesupload/";
  
 
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
            
            //obtenemos el valor del boton
            String accion = request.getParameter("Accion");            
           
          //lo evaluamos 
          switch(accion){
                case "Ingresar":
                    //si es ingresar obtenemos la imagen y su nombre del formulario
                    String imgNombre = request.getPart("imgDescripcion").getSubmittedFileName();
                    Part imagen = request.getPart("imgDescripcion");
                    InputStream is = imagen.getInputStream();
                    
                    
                    //llamo a la funcion que cree para subir imagen y lo seteo a un booleano
                    boolean resp = subirImagen(imgNombre, is);
                    
                    //si la carga de la imagen es verddera proceso a insertar los datos a la BD
                    if(resp){
                        
                        //primero creo el objeto blog (tabla intermedia entre usuario y blod_detalle)
                        BlogDao blogDao = new BlogDao();
                        int idUser = Integer.parseInt(request.getParameter("txtUsuario"));
                        blogDao.crearBlog(idUser);
                        
                        //mando a llamar el ultimo ID de la tabala blog que fue insertado para pasarlo 
                        //como foraneo a la tabla blod_detalle
                        int blogId=blogDao.obtenerIdBlog();
                        
                        
                        //creo el blod_descripcion para setear datos
                        BlogDescripcion blogModel = new BlogDescripcion();
                        blogModel.setIdBlog(blogId);
                        blogModel.setTitulo(request.getParameter("txtTitulo"));
                        blogModel.setDescrip(request.getParameter("txtDescripcion"));
                        blogModel.setImgPortada(imgNombre);
                        blogModel.setContenido(request.getParameter("txtContenido"));
                        blogModel.setIdCat(Integer.parseInt(request.getParameter("sCategoria")));
                        
                        //hago el insert del blog y su contenido
                        BlogDescripcionDao blogDescDao = new BlogDescripcionDao();
                        if(blogDescDao.insertarBlog(blogModel)){
                            //si se inserto mandamos alerta y redireccionamos
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Blog Creado con exito');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        }else{
                            //si no se inserto mandamos alerta y redireccionamos
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('No se pudo crear el blog, intenta de nuevo');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        }
                    }else{
                        //si no se carga la imagen damos aviso
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Se Pudo Cargar La Imagen Seleccionada, Intenta de Nuevo');");
                        out.println("location='vistas/blogs.jsp';");
                        out.println("</script>");
                    }
                    
                break;
                
            }
            

        }
    }
    /**
    
    *funcion que sube imagen a carpeta del servidor
    *recive un string con el nombre y el inputstream de la imagen para escribirla en la carpeta
    * retorna un booleano segun tenga exito o no
    
    
    */
    private boolean subirImagen(String imgNombre, InputStream is) throws FileNotFoundException, IOException{
       //creamos el directorio donde se va a subir la imagen
        String uploadPath =getServletContext().getRealPath("") + "\\"+ File.separator + UPLOAD_DIR + "\\";
        //creamos el archivo en la ruta antes establecida
        File f = new File(uploadPath + imgNombre);
        //creamos la clase para usar el metodo de escritura de archivos con el metodo write;
        FileOutputStream ous = new FileOutputStream(f);
        //obtenemos los datos o serie de numeros que forman la imagen
        int datoImg = is.read();
        
        try {
            //mientras su valor sea diferente a -1 (en -1 es que ya no hay datos que leer o escribir)
            while (datoImg != -1) {
                //que escriba la imagen y actualice su valor
                ous.write(datoImg);
                datoImg = is.read();
            }
        }catch (Exception e) {
            //si hay falla imprimimos mensaje y retornamos false
            out.println(e.getMessage());
            return false;
        }finally{
            //cerramos los metodos
            ous.flush();
            ous.close();
            is.close();
        }
        //si todo sale bien retornamos true
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
