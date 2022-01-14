$(function () {
    var ListImageLoad = function () {
        $('#fileList').find('option').remove();

        $.ajax({
            url: "/ImageUpload/GetImageList",
            type: "GET",
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].Name);
                    $("#fileList").append("<option value='" + data[i].FullName + "'>" + data[i].Name + "</option>");
                }
            }, error: function (data) {

            }
        });
    }
    ListImageLoad();

    $("#fileList").change(function () {
        $("#imagePreview").css("display", "block");
        $("#imagePreview").attr("src", $(this).val());
    });

    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        var form = new FormData($('form')[0]);


        $.ajax({
            url: "/ImageUpload/Save",
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

                $(this).find("button[type='submit']").prop('disabled', false);

            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Resim yükleme işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });



})