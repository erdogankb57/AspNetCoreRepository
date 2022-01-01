$(document).ready(function () {

    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        var formData = new FormData($('#saveForm')[0]);
        $.ajax({
            url: "/Admin/Account/Save",
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
                else
                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                    }, 100);


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });

});