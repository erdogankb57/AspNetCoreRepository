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

                if (data == "OK") {
                    location.href = "/Home"
                } else {
                    showAlert(".loginMessage", "Kullanıcı adı veya şifre yanlış.", "error");
                }
                $(this).find("button[type='submit']").prop('disabled', false);


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });

})