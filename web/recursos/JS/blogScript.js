$(document).ready(function(){
$("div[lang='en']").attr("lang","es");

$("#newEntry").on("click",function(){
 //se programarÃ¡ limpiar el formulario cuando ya se corrija el problema
 //con el textarea.
    $("#formulario")[0].reset();
    $("#areaEdit").hide()
    $("#areaNew").show();
    ClassicEditor
        .create(document.querySelector('#txtNewContent'))
        .catch(error => {
        console.error(error);
    });
});


    //ESTABA PROGRAMADO PARA ELIMINAR, PERO PASO PARA 
    //CRUD CATEGORIAS BLOG
    $("#SelectBlogAction").toggle();
    



    $('body').on('click', '#delete', function () {

        let fila = $(this).closest('.padre');
        var codigo = fila.find('#idBlog').val();

        Swal.fire({
            title: 'Estas Seguro De Eliminar Esta Entrada?',
            text: "No PodrÃ¡s Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'SÃ­, Borrarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                var id = $("#idBlog").val();
                $(location).attr('href', 'http://localhost:8080/ProyectoFinal/blogControl?Accion=Eliminar&actionId=' + codigo);
            }
        })

    });   
    
    let contenidoBlog = (texto)=> {
        ClassicEditor
        .create(document.querySelector('#txtDescripcion'))
        .then( editor => {
            editor.setData( texto);
        } )
        .catch(error => {
            console.error(error);
        });
    };    
    
    $('body').on('click', '#mod', function () {
        $("#ingresarBlog").hide();
        $("#guardarBlog").show();
        $("#areaEdit").show()
        $("#areaNew").hide();
        Swal.fire({
            title: 'Estas Seguro De Modificar Esta Entrada?',
            text: "No PodrÃ¡s Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'SÃ­, Modificar!'
        }).then((result) => {        
            //YA QUE HAY VARIOS DIVS CON LA MISMA CLASE, OBTENEMOS EL DIV DONDE
            //SE HACE CLICK PARA MODIFICAR
            let fila = $(this).closest('.padre');

            //CARGAMOS DATOS CON LA FILA
            cargarDatosModal(fila);

            //LLAMAMOS AL MODAL
            $("#miModal").modal("show");        
        });
    });
    
    function cargarDatosModal(fila){
        var idBlog = fila.find('#idBlog').val();        
        var titulo = fila.find("#titleBlog").text();
        var descripcion = fila.find("#descBlog").text();
        var categoria = fila.find("#categoriaBlog").text();
        // Se extrae el contenido del blog
        var texto = fila.find("#contenido").html();
        // Se invoca a la funciÃ³n que carga el textarea
        contenidoBlog(texto);       

        $("#codigoBlog").val(idBlog);
        $("#tituloBlog").val(titulo);
        $("#descripcionBlog").val(descripcion);        
        $('#sCategoria').find('option:contains('+categoria+')').prop('selected', true);
    }

});