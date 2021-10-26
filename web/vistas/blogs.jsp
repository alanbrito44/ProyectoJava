<%-- 
    Document   : blogs
    Created on : 24-oct-2021, 16:25:51
    Author     : KARSA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>
<link rel="stylesheet" href="../recursos/CSS/blogStyle.css">
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
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 text-center d-flex ftco-animate justify-content-center my-3">
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Nueva Entrada</button>
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Editar Entrada</button>
                <button type="button" class="btn btn-outline-dark mx-5 p-2 accionBlog" data-toggle="modal" data-target=".bd-example-modal-lg">Eliminar Entrada</button>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 text-center d-flex ftco-animate">
                <div class="blog-entry justify-content-end mb-md-5">
                    <a href="${pageContext.request.contextPath}/vistas/blogContent.jsp" class="block-20 img" style="background-image: url('../recursos/Multimedia/Imagenes/image_1.jpg');">
                    </a>
                    <div class="text px-md-5 pt-4">
                        <div class="meta mb-3">
                            <div><a href="#">Oct. 29, 2019</a></div>
                            <div><a href="#">Admin</a></div>
                            <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                        </div>
                        <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        <p><a href="${pageContext.request.contextPath}/vistas/blogContent.jsp" class="btn btn-primary">Continue <span class="icon-long-arrow-right"></span></a></p>
                    </div>
                </div>
            </div>
            
        </div>
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
            <form enctype="multipart/form-data">
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Titulo Del Blog</label>
                    <input type="text" class="form-control" id="recipient-name">
                </div>
                <div class="form-group">
                    <label for="message-text" class="col-form-label">Descripción Corta Del Blog(Max 200 Caracteres)</label>
                    <textarea class="form-control" id="message-text" maxlength="200"></textarea>
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Imagen Portada Blog (Solo JPG)</label>
                    <input type="file" class="form-control" id="recipient-name" accept=".jpg">
                </div>
                <div class="form-group">
                    <label for="txtDescripcion" class="col-form-label">Contenido Del Blog</label>
                    <textarea class="form-control" id="txtDescripcion" maxlength="200"></textarea>
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Imagen Adicional Blog (Solo JPG)</label>
                    <input type="file" class="form-control" id="recipient-name" accept=".jpg">
                   <small id="emailHelp" class="form-text text-muted">
                      Esta Imagen Aparecerá Al Final Del Contenido Del Blog.
                   </small>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-outline-success">Aceptar</button>
        <button type="button" class="btn btn-outline-warning">Guardar</button>
      </div>
    </div>
  </div>
</div>
<script>
    ClassicEditor
        .create( document.querySelector( '#txtDescripcion' ) )
        .catch( error => {
        console.error( error );
        } );
</script>

<%@include file="../layout/footer.jsp" %>
