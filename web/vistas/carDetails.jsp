<%-- 
    Document   : carDetails
    Created on : 24-oct-2021, 17:30:41
    Author     : KARSA
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Automovil" %>
<%@page import="com.modelo.AutomovilDAO" %>
<%@page import="com.modelo.Marca" %>
<%@page import="com.modelo.MarcaDAO" %>
<%@page import="com.modelo.CategoriaAutomovil" %>
<%@page import="com.modelo.CategoriaAutomovilDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>

<%!    AutomovilDAO daoAutomovil = new AutomovilDAO();
    MarcaDAO daoMarca = new MarcaDAO();
    CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
    ArrayList<Automovil> listaAuto = new ArrayList<>();
%>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Car details <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Car Details</h1>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section ftco-car-details">
    <div class="container">
        <%            int id = Integer.parseInt(request.getParameter("id"));
            listaAuto = daoAutomovil.mostrarAutomovilID(id);
            for (Automovil elem : listaAuto) {
        %>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="car-details">
                    <div>
                        <image class="img rounded" src="../<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>"/>
                    </div>
                    <div class="text text-center">
                        <span class="subheading"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></span>
                        <h2><%=elem.getModelo_automovil()%></h2>
                        <span class="subheading">Precio $<%=elem.getPrecio()%></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services">
                    <div class="media-body py-md-4">
                        <div class="d-flex mb-3 align-items-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-dashboard"></span></div>
                            <div class="text">
                                <h3 class="heading mb-0 pl-3">
                                    Kilometrage
                                    <span><%=elem.getKilometrage()%></span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
            <div class="col-md d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services">
                    <div class="media-body py-md-4">
                        <div class="d-flex mb-3 align-items-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-pistons"></span></div>
                            <div class="text">
                                <h3 class="heading mb-0 pl-3">
                                    Transmision
                                    <span><%=elem.getTransmision()%></span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
            <div class="col-md d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services">
                    <div class="media-body py-md-4">
                        <div class="d-flex mb-3 align-items-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-car-seat"></span></div>
                            <div class="text">
                                <h3 class="heading mb-0 pl-3">
                                    Puertas
                                    <span><%=elem.getPuertas()%></span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
            <div class="col-md d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services">
                    <div class="media-body py-md-4">
                        <div class="d-flex mb-3 align-items-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-backpack"></span></div>
                            <div class="text">
                                <h3 class="heading mb-0 pl-3">
                                    Equipaje
                                    <span>hasta 2 bolsas</span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
            <div class="col-md d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services">
                    <div class="media-body py-md-4">
                        <div class="d-flex mb-3 align-items-center">
                            <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-diesel"></span></div>
                            <div class="text">
                                <h3 class="heading mb-0 pl-3">
                                    Combustible
                                    <span>Petroleo</span>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 pills">
                <div class="bd-example bd-example-tabs">
                    <div class="d-flex justify-content-center">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">Extras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Descripcion</a>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="features">
                                        <li class="check"><span class="ion-ios-checkmark"></span>Aire acondicionado</li>
                                        <li class="check"><span class="ion-ios-checkmark"></span>Silla para nino</li>
                                        <li class="check"><span class="ion-ios-checkmark"></span>GPS</li>
                                        <li class="check"><span class="ion-ios-checkmark"></span>Equipaje</li>
                                        <li class="check"><span class="ion-ios-checkmark"></span>Musica</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                            <p><%=elem.getDescripcion()%></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</section>

<section class="ftco-section ftco-no-pt">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                <span class="subheading">Choose Car</span>
                <h2 class="mb-2">Related Cars</h2>
            </div>
        </div>
        <div class="row">
            <%
                listaAuto = daoAutomovil.mostrarAutomovilTopDescrip();
                for (Automovil elem : listaAuto) {
            %>
            <div class="col-md-4">
                <div class="car-wrap rounded ftco-animate">
                    <div>
                        <image class="img rounded d-flex align-items-end" src="../<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>" width="50" height="50"/>
                    </div>
                    <div class="text">
                        <h2 class="mb-0"><a href="car-single.html"><%=elem.getModelo_automovil()%></a></h2>
                        <div class="d-flex mb-3">
                            <span class="cat"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></span>
                            <p class="price ml-auto">$<%=elem.getPrecio()%></p>
                        </div>
                        <p class="d-flex mb-0 d-block"> <a class="btn btn-primary py-2 mr-1">Stock (<%=elem.getStock()%>)</a> <a href="${pageContext.request.contextPath}/vistas/carDetails.jsp?id=<%=elem.getId_automovil()%>" class="btn btn-secondary py-2 ml-1">Detalles</a></p>
                        
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>

<%@include file="../layout/footer.jsp" %>