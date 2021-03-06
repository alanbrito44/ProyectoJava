$(document).ready(function () {
    
    $("div[lang='en']").attr("lang", "es");
    $("#SelectBlogAction").hide();
    $("#btnModCat").attr("disabled", true);
    $("#btnNewCat").attr("disabled", false);

    $("#newEntry").on("click", function () {
        $("#guardarBlog").hide();
        $("#formulario")[0].reset();
        quill.setText("");
            
    } );

    //ESTABA PROGRAMADO PARA ELIMINAR, PERO PASO PARA 
    //CRUD CATEGORIAS BLOG
    $("#btnCatBlog").on("click", function () {
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
                var imagen = $("#nombreImgActual").val();
                $(location).attr('href', 'http://localhost:8080/ProyectoFinal/blogControl?Accion=Eliminar&actionId=' + codigo + '&imagen=' + imagen);
            }
        })

    });

    $('body').on('click', '#mod', function () {
        $("#ingresarBlog").hide();
        $("#guardarBlog").show();


        Swal.fire({
            title: 'Seguro que deseas editar esta entrada?',
            text: "No podrás deshacer los cambios!!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Editarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                //YA QUE HAY VARIOS DIVS CON LA MISMA CLASE, OBTENEMOS EL DIV DONDE
                //SE HACE CLICK PARA MODIFICAR
                let fila = $(this).closest('.padre');
                var img = $("#nombreImgActual").val();
                $("#imgActual").val(img);
                //CARGAMOS DATOS CON LA FILA
                cargarDatosModal(fila);

                //LLAMAMOS AL MODAL
                $("#miModal").modal("show");

            }
        })
    });


    $("body").on("click", "#fila", function () {

        $("#btnModCat").attr("disabled", false);
        $("#btnNewCat").attr("disabled", true);
        let fila = $(this).closest("tr");
        var codCat = fila.find(".tdCode").text();
        var nombreCat = fila.find(".tdName").text();

        $("#txtCodCat").val(codCat);
        $("#txtNombreCat").val(nombreCat);

    });

    $("#btnModCat").on("click", function () {
        Swal.fire({
            title: 'Seguro que deseas editar esta categoria?',
            text: "No podrás deshacer los cambios!!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Editarla!'
        }).then((result) => {
            if (result.isConfirmed) {
                $("#Accion").val("modCat");
                $("#fmCat").submit();

            }
        })

    });

    $("#btnNewCat").on("click", function () {
        $("#Accion").val("newCat");
        $("#fmCat").submit();

    });

    $("body").on("click", "#btnDelCat", function () {
        Swal.fire({
            title: 'Seguro que deseas eliminar esta categoria?',
            text: "No podrás deshacer los cambios!!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Eliminarla!'
        }).then((result) => {
            if (result.isConfirmed) {
                $("#Accion").val("modCat");
                let fila = $(this).closest("tr");
                var codCat = fila.find(".tdCode").text();


                $("#txtCodCat").val(codCat);
                $("#Accion").val("delCat");
                $("#fmCat").submit();

            }
        })
    });

quill.on('editor-change', function(eventName) {
  if (eventName === 'text-change') {
   var delta =  $("#editor").find('.ql-editor').html();
    $("#cnt").html(delta);
  }
});



    function cargarDatosModal(fila) {
        var idBlog = fila.find('#idBlog').val();
        var titulo = fila.find("#titleBlog").text();
        var descripcion = fila.find("#descBlog").text();
        var categoria = fila.find("#categoriaBlog").text();
        // Se extrae el contenido del blog
        

        // Se invoca a la funciÃ³n que carga el textarea
        var content = $("#contenido").html();
        $("#editor").find('.ql-editor').html(content);
       
        $("#codigoBlog").val(idBlog);
        $("#tituloBlog").val(titulo);
        $("#descripcionBlog").val(descripcion);
        $('#sCategoria').find('option:contains(' + categoria + ')').prop('selected', true);
    }
    

});
