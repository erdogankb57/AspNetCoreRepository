$(function () {
    $("#loginForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        var formData = new FormData($('#loginForm')[0]);
        $.ajax({
            url: "/Login/SignIn",
            type: "POST",
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (data) {

                if (data.Status == "OK") {
                    location.href = data.ReturnUrl;
                } else {
                    showAlert(".loginMessage", data.Message, "error");
                }
                $(this).find("button[type='submit']").prop('disabled', false);


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Login işlemi sırasında hata oluştu. Lütfen tekrar deneyiniz.", "error");
                }, 100);
            }
        });
    });

})