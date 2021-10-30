<%-- 
    Document   : clientes
    Created on : 10-29-2021, 08:32:35 PM
    Author     : Javier Amaya
--%>

<%@page import="com.modelo.CategoriaCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Cliente"%>
<%@page import="com.modelo.CategoriaClienteDAO"%>
<%@page import="com.modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/cliente.png');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"></span> <span>Clientes <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Clientes</h1>
            </div>
        </div>
    </div>
</section>
<div class="container">
    <%!
        ClienteDAO daoCliente = new ClienteDAO();
        CategoriaClienteDAO daocategoria = new CategoriaClienteDAO();
        ArrayList<Cliente> listacliente = new ArrayList<>();
        ArrayList<CategoriaCliente> listaCategoria = new ArrayList<>();
    %>

    <h1>CRUD de clientes</h1>
    <div class="d-flex col-sm-4 ml-auto">
        <a href="ventas.jsp"> <button class="form-control btn btn-outline-success"type="submit" value="Ir a Ventas" name="txtIraVentas" src="ventas.jsp"/>Ir a Ventas</button>
        </a>
    </div>
    <button type="button" class="btn btn-primary btn-sm mt-4" data-toggle="modal" data-target="#mdlClientes" id="btnAgregar">
        Agregar
    </button>
    <table class="table table-dark text-center">
        <thead>
        <th>ID</th>
        <th>NOMBRE</th>
        <th>APELLIDO</th>
        <th>EDAD</th>
        <th>TELEFONO</th>
        <th>DIRECCION</th>
        <th>IDENTIFICACION</th>
        <th>NIT</th>
        <th>CATEGORIA</th>
        <th>ACCIONES</th>
        </thead>
        <tbody>
            <%                listacliente = daoCliente.mostrarCliente();
                for (Cliente elem : listacliente) {
            %> 
            <tr>
                <td class="id"><%=elem.getId_cliente()%></td>
                <td class="nombre"><%=elem.getNombre()%></td>
                <td class="apellido"><%=elem.getApellido()%></td>
                <td class="edad"><%=elem.getEdad()%></td>
                <td class="telefono"><%=elem.getTelefono()%></td>
                <td class="direccion"><%=elem.getDireccion()%></td>
                <td class="identificacion"><%=elem.getNumerodeidentidad()%></td>
                <td class="nit"><%=elem.getNit()%></td>
                <td class="categoria"><%=daocategoria.getCategoriaCliente(elem.getId_categoria_cliente()).getNombre_categoria()%></td>
                <td>
                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#mdlProductos" id="btnEditar">
                        Editar
                    </button>
                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#mdlProductos" id="btnEliminar">
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

<%@include file="../layout/footer.jsp" %>
<!-- Modal -->
<div class="modal fade" id="mdlClientes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Clientes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/ClientesServlet" method="POST">
                <div class="modal-body">
                    Nombre
                    <input type="text" class="form-control" name="txtNombre">
                    Apellido
                    <input type="text" class="form-control" name="txtApellido">
                    Edad
                    <input type="number" class="form-control" name="txtEdad">
                    telefono
                    <input type="text" class="form-control" name="txtTelefono">
                    Direccion
                    <input type="text" class="form-control" name="txtDireccion">
                    Identidad
                    <input type="text" class="form-control" name="txtIdentidad">
                    Nit
                    <input type="text" class="form-control" name="txtNit">
                    Categoria
                    <select class="form-control" name="sCategoria">
                        <%
                            listaCategoria = daocategoria.mostrarCategoriaCliente();
                            for (CategoriaCliente elem : listaCategoria) {
                        %>
                        <option value="<%=elem.getId_categoria()%>"><%=elem.getNombre_categoria()%></option>
                        <%
                            }
                        %>                  
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" name="btnAgregar">Agregar</button>
                    <button type="submit" class="btn btn-success" name="btnEditar">Editar</button>
                    <button type="submit" class="btn btn-danger" name="btnEliminar">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="../recursos/JS/clientes.js"></script>   
