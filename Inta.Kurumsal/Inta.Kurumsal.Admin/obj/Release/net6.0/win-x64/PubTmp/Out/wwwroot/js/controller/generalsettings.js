
$(document).ready(function () {

    $("#saveForm").unbind().submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $("#saveForm").find("button[type='submit']").prop('disabled', true);


        var formData = new FormData($('#saveForm')[0]);
        $.ajax({
            url: "/GeneralSettings/Save",
            type: "POST",
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
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

                $("#saveForm").find("button[type='submit']").prop('disabled', false);

            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });


});