$("#saveForm").submit(function (e) {
    e.preventDefault();
    $(".popupMessage").html("");
    $("button").val("Yükleniyor...")
    //ProgressClear($("#progressbar"));

    if ($(".file-upload").val() == null || $(".file-upload").val() == "") {
        showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen resim seçiniz.", "error"); return;
    }
    for (var i = 0; i < $(".file-upload").get(0).files.length; i++) {
        
        $("#progressbar").append('<div id="progress' + i + '"></div>');
        $("#progress" + i).progressbar({
            value: 0
        });
    }

    for (var i = 0; i < $(".file-upload").get(0).files.length; i++) {
        var formData = new FormData();
    
        $.ajax({
            //xhr: function () {
            //    var xhr = new window.XMLHttpRequest();

            //    / Upload progress
            //    xhr.upload.addEventListener("progress", function (evt) {
            //        if (evt.lengthComputable) {
            //            var percentComplete = evt.loaded / evt.total;
            //            //Do something with upload progress
            //           // ProgressStart($('#progress' + i + ''), parseInt(percentComplete * 100), 1);

            //            $("#progress" + i).progressbar({
            //                value: parseInt(percentComplete * 100
            //            });
            //        }
            //    }, false);


            //    return xhr;
            //},
            url: "/ContentImage/ImageBulkSave",
            type: "POST",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
            
     
                if (data.ResultType == 0) {
                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                    }, 100);
                }
                else {
                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                    }, 100);
                }


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
            , async: true
        });

    }

});