/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


switch(accion){
    case "Crear Carro":
        if(resultado){
                Swal.fire({
                position: 'bottom-end',
                icon: 'success',
                title: 'El Carro Se Ha Creado Correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function(){
                location ="vistas/cars.jsp";
            })
        }else{
                      Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El Carro No Se Ha Creado Correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function(){
                location ="vistas/cars.jsp";
            })
        }
      break;
    case "Eliminar Carro":
        if(resultado){
                Swal.fire({
                position: 'bottom-end',
                title: 'El Carro Se Ha Eliminado Correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function(){
                location ="vistas/cars.jsp";
            })
        }else{
                      Swal.fire({
                position: 'bottom-end',
                icon: 'error',
                title: 'El Carro No Se Ha Eliminado Correctamente',
                showConfirmButton: true,
                timer: 2000
            }).then(function(){
                location ="vistas/cars.jsp";
            })
        }
      break;
    }