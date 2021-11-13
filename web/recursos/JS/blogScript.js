$(document).ready(function () {
    Carga();
    $("div[lang='en']").attr("lang", "es");
    $("#SelectBlogAction").hide();
    $("#btnModCat").attr("disabled", true);
    $("#btnNewCat").attr("disabled", false);

    $("#newEntry").on("click", function () {
        $("#guardarBlog").hide();
        $("#formulario")[0].reset();
        editor.destroy()
        .catch( error => {
        console.log( error );
    } );
    });

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

    let contenidoBlog = (texto) => {
        ClassicEditor
                .then(editor => {
                    editor.setData(texto);
                })
                .catch(error => {
                    console.error(error);
                });
    };

    $('body').on('click', '#mod', function () {
        $("#ingresarBlog").hide();
        $("#guardarBlog").show();

        $("#txtNewContent").hide();
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





    function cargarDatosModal(fila) {
        var idBlog = fila.find('#idBlog').val();
        var titulo = fila.find("#titleBlog").text();
        var descripcion = fila.find("#descBlog").text();
        var categoria = fila.find("#categoriaBlog").text();
        // Se extrae el contenido del blog
        var texto = fila.find("#contenido").html();
        // Se invoca a la funciÃ³n que carga el textarea
        $("#txtDescripcion").append(texto);

        $("#codigoBlog").val(idBlog);
        $("#tituloBlog").val(titulo);
        $("#descripcionBlog").val(descripcion);
        $('#sCategoria').find('option:contains(' + categoria + ')').prop('selected', true);
    }
    
    function Carga(){
               ClassicEditor
    .create( document.querySelector( '#txtDescripcion' ), {
            toolbar: [ 'heading', '|', 'bold', 'italic','bulletedList', 'numberedList', 'blockQuote' ],
            heading: {
                options: [
                    { model: 'paragraph', title: 'Párrafo', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Encabezado 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Encabezado 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Encabezado 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Encabezado 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Encabezado 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'h6', title: 'Encabezado 6', class: 'ck-heading_heading3' }
                ]
            }
        } )
        .then(editor => {
        console.log(editor);

    })
    .catch(error => {
        console.log(error);
    })
    }

});
