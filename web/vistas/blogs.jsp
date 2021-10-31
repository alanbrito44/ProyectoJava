<%-- 
    Document   : blogs
    Created on : 24-oct-2021, 16:25:51
    Author     : KARSA
--%>

<%@page import="com.modelo.BlogDescripcionDao"%>
<%@page import="com.modelo.BlogDescripcion"%>
<%@page import="com.modelo.CategoriaDao"%>
<%@page import="com.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Integer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recursos/CSS/blogStyle.css">
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Our Blog</h1>
            </div>
        </div>
    </div>
</section>
<section class="ftco-section">
    <div class="container">
        <%            if (sesion.getAttribute("nivel") != null) {
        %>
        <div class="row mb-2">
            <div class="col-md-12 text-center ftco-animate">
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Nueva Entrada</button>
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Editar Entrada</button>
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" id="btnDelBlog">Eliminar Entrada</button>
            </div>
        </div>
        <div class="row mt-5 mb-5" id="SelectBlogAction">
            <div class="col-md-12 text-center ftco-animate">
                <div class="form-group ">
                    <form action="" method="POST">
                    <label for="txtDescripcion" class="col-form-label">Selecciona La Entada Del Blog A <span class="badge badge-danger">ELiminar</span></label>
                    <select class="form-control" name="sCategoria" style="max-width: 500px; margin: 0 auto;">
                        <%
                            BlogDescripcionDao bdao = new BlogDescripcionDao();
                            ArrayList<BlogDescripcion> listab=  new ArrayList<BlogDescripcion>();
                            listab = bdao.mostrarBlogs();
                            for (BlogDescripcion elem : listab) {
                        %>
                        <option value="<%= elem.getIdBlogDesc()%>"> <%=elem.getTitulo()%> </option>
                        <%
                            }
                        %>                  
                    </select>
                    <small class="col-form-label mt-5"><span class="badge badge-danger">No Podrás Deshacer Los Cambios</span> Una Vez Realiazados,<br>Asegurate De Que
                        En Verdad Deseas <span id="txtAccion">Elimnar La Entrada.</span></small><br>
                        <button type="submit" name="btnDelBlog" class="btn btn-outline-danger" value="EliminarEntrada" id="btnSelectBlog" style="margin: 0 auto; width: 500px; margin-top: 0.5em;">Eliminar</button>
                    </form>
                </div>
            </div>
        </div>
        
        <%
            }
        %> 
        <%
           BlogDescripcionDao bdao = new BlogDescripcionDao();
           ArrayList<BlogDescripcion> listaBlogs=  new ArrayList<BlogDescripcion>();
           listaBlogs = bdao.mostrarBlogs();
           
           for (BlogDescripcion elem : listaBlogs) {
         %>

        <div class="row d-flex justify-content-center">
            <div class="col-md-12 text-center d-flex ftco-animate">
                <div class="blog-entry justify-content-end mb-md-5">
                    <a href="${pageContext.request.contextPath}/vistas/blogContent.jsp?id='<%=elem.getIdBlogDesc()%>'" class="block-20 img" style="background-image: url('../recursos/Multimedia/ImagenesUpload/<%=elem.getImgPortada()%>');">
                    </a>
                    <div class="text px-md-5 pt-4">
                        <div class="meta mb-3">
                            <div><a href="#">Oct. 29, 2019</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                        <h3 class="heading mt-2"><a href="#"><%=elem.getTitulo()%></a></h3>
                        <p><%=elem.getDescrip()%></p>
                        <p><a href="${pageContext.request.contextPath}/vistas/blogContent.jsp?id='<%=elem.getIdBlogDesc()%>'" class="btn btn-primary">Continue <span class="icon-long-arrow-right"></span></a></p>
                    </div>
                </div>
            </div>

        </div>  
                 
         <%
               }
            
         %>
    </div>
</section>


<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Entradas Blog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formulario" action="${pageContext.request.contextPath}/blogControl" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" value="<%=sesion.getAttribute("id")%>" hidden>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Titulo Del Blog</label>
                        <input type="text" class="form-control" id="recipient-name" name="txtTitulo">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Descripción Corta Del Blog(Max 200 Caracteres)</label>
                        <textarea class="form-control" id="message-text" maxlength="200"  name="txtDescripcion"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Imagen Portada Blog (Solo JPG)</label>
                        <input type="file" class="form-control" id="recipient-name" accept=".jpg" name="imgDescripcion">
                    </div>
                    <div class="form-group">
                        <label for="txtDescripcion" class="col-form-label">Contenido Del Blog</label>
                        <textarea class="form-control" id="txtDescripcion" maxlength="200" name="txtContenido"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="txtDescripcion" class="col-form-label">Categoria Del Blog</label>
              <select class="form-control" name="sCategoria">
                  <%
                    CategoriaDao daoCat = new CategoriaDao();
                    ArrayList<Categoria> listaCat = new ArrayList<>();
                      listaCat = daoCat.mostrarCategorias();
                      for (Categoria cat: listaCat) {
                   %>
                  <option value="<%= cat.getIdetCat()%>"> <%=cat.getNombreCat()%> </option>
                  <%  
                      }
                  %>                  
              </select>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <input type="submit" class="btn btn-outline-success" id="btnCrear" name="Accion" value="Ingresar">
                    <input type="submit" class="btn btn-outline-warning" name="Accion" value="Guardar">
                </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    ClassicEditor
            .create(document.querySelector('#txtDescripcion'))
            .catch(error => {
                console.error(error);
            });
</script>
<script src="../recursos/JS/blogScript.js"></script>
<%@include file="../layout/footer.jsp" %>