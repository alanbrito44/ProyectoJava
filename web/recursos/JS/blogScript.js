/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    $("#SelectBlogAction").toggle();
    $("#btnDelBlog").on("click",function(){
        $("#SelectBlogAction").toggle();
    });

    $("#delete").on("click", function () {
        Swal.fire({
            title: 'Estas Seguro De Eliminar Esta Entrada?',
            text: "No Podrás Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, Borrarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                var id = $("#idBlog").val();
                 $(location).attr('href','http://localhost:8085/ProyectoFinal/blogControl?Accion=Eliminar&actionId='+id);
            }
        })
    });
    
    
        $("#mod").on("click", function () {
        Swal.fire({
            title: 'Estas Seguro De Modificar Esta Entrada?',
            text: "No Podrás Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, Modificar!'
        }).then((result) => {
            if (result.isConfirmed) {
                  alert("se muestra modal");
            }
        })
    });

});

