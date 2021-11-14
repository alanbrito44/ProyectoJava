<%-- 
    Document   : ventas
    Created on : 24-oct-2021, 17:53:26
    Author     : KARSA
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.conexion.Conexion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Marca" %>
<%@page import="com.modelo.MarcaDAO" %>
<%@page import="com.modelo.CategoriaCliente"%>
<%@page import="com.modelo.CategoriaClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>


<%!    MarcaDAO daoMarca = new MarcaDAO();
    ArrayList<Marca> listaMarca = new ArrayList<>();
    CategoriaClienteDAO daocategoria = new CategoriaClienteDAO();
    ArrayList<CategoriaCliente> listaCategoria = new ArrayList<>();

%>

<%    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else if ((Integer) sesion.getAttribute("nivel") != 1) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/reportes.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"></span> <span>Reportes <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Reportes</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <h2 class="mb-3">Reporte de marca de vehiculos</h2>
                <form>
                    Elija la marca de vehiculo
                    <select class="form-control" name="marcaS">
                        <%
                            listaMarca = daoMarca.mostrarMarcas();
                            for (Marca elem : listaMarca) {
                        %>
                        <option value="<%=elem.getId_marca()%>"><%=elem.getNombre_marca()%></option>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit" class="btn btn-danger mt-4" name="btn">Generar Reporte</button>
                </form>
                <br>
                <form>
                    Elija categoria de cliente
                    <select class="form-control" name="catcli">
                        <%
                            listaCategoria = daocategoria.mostrarCategoriaCliente();
                            for (CategoriaCliente elem : listaCategoria) {
                        %>
                        <option value="<%=elem.getId_categoria()%>"><%=elem.getNombre_categoria()%></option>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit" class="btn btn-danger mt-4" name="btn2">Generar Reporte</button>
                </form>


            </div>
        </div>
    </div>
</section>

<%    
    if (request.getParameter("btn") != null) {
        int codigo = Integer.parseInt(request.getParameter("marcaS"));

        try {
            //esto lo creamos para poder mandar el parametro al momento de generar el reporte
            Map parametros = new HashMap();
            parametros.put("codigo", codigo);
            //primero hacemos el llamado de conexion a la base de datos
            Conexion con = new Conexion();
            con.conectar();
            //luego creamos una variable de tipo file, que tiene la ruta de donde se encuentra el reporte
            File file = new File(application.getRealPath("reportes/reporteMarcas.jasper"));
            //luego hacemos un arreglo de tipo bite para poder generar el reporte, donde le enviamos
            //el archivo, parametros si es que tenemos y la conexion
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parametros, con.getConexion());

            ServletOutputStream output = response.getOutputStream();
            //aqui le estamos diciendo que creamos un reporte de tipo pdf
            response.setContentType("application/pdf");
            //aqui le decimos el tamano que tendra el reporte, en este caso del arreglo bytes
            response.setContentLength(bytes.length);
            //con esto lle decimos que el reporte se mostrara desde el inicio osea posicion 0 hata la ultima 
            //posicion osea hastsa donde termino, esto lo sabemos por el byte.length
            output.write(bytes, 0, bytes.length);
            //aqui le obigamos al navegador que imprimi el reporte
            output.flush();
            output.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    if (request.getParameter("btn2") != null) {
        int id = Integer.parseInt(request.getParameter("catcli"));

        try {
            //esto lo creamos para poder mandar el parametro al momento de generar el reporte
            Map parametros = new HashMap();
            parametros.put("prueba", id);
            //primero hacemos el llamado de conexion a la base de datos
            Conexion con = new Conexion();
            con.conectar();
            //luego creamos una variable de tipo file, que tiene la ruta de donde se encuentra el reporte
            File file = new File(application.getRealPath("reportes/reporteCatCli.jasper"));
            //luego hacemos un arreglo de tipo bite para poder generar el reporte, donde le enviamos
            //el archivo, parametros si es que tenemos y la conexion
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parametros, con.getConexion());

            ServletOutputStream output = response.getOutputStream();
            //aqui le estamos diciendo que creamos un reporte de tipo pdf
            response.setContentType("application/pdf");
            //aqui le decimos el tamano que tendra el reporte, en este caso del arreglo bytes
            response.setContentLength(bytes.length);
            //con esto lle decimos que el reporte se mostrara desde el inicio osea posicion 0 hata la ultima 
            //posicion osea hastsa donde termino, esto lo sabemos por el byte.length
            output.write(bytes, 0, bytes.length);
            //aqui le obigamos al navegador que imprimi el reporte
            output.flush();
            output.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
%>

<%@include file="../layout/footer.jsp" %>

