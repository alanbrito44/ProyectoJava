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
      ...
    </div>
  </div>
</div>

<%@include file="../layout/footer.jsp" %>
