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
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

<!-- Theme included stylesheets -->
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">
<script>
    var accion = "<%=request.getAttribute("action")%>";
    var resultado = <%=request.getAttribute("resultado")%>;
    var result ="<%=request.getAttribute("result")%>";
</script>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/recursos/Multimedia/Imagenes/blog.jpg');" data-stellar-background-ratio="0.5">
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
                <button id="newEntry" type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Nueva Entrada</button>
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" id="btnCatBlog">Categorias Blogs</button>
            </div>
        </div>
        <div class="row mt-5 mb-5" id="SelectBlogAction">
            <div class="col-md-12 text-center ftco-animate">
                <div>
                    <form id="fmCat" action="${pageContext.request.contextPath}/blogControl" method="POST">
                        <h5>CREAR NUEVA / EDITAR CATEGORIA</h5>
                        <div class="input-group mb-3 nameCat">
                            <input type="text" class="form-control" placeholder="Nombre De Categoria" id="txtCodCat" name="txtCodCat" hidden>
                            <input type="text" class="form-control" placeholder="Nombre De Categoria" id="Accion" value="" name="Accion" hidden>
                            <input type="text" class="form-control" placeholder="Nombre De Categoria Max(20 caracteres)" id="txtNombreCat" name="txtNombreCat" maxlength="20">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-success" id="btnNewCat" >AGREGAR</button>
                                <button type="button" class="btn btn-warning" id="btnModCat">GUARDAR</button>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                    <table class="my-3 table col-sm-12">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">CÓDIGO</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Categoria> lc = new ArrayList<Categoria>();
                                CategoriaDao cd = new CategoriaDao();
                                lc = cd.mostrarCategorias();

                                for (Categoria elem : lc) {
                            %>
                            <tr id="fila">
                                <td class="tdCode"><%=elem.getIdCat()%></td>
                                <td class="tdName"><%=elem.getNombreCat()%></td>
                                <td class="tdAction"><button id="btnDelCat" type="button" class="btn btn-outline-danger">Eliminar</button></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    </div>
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
           ArrayList<Categoria> listacat = new ArrayList<Categoria>();
           
           
           for (BlogDescripcion elem : listaBlogs) {
         %>

        <div class="row d-flex justify-content-center">
            <div class="col-md-12 text-center d-flex ftco-animate">
                <div class="blog-entry justify-content-end mb-md-5">
                    <a href="${pageContext.request.contextPath}/vistas/blogContent.jsp?Accion=CargarBlog&id=<%=elem.getIdBlogDesc()%>" class="block-20 img" style="background-image: url('${pageContext.request.contextPath}/recursos/Multimedia/ImagenesUpload/<%=elem.getImgPortada()%>');">
                    </a>
                    <div class="text px-md-5 pt-4 padre">
                        <div class="meta mb-3">
                            <div><%=elem.getFecha()%></div>
                            <input type="text" id="idBlog" value="<%=elem.getIdBlog()%>" hidden>
                            <input type="text" id="nombreImgActual"  value="<%=elem.getImgPortada()%>" hidden>
                            <div><%=bdao.usuarioBlog(elem.getIdBlog())%>
                                    <spam id="categoriaBlog" class="bg-success text-white p-1 mx-1"><%=bdao.cargarCategoria(elem.getIdCat())%></spam>
                                     <% if (sesion.getAttribute("nivel") != null) {
                                     %>
                                    <i id="delete" class="mx-2 text-white btn btn-danger fas fa-trash-alt"></i>
                                    <i id="mod" class="mx-1 text-white btn btn-warning far fa-edit"></i>
                                    <%
                                        }
                                    %>
                            </div>
                        </div>
                        <h3 id="titleBlog" class="heading mt-2"><a href="${pageContext.request.contextPath}/vistas/blogContent.jsp?Accion=CargarBlog&id=<%=elem.getIdBlog()%>"><%=elem.getTitulo()%></a></h3>
                        <p id="descBlog"><%=elem.getDescrip()%></p>
                        <p><a href="${pageContext.request.contextPath}/vistas/blogContent.jsp?id=<%=elem.getIdBlog()%>" class="btn btn-primary">Continue <span class="icon-long-arrow-right"></span></a></p>
                        <div id="contenido"><%=elem.getContenido()%></div>
                    </div>
                </div>
            </div>

        </div>  
                 
         <%
               }
            
         %>
    </div>
</section>


<div id="miModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                        <input type="text" class="form-control" id="codigoBlog" name="txtIdBlog" value="" hidden>
                        <input type="text" value="" name="nombreImgActual" id="imgActual" hidden>
                    </div>
                    <div class="form-group">
                        <label for="tituloBlog" class="col-form-label">Titulo Del Blog</label>
                        <input type="text" class="form-control" id="tituloBlog" name="txtTitulo">
                    </div>
                    <div class="form-group">
                        <label for="descripcionBlog" class="col-form-label">Descripción Corta Del Blog(Max 200 Caracteres)</label>
                        <textarea class="form-control" id="descripcionBlog" maxlength="200"  name="txtDescripcion"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="imagenBlog" class="col-form-label">Imagen Portada Blog (Solo JPG)</label>
                        <input type="file" class="form-control" id="imagenBlog" accept=".jpg" name="imgDescripcion">
                    </div>
                    <div class="form-group" >
                        <label for="txtDescripcion" class="col-form-label">Contenido Del Blog</label>
                        <div>
                            <textarea class="form-control"  id="editor" name="txtContenido"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtDescripcion" id="categoriaBlog" class="col-form-label">Categoria Del Blog</label>
              <select class="form-control" name="sCategoria" id="sCategoria">
                  <%
                    CategoriaDao daoCat = new CategoriaDao();
                    ArrayList<Categoria> listaCat = new ArrayList<>();
                      listaCat = daoCat.mostrarCategorias();
                      for (Categoria cat: listaCat) {
                   %>
                  <option value="<%= cat.getIdCat()%>"> <%=cat.getNombreCat()%> </option>
                  <%  
                      }
                  %>                  
              </select>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <input type="submit" id="ingresarBlog" class="btn btn-outline-success" id="btnCrear" name="Accion" value="Ingresar">
                    <input type="submit" id="guardarBlog" class="btn btn-outline-warning" name="Accion" value="Guardar">
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
  var quill = new Quill('#editor', {
    theme: 'snow'
  });

</script>
<script src="${pageContext.request.contextPath}/recursos/JS/blogScript.js"></script>
<script src="${pageContext.request.contextPath}/recursos/JS/blogsAlerts.js"></script>
<%@include file="../layout/footer.jsp" %>