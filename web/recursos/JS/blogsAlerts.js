/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
switch (accion) {
    case "Crear Blog":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'El Blog Se Ha Creado Correctamente',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El Blog No Se Creo, Intente De Nuevo',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "Subir Imagen":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Hubo Problema Al Subir la Imagen Al Servidor, Intenta De Nuevo.',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "Eliminar Imagen":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Eliminar La Imagen Del Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "Eliminar Entrada":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Entrada Eliminada',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }else{
             Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Eliminar La Entrada, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });   
        }
        break;
        case "Eliminar Blog":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Hubo Problemas Al Comunicarse Con El Servidor, No Se Pudo Eliminar La Entrada.',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "SubirImgEdit":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Subir La Nueva Imagen Al Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "EliminarImgOld":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Eliminar La Imagen Antigua Del Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "EditarUsuarioEntrada":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Actualizar El Usuario En La Entrada En Ell Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "Editar Entrada":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Editar La Entrada, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }else{
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Entrada Editada',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            }); 
        }
        break;
        case "CrearCat":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria Creada',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }else{
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Crear La Categoria',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "ModCat":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria Modificada',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }else{
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Modificar La Categoria, Intenta De Nuevo',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });   
        }
        break;
        case "DelCat":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria Eliminada',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }else{
            Swal.fire({
                icon: 'error',
                html: '<p class="h5">No Se puede Elimnar Categorias Si Hay Blogs Que La Usen'    
                    +' O Posiblemente Se Trate De Algún Problema Con El Servidor'
                    +' Contacta Con Tú Superior o Encargado de IT</p>',
                showConfirmButton: true,
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });   
        }
        break;
        case "":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Eliminar La Imagen Del Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;
        case "":
        if (!resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No Se Pudo Eliminar La Imagen Del Servidor, Intenta De Nuevo',
                showConfirmButton: true,
                heightAuto: false,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/blogs.jsp';
            });
        }
        break;


}

