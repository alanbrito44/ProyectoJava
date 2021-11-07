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


    $('body').on('click', '#delete', function () {

        let fila = $(this).closest('.padre');
        var codigo = fila.find('#idBlog').val();

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
                $(location).attr('href', 'http://localhost:8080/ProyectoFinal/blogControl?Accion=Eliminar&actionId=' + codigo);
            }
        })

    });

    
    $('body').on('click', '#mod', function () {
        Swal.fire({
            title: 'Estas Seguro De Modificar Esta Entrada?',
            text: "No Podrás Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, Modificar!'
        }).then((result) => {
            
        let fila = $(this).closest('.padre');
        cargarDatosModal(fila);
        
        $("#miModal").modal("show");
        })
    });

});

function cargarDatosModal(fila){
       
        var idBlog = fila.find('#idBlog').val();        
        var titulo = fila.find("#titleBlog").text();
        var descripcion = fila.find("#descBlog").text();
        var categoria = fila.find("#categoriaBlog").text();
        

        $("#codigoBlog").val(idBlog);
        $("#tituloBlog").val(titulo);
        $("#descripcionBlog").val(descripcion);
        
        $('#sCategoria').find('option:contains('+categoria+')').prop('selected', true);
}