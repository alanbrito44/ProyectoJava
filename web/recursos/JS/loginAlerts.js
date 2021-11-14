/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

switch (accion) {
    case "Crear usuario":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Usuario creado exitosamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "index.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El usuario no pudo ser creado',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'index.jsp';
            });
        }
        break;
    case "Eliminar usuario":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Usuario eliminado exitosamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "index.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El usuario no pudo ser eliminado',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'index.jsp';
            });
        }
        break;
    case "Editar usuario":
        if (resultado) {
            Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'Usuario editado exitosamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function () {
                location = "index.jsp";
            })
        } else {
            Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El usuario no pudo ser editado',
                showConfirmButton: true,
                customClass: 'nome',
                timer: 2000
            }).then(function () {
                location = 'index.jsp';
            });
        }
        break;
}
