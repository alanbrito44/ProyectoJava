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

<%!    MarcaDAO daoMarca = new MarcaDAO();
    ArrayList<Marca> listaMarca = new ArrayList<>();
    AutomovilDAO daoAutomovil = new AutomovilDAO();
    ArrayList<Automovil> listaAuto = new ArrayList<>();
    CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
    ArrayList<CategoriaAutomovil> listaCate = new ArrayList<>();
%>
<script>
    var accion ="<%=request.getAttribute("action")%>";
    var resultado = <%=request.getAttribute("resultado")%>
 </script>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/recursos/Multimedia/Imagenes/fondo.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Elige tu carro</h1>
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
        <div class="row">
            <div class="col-12 rounded ftco-animate text-center">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-outline-dark py-3 px-4 mb-lg-5 mb-3" data-toggle="modal" data-target="#ModalAuto" data-backdrop="static" data-keyboard="false">
                    Listado de vehiculos existentes
                </button>
                <button type="button" class="btn btn-outline-dark py-3 px-4 mb-lg-5 mb-3" data-toggle="modal" data-target="#ModalTabla" data-backdrop="static" data-keyboard="false">
                    Listado marca de vehiculos
                </button>
                <button type="button" class="btn btn-outline-dark py-3 px-4 mb-lg-5 mb-3" data-toggle="modal" data-target="#ModalCategoria" data-backdrop="static" data-keyboard="false">
                    Listado categoria de vehiculos
                </button>
            </div>
        </div>
        <%
            }
        %> 
        <div class="row">
            <%
                listaAuto = daoAutomovil.mostrarAutomovil();
                for (Automovil elem : listaAuto) {
                    
                if (elem.getStock()>0){
            %>
            <div class="col-md-4">
                <div class="car-wrap rounded ftco-animate">
                    <div>
                        <image class="img rounded d-flex align-items-end" src="${pageContext.request.contextPath}/<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>" width="50" height="50"/>
                    </div>
                    <div class="text">
                        <h2 class="mb-0"><a href="car-single.html"><%=elem.getModelo_automovil()%></a></h2>
                        <div class="d-flex mb-3">
                            <span class="cat"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></span>
                            <p class="price ml-auto">$<%=elem.getPrecio()%></p>
                        </div>
                        <p class="d-flex mb-0 d-block"> 
                            <a class="btn btn-primary py-2 mr-1">Stock (<%=elem.getStock()%>)</a> 
                            <a href="${pageContext.request.contextPath}/vistas/carDetails.jsp?id=<%=elem.getId_automovil()%>" class="btn btn-secondary py-2 ml-1">Detalles</a>
                        </p>                
                    </div>
                </div>
            </div>
            <%
                }
                }
            %>
        </div>

    </div>
