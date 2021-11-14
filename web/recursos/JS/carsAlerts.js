/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


switch (accion) {
    case "Crear Carro":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'El Carro Se Ha Creado Correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El carro No Se Creo, Intente De Nuevo',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Eliminar Carro":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Automovil eliminada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El Carro no Se Ha Eliminado Correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Editar Carro":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Automovil editado correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Automovil no pudo ser editado correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
        case "No carro":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Debe agregar una imagen de carro',
                showConfirmButton: true,
                timer: 2000
            })
        }
        break;



        //ALERTAS PARA CATEGORIAS DE CARROS
    case "Agregar categoria":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria creada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Categoria no pudo ser creada correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Eliminar categoria":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria eliminada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No puedes borrar una categoria que este asignada a un automovil.',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Editar categoria":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Categoria editada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Categoria no pudo ser editada correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;



        //ALERTAS PARA MARCAS DE CARROS
    case "Agregar marca":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Marca creada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Marca no pudo ser creada correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Eliminar marca":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Marca eliminada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'No puedes borrar una marca que este asignada a un automovil.',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
    case "Editar marca":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Marca editada correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "vistas/cars.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'Marca no pudo ser editada correctamente',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'vistas/cars.jsp';
            });
        }
        break;
}