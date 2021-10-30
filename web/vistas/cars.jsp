<%-- 
    Document   : cars
    Created on : 24-oct-2021, 17:25:23
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
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>

<%!
    MarcaDAO daoMarca = new MarcaDAO();
    ArrayList<Marca> listaMarca = new ArrayList<>();
    AutomovilDAO daoAutomovil = new AutomovilDAO();
    ArrayList<Automovil> listaAuto = new ArrayList<>();
    CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
    ArrayList<CategoriaAutomovil> listaCate = new ArrayList<>();
%>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Choose Your Car</h1>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section bg-light">
    <div class="container">
        <%            if (sesion.getAttribute("nivel") == null) {
        %> 

        <%
        } else if ((Integer) sesion.getAttribute("nivel") == 1) {
        %> 
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-secondary py-3 px-4 mb-5 rounded ftco-animate" data-toggle="modal" data-target="#ModalAuto" data-backdrop="static" data-keyboard="false">
            Listado de vehiculos existentes
        </button>
        <button type="button" class="btn btn-primary py-3 px-4 mb-5 ml-2 rounded ftco-animate" data-toggle="modal" data-target="#ModalTabla" data-backdrop="static" data-keyboard="false">
            Listado marca de vehiculos
        </button>
        <%
            }
        %> 
        <div class="row">
            <div class="col-md-4">
                <div class="car-wrap rounded ftco-animate">
                    <div class="img rounded d-flex align-items-end" style="background-image: url(../recursos/Multimedia/Imagenes/car-1.jpg);">
                    </div>
                    <div class="text">
                        <h2 class="mb-0"><a href="car-single.html">Mercedes Grand Sedan</a></h2>
                        <div class="d-flex mb-3">
                            <span class="cat">Cheverolet</span>
                            <p class="price ml-auto">$500 <span>/day</span></p>
                        </div>
                        <p class="d-flex mb-0 d-block"><a href="${pageContext.request.contextPath}/vistas/carDetails.jsp" class="btn btn-secondary py-2 ml-1">Details</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="car-wrap rounded ftco-animate">
                    <div class="img rounded d-flex align-items-end" style="background-image: url(../recursos/Multimedia/Imagenes/car-2.jpg);">
                    </div>
                    <div class="text">
                        <h2 class="mb-0"><a href="car-single.html">Range Rover</a></h2>
                        <div class="d-flex mb-3">
                            <span class="cat">Subaru</span>
                            <p class="price ml-auto">$500 <span>/day</span></p>
                        </div>
                        <p class="d-flex mb-0 d-block"><a href="${pageContext.request.contextPath}/vistas/carDetails.jsp" class="btn btn-secondary py-2 ml-1">Details</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="car-wrap rounded ftco-animate">
                    <div class="img rounded d-flex align-items-end" style="background-image: url(../recursos/Multimedia/Imagenes/car-3.jpg);">
                    </div>
                    <div class="text">
                        <h2 class="mb-0"><a href="car-single.html">Mercedes Grand Sedan</a></h2>
                        <div class="d-flex mb-3">
                            <span class="cat">Cheverolet</span>
                            <p class="price ml-auto">$500 <span>/day</span></p>
                        </div>
                        <p class="d-flex mb-0 d-block"><a href="${pageContext.request.contextPath}/vistas/carDetails.jsp" class="btn btn-secondary py-2 ml-1">Details</a></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>             
<%@include file="../layout/footer.jsp" %>