</section>             


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
            <div class="modal-body" style="overflow-x:auto;"><!--el estilo se agrega para que le agregue una barra de navegacion cuando se haga mas pequena la pantalla-->
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
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalAcciones" data-backdrop="static" data-keyboard="false" id="btnEditar">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalAcciones" data-backdrop="static" data-keyboard="false" id="btnEliminar">
                                    <i class="fas fa-trash-alt"></i>
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
                    <input type="text" class="form-control" name="txtMarca" required="" maxlength="15">
                    Descripcion
                    <textarea class="form-control" name="txtDescripcion" required="" maxlength="250"></textarea>
                    Pais
                    <input type="text" class="form-control" name="txtPais" required="" maxlength="20">

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
    <div class="modal-dialog modal-xl" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Listado de autmoviles</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="overflow-x:auto;">
                <table class="table table-dark text-center">

                    <thead>
                    <th>ID</th>
                    <th>MODELO</th>
                    <th>PRECIO</th>
                    <th>MARCA</th>
                    <th>CATEGORIA</th>
                    <th>IMAGEN</th>
                    <th>STOCK</th>
                    <th>ACCIONES</th>
                    </thead>
                    <tbody>
                        <%
                            listaAuto = daoAutomovil.mostrarAutomovil();
                            for (Automovil elem : listaAuto) {
                        %>
                        <tr>
                            <!--LE AGREGAMOS LA CLASE CON ESE NOMBRE PARA UTILIZARLO EN JQUERY Y ASI SACAR SU VALOR-->
                            <td class="id_auto"><%=elem.getId_automovil()%></td>
                            <td class="modelo_auto"><%=elem.getModelo_automovil()%></td>
                            <td class="precio_auto" ><%=elem.getPrecio()%></td>
                            <td class="placa_auto" style="display:none;"><%=elem.getPlaca()%></td>
                            <td class="ano_auto" style="display:none;"><%=elem.getAno()%></td>
                            <td class="transmision_auto" style="display:none;"><%=elem.getTransmision()%></td>
                            <td class="puerta_auto" style="display:none;"><%=elem.getPuertas()%></td>
                            <td class="kilometrage_auto" style="display:none;"><%=elem.getKilometrage()%></td>
                            <td class="color_auto" style="display:none;"><%=elem.getColor()%></td>

                            <td class="marca_auto"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></td>

                            <td class="categoria_auto"><%=daoCate.getCategoria(elem.getId_catAutomovil()).getNombre_categoria()%></td>

                            <td class="imagen_auto"><img id="ruta" src="../<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>" width="50" height="50"/></td>
                            <td class="stock"><%=elem.getStock()%></td>
                            <td class="descripcion" style="display:none;"><%=elem.getDescripcion()%></td>
                            <td class="garantia" style="display:none;"><%=elem.getGarantia()%></td>
                            <td>
                                <button type="button" class="btn btn-warning" id="btnEditarA">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger" id="btnEliminarA">
                                    <i class="fas fa-trash-alt"></i>
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
            <form action="${pageContext.request.contextPath}/AutomovilServlet" method="POST" enctype="multipart/form-data" id="carro">
                <div class="modal-body">

                    <input type="hidden" class="form-control" name="txtIdAutomovil">
                    Modelo
                    <input type="text" class="form-control" name="txtModelo" required="" maxlength="20">
                    Precio
                    <input type="number" class="form-control" name="txtPrecio" required="">
                    Placa
                    <input type="text" class="form-control" name="txtPlaca" required="" maxlength="8" placeholder="P000-000">
                    Ano
                    <input type="number" class="form-control" name="txtAno" required="">
                    Transmision
                    <input type="text" class="form-control" name="txtTransmision" required="" maxlength="15">
                    Numero de puertas
                    <input type="number" class="form-control" name="txtPuerta" required="">
                    Kilometrage
                    <input type="number" class="form-control" name="txtKilometrage" required="">
                    Color
                    <input type="text" class="form-control" name="txtColor" required="" maxlength="20">
                    Garantia
                    <input type="text" class="form-control" name="txtGarantia" required="" maxlength="15">
                    Marca
                    <select class="form-control" name="sMarca" id="mod">
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
                    <select class="form-control" name="sCategoria" id="cat">
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
                    <input type="file" class="form-control" name="txtImagen" id="imagen">
                    <input type="hidden" class="form-control" name="txtRutaImg">
                    Stock 
                    <input type="number" class="form-control" name="txtStock" required="">
                    Descripcion
                    <textarea class="form-control" name="txtDescripcion" required="" maxlength="250"></textarea>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="accion" value="agregar">Agregar</button>
                    <button type="submit" class="btn btn-warning" name="accion" value="editar">Editar</button>
                    <button type="submit" class="btn btn-danger" name="accion" value="eliminar">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal Tabla categoria -->
<div class="modal fade" id="ModalCategoria" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Listado categoria vehiculos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="overflow-x:auto;">
                <table class="table table-dark text-center">

                    <thead>
                    <th>ID</th>
                    <th>CATEGORIA</th>
                    <th>DESCRIPCION</th>
                    <th>ACCIONES</th>
                    </thead>
                    <tbody>
                        <%
                            listaCate = daoCate.mostrarCategoriaAuto();
                            for (CategoriaAutomovil elem : listaCate) {
                        %>
                        <tr>
                            <td class="id_categoria"><%=elem.getId_catAutomovil()%></td>
                            <td class="nombre_categoria"><%=elem.getNombre_categoria()%></td>
                            <td class="descripcion_categoria"><%=elem.getDescripcion()%></td>
                            <td>
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalAccionesc" data-backdrop="static" data-keyboard="false" id="btnEditarC">
                                    <i class="far fa-edit"></i>
                                </button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalAccionesc" data-backdrop="static" data-keyboard="false" id="btnEliminarC">
                                    <i class="fas fa-trash-alt"></i>
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
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAccionesc" id="btnAgregarC">
                    Agregar
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal crud categoria-->
<div class="modal fade" id="modalAccionesc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Categoria de vehiculo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/CatAutoServlet" method="POST">
                <div class="modal-body">


                    <input type="hidden" class="form-control" name="txtIdCategotria">
                    Categoria
                    <input type="text" class="form-control" name="txtCategoria" required="" maxlength="20">
                    Descripcion
                    <textarea class="form-control" name="txtDescripCat" required="" maxlength="250"></textarea>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="btnAgregarC">Agregar</button>
                    <button type="submit" class="btn btn-danger" name="btnEditarC">Editar</button>
                    <button type="submit" class="btn btn-danger" name="btnEliminarC">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>                    

<!--SCRIPT PARA JQUERY-->    
<script src="${pageContext.request.contextPath}/recursos/JS/Marca.js"></script>
<script src="${pageContext.request.contextPath}/recursos/JS/automovil.js"></script>
<script src="${pageContext.request.contextPath}/recursos/JS/CatAutomovil.js"></script>
<script src="${pageContext.request.contextPath}/recursos/JS/carsAlerts.js"></script>

<%@include file="../layout/footer.jsp" %>