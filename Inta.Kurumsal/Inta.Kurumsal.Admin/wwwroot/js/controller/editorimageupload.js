﻿var CropImage = function () {
    var imageWidth = 700;
    var imageHeight = 700;

    const img = new Image();
    img.onload = function () {
        imageWidth = this.width;
        imageHeight = this.height;

        var boxWidth = imageWidth / 1.5;
        var oranDurumu = false;
        var boxHeight = boxWidth * imageHeight / imageWidth;
        if (oranDurumu == false) {
            boxHeight = boxWidth;
        }
        var x = imageWidth / 2 - boxWidth / 2;
        var y = imageHeight / 2 - boxHeight / 2;
        var x1 = x + boxWidth;
        var y1 = y + boxHeight;

        $("#imagePreview").Jcrop({
            aspectRatio: oranDurumu ? imageWidth / imageHeight : false,
            setSelect: [x, y, x1, y1],
            allowSelect: true,
            allowMove: true,
            allowResize: true,
            fixedSupport: true,
            //boxWidth: boxWidth,
            //boxHeight: boxHeight,
            boxWidth: imageWidth,
            boxHeight: imageHeight,
            trueSize: [imageWidth, imageHeight],
            onSelect: function (c) {
                console.log(c);
            }
        });
    }
    img.src = $("#imagePreview").attr("src");

}

$(function () {
    setTimeout(function () { $("#fileListImages").perfectScrollbar(); }, 200);

    var ListImageLoad = function () {
        $('#fileList').find('option').remove();

        $.ajax({
            url: "/EditorImageUpload/GetImageList",
            type: "GET",
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (data) {
                var img = "";
                for (var i = 0; i < data.length; i++) {
                    if (data[i].FullName == window.top.opener.CKEDITOR.dialog.getCurrent().preview.$.src.split(window.origin)[1]) {
                        img += "<a href='#'><img src='" + data[i].FullName + "' class='selected' /></a>";
                    } else {
                        img += "<a href='#'><img src='" + data[i].FullName + "'  /></a>";
                    }

                }
                $("#fileListImages").html(img);


                $("#fileListImages img").click(function () {
                    $("#jcrop").html("<img src='' id='imagePreview' />");
                    $("#imagePreview").css("display", "block");
                    $("#imagePreview").attr("src", $(this).attr("src"));
                    CropImage();

                });

            }, error: function (data) {

            }
        });

    }


    ListImageLoad();
   


    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        var form = new FormData($('form')[0]);


        $.ajax({
            url: "/EditorImageUpload/Save",
            type: "POST",
            data: form,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
                if (data == "OK") {
                    ListImageLoad();
                    setTimeout(function () {
                        showAlert(".popupMessage", "Resim yükleme işlemi başarıyla tamamlandı.", "success");
                    }, 100);
                } else if (data == "EXISTS") {
                    showAlert(".popupMessage", "Resim yükleme işlemi sırasında hata oluştu. Lütfen dosya ismini kontrol ediniz.", "error");
                }

                $("#saveForm").find("button[type='submit']").prop('disabled', false);
                $('#saveForm').trigger("reset");


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Resim yükleme işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });



})