<!-- Modal Tabla marca -->
<div class="modal fade" id="ModalTabla" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Listado de modelos disponibles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-dark text-center">

                    <thead>
                    <th>ID</th>
                    <th>MARCA</th>
                    <th>DESCRIPCION</th>
                    <th>PAIS</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                            listaMarca = daoMarca.mostrarMarcas();
                            for (Marca elem : listaMarca) {
                        %>
                        <tr>
                            <td class="id_marca"><%=elem.getId_marca()%></td>
                            <td class="nombre_marca"><%=elem.getNombre_marca()%></td>
                            <td class="descripcion_marca"><%=elem.getDescripcion()%></td>
                            <td class="pais_marca"><%=elem.getPais_marca()%></td>
                            <td>
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#modalAcciones" data-backdrop="static" data-keyboard="false" id="btnEditar">
                                    Editar
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalAcciones" data-backdrop="static" data-keyboard="false" id="btnEliminar">
                                    Eliminar
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAcciones" id="btnAgregar">
                    Agregar
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal crud marcas-->
<div class="modal fade" id="modalAcciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modelo de vehiculo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/MarcaServlet" method="POST">
                <div class="modal-body">


                    <input type="hidden" class="form-control" name="txtIdMarca">
                    Marca
                    <input type="text" class="form-control" name="txtMarca">
                    Descripcion
                    <textarea class="form-control" name="txtDescripcion"></textarea>
                    Pais
                    <input type="text" class="form-control" name="txtPais">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="btnAgregar">Agregar</button>
                    <button type="submit" class="btn btn-danger" name="btnEditar">Editar</button>
                    <button type="submit" class="btn btn-danger" name="btnEliminar">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Tabla automovil -->
<div class="modal fade" id="ModalAuto" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
    <div class="modal-dialog" role="document" style="max-width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Listado de autmoviles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-dark text-center">

                    <thead>
                    <th>ID</th>
                    <th>MODELO</th>
                    <th>PRECIO</th>
                    <th>PLACA</th>
                    <th>año</th>
                    <th>TRANSMISION</th>
                    <th>PUERTAS</th>
                    <th>KILOMETRAGE</th>
                    <th>COLOR</th>
                    <th>MARCA</th>
                    <th>CATEGORIA</th>
                    <th>IMAGEN</th>
                    <th>ACCIONES</th>
                    </thead>
                    <tbody>
                        <%
                            listaAuto = daoAutomovil.mostrarAutomovil();
                            for (Automovil elem : listaAuto) {
                        %>
                        <tr>
                            <!--LE AGREGAMOS LA CLASE CON ESE NOMBRE PARA UTILIZARLO EN JQUERY Y ASI SACAR SU VALOR-->
                            <td class="id"><%=elem.getId_automovil()%></td>
                            <td class="modelo"><%=elem.getModelo_automovil()%></td>
                            <td class="precio"><%=elem.getPrecio()%></td>
                            <td class="placa"><%=elem.getPlaca()%></td>
                            <td class="ano"><%=elem.getAno()%></td>
                            <td class="transmision"><%=elem.getTransmision()%></td>
                            <td class="puerta"><%=elem.getPuertas()%></td>
                            <td class="kilometrage"><%=elem.getKilometrage()%></td>
                            <td class="color"><%=elem.getColor()%></td>
     
                            <td class="marca"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></td>

                            <td class="categoria"><%=daoCate.getCategoria(elem.getId_catAutomovil()).getNombre_categoria()%></td>

                            <td class="imagen"><image src="../<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>" width="50" height="50"/></td>
                            <td>
                                <button type="button" class="btn btn-secondary ml-2" data-toggle="modal" data-target="#modalAccionesA" data-backdrop="static" data-keyboard="false" id="btnEditarA">
                                    Editar
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalAccionesA" data-backdrop="static" data-keyboard="false" id="btnEliminarA">
                                    Eliminar
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAccionesA" id="btnAgregarA">
                    Agregar
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal crud AUTOMOBIL-->
<div class="modal fade" id="modalAccionesA" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Informacion vehiculo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/AutomovilServlet" method="POST" enctype="multipart/form-data">
                <div class="modal-body">

                    <input type="hidden" class="form-control" name="txtIdAutomovil">
                    Modelo
                    <input type="text" class="form-control" name="txtModelo">
                    Precio
                    <input type="text" class="form-control" name="txtPrecio">
                    Placa
                    <input type="text" class="form-control" name="txtPlaca">
                    Ano
                    <input type="number" class="form-control" name="txtAno">
                    Transmision
                    <input type="text" class="form-control" name="txtTransmision">
                    Numero de puertas
                    <input type="number" class="form-control" name="txtPuerta">
                    Kilometrage
                    <input type="text" class="form-control" name="txtKilometrage">
                    Color
                    <input type="text" class="form-control" name="txtColor">
                    Marca
                    <select class="form-control" name="sMarca">
                        <%
                            listaMarca = daoMarca.mostrarMarcas();
                            //FOREACH PARA GENERAR EL SELECT CON TODOS LOS DATOS QUE SE ENCUENTRAN EN EL ARRAYLIST
                            for (Marca elem : listaMarca) {
                        %>
                        <option value="<%=elem.getId_marca()%>"><%=elem.getNombre_marca()%></option>
                        <%
                            }
                        %>
                    </select>
                    Categoria
                    <select class="form-control" name="sCategoria">
                        <%
                            listaCate = daoCate.mostrarCategoriaAuto();
                            //FOREACH PARA GENERAR EL SELECT CON TODOS LOS DATOS QUE SE ENCUENTRAN EN EL ARRAYLIST
                            for (CategoriaAutomovil elem : listaCate) {
                        %>
                        <option value="<%=elem.getId_catAutomovil()%>"><%=elem.getNombre_categoria()%></option>
                        <%
                            }
                        %>
                    </select>
                    Imagen
                    <input type="file" class="form-control" name="txtImagen">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="btnAgregarA">Agregar</button>
                    <button type="submit" class="btn btn-danger" name="btnEditarA">Editar</button>
                    <button type="submit" class="btn btn-danger" name="btnEliminarA">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>
                   
<!--SCRIPT PARA JQUERY-->    
<script src="../recursos/JS/Marca.js"></script>
