<%-- 
    Document   : index
    Created on : 24-oct-2021, 15:55:40
    Author     : KARSA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Marca" %>
<%@page import="com.modelo.MarcaDAO" %>
<%@page import="com.modelo.Automovil" %>
<%@page import="com.modelo.AutomovilDAO" %>
<%@page import="com.modelo.CategoriaAutomovil" %>
<%@page import="com.modelo.CategoriaAutomovilDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cars Toreto - venta de automoviles</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="recursos/CSS/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="recursos/CSS/animate.css">

        <link rel="stylesheet" href="recursos/CSS/owl.carousel.min.css">
        <link rel="stylesheet" href="recursos/CSS/owl.theme.default.min.css">
        <link rel="stylesheet" href="recursos/CSS/magnific-popup.css">

        <link rel="stylesheet" href="recursos/CSS/aos.css">

        <link rel="stylesheet" href="recursos/CSS/ionicons.min.css">

        <link rel="stylesheet" href="recursos/CSS/bootstrap-datepicker.css">
        <link rel="stylesheet" href="recursos/CSS/jquery.timepicker.css">


        <link rel="stylesheet" href="recursos/CSS/flaticon.css">
        <link rel="stylesheet" href="recursos/CSS/icomoon.css">
        <link rel="stylesheet" href="recursos/CSS/style.css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Cars<span>Toreto</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Inicio</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/about.jsp" class="nav-link">Nosotros</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/cars.jsp" class="nav-link">Carros</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/contacto.jsp" class="nav-link">Contacto</a></li>

                        <%
                            if (sesion.getAttribute("nivel") == null) {

                            } else if ((Integer) sesion.getAttribute("nivel") == 1) {
                        %>                  
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/ventas.jsp" class="nav-link">Venta</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/reportes.jsp" class="nav-link">Reportes</a></li> 
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/login.jsp?cerrar=true" class="nav-link">Salir</a></li>
                            <%
                            } else if ((Integer) sesion.getAttribute("nivel") != null) {
                            %>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/login.jsp?cerrar=true" class="nav-link">Salir</a></li>
                            <%
                                }
                            %>                  
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="hero-wrap ftco-degree-bg" style="background-image: url('recursos/Multimedia/Imagenes/bg_1.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
                    <div class="col-lg-8 ftco-animate">
                        <div class="text w-100 text-center mb-md-5 pb-md-5">
                            <h1 class="mb-4">Compra rapida y facil de tu automovil</h1>
                            <p style="font-size: 18px;">Somos tu empresa de confianza con la que puedes contar para la compra de tu primer vehiculo, ya sea nuevo modelo o modelos anteriores</p>
                            <a href="https://vimeo.com/45830194" class="icon-wrap popup-vimeo d-flex align-items-center mt-4 justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="ion-ios-play"></span>
                                </div>
                                <div class="heading-title ml-5">
                                    <span>Easy steps for renting a car</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%!
            MarcaDAO daoMarca = new MarcaDAO();
            ArrayList<Marca> listaMarca = new ArrayList<>();
            AutomovilDAO daoAutomovil = new AutomovilDAO();
            ArrayList<Automovil> listaAuto = new ArrayList<>();
            CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
            ArrayList<CategoriaAutomovil> listaCate = new ArrayList<>();
        %>

        <section class="ftco-section ftco-no-pt bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                        <span class="subheading">Que te ofrecemos</span>
                        <%
                            if (sesion.getAttribute("usuario") == null) {
                        %> 

                        <%
                        } else if (sesion.getAttribute("usuario") != null) {
                        %> 
                        <h2>Bienvenido <%=sesion.getAttribute("usuario")%></h2>
                        <h2>ID USUARIO <%=sesion.getAttribute("id")%></h2>
                        <%
                            }
                        %> 
                        <h2 class="mb-2">Ultimos vehiculos ingresados</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="carousel-car owl-carousel">
                            <%
                                listaAuto = daoAutomovil.mostrarAutomovilTop();
                                for (Automovil elem : listaAuto) {
                            %>
                            <div class="item">
                                <div class="car-wrap rounded ftco-animate">
                                    <div>
                                        <image class="img rounded d-flex align-items-end" src="<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>"/>
                                    </div>
                                    <div class="text">
                                        <h2 class="mb-0"><a href="#"><%=elem.getModelo_automovil()%></a></h2>
                                        <div class="d-flex mb-3">
                                            <span class="cat"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></span>
                                            <p class="price ml-auto">$<%=elem.getPrecio()%></p>
                                        </div>
                                        <p class="d-flex mb-0 d-block"><a href="${pageContext.request.contextPath}/vistas/carDetails.jsp?id=<%=elem.getId_automovil()%>" class="btn btn-secondary py-2 ml-1">Detalles</a></p>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-about">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(recursos/Multimedia/Imagenes/about.jpg);">
                    </div>
                    <div class="col-md-6 wrap-about ftco-animate">
                        <div class="heading-section heading-section-white pl-md-5">
                            <span class="subheading">About us</span>
                            <h2 class="mb-4">Welcome to Carbook</h2>

                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                            <p><a href="#" class="btn btn-primary py-3 px-4">Search Vehicle</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Testimonial</span>
                        <h2 class="mb-3">Happy Clients</h2>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/person_1.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Marketing Manager</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/person_2.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Interface Designer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/person_3.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">UI Designer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/person_1.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">Web Developer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/person_1.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Roger Scott</p>
                                        <span class="position">System Analyst</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Blog</span>
                        <h2>Recent Blog</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry justify-content-end">
                            <a href="blog-single.html" class="block-20" style="background-image: url('recursos/Multimedia/Imagenes/image_1.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry justify-content-end">
                            <a href="blog-single.html" class="block-20" style="background-image: url('recursos/Multimedia/Imagenes/image_2.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry">
                            <a href="blog-single.html" class="block-20" style="background-image: url('recursos/Multimedia/Imagenes/image_3.jpg');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href="#">Oct. 29, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="#">Why Lead Generation is Key for Business Growth</a></h3>
                                <p><a href="#" class="btn btn-primary">Read more</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	

        <section class="ftco-counter ftco-section img bg-light" id="section-counter">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="60">0</strong>
                                <span>Year <br>Experienced</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="1090">0</strong>
                                <span>Total <br>Cars</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="2590">0</strong>
                                <span>Happy <br>Customers</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text d-flex align-items-center">
                                <strong class="number" data-number="67">0</strong>
                                <span>Total <br>Branches</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	
        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2"><a href="#" class="logo">Car<span>book</span></a></h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Information</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">About</a></li>
                                <li><a href="#" class="py-2 d-block">Services</a></li>
                                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Customer Support</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                                <li><a href="#" class="py-2 d-block">How it works</a></li>
                                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="recursos/JS/jquery.min.js"></script>
        <script src="recursos/JS/jquery-migrate-3.0.1.min.js"></script>
        <script src="recursos/JS/popper.min.js"></script>
        <script src="recursos/JS/bootstrap.min.js"></script>
        <script src="recursos/JS/jquery.easing.1.3.js"></script>
        <script src="recursos/JS/jquery.waypoints.min.js"></script>
        <script src="recursos/JS/jquery.stellar.min.js"></script>
        <script src="recursos/JS/owl.carousel.min.js"></script>
        <script src="recursos/JS/jquery.magnific-popup.min.js"></script>
        <script src="recursos/JS/aos.js"></script>
        <script src="recursos/JS/jquery.animateNumber.min.js"></script>
        <script src="recursos/JS/bootstrap-datepicker.js"></script>
        <script src="recursos/JS/jquery.timepicker.min.js"></script>
        <script src="recursos/JS/scrollax.min.js"></script>
        <script src="recursos/JS/main.js"></script>

    </body>
</html>
