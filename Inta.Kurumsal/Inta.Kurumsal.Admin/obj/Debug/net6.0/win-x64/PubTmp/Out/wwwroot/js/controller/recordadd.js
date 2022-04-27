
var ReturnMainCategory = function () {
    GetAllTopCategoryLink(0);
    $("#selectedCategoryAdd").html("");
    $("#CategoryId").val(0)
}

var GetAllTopCategoryLink = function (Id) {
    $("#selectedCategoryAdd").html("");
    $("#CategoryId").val(Id)

    if (Id != 0) {
        $.ajax({
            url: "/Record/GetAllTopCategoryLink",
            type: "GET",
            dataType: 'html',
            data: { "id": Id },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function (data) {
                $("#selectedCategoryAdd").append(data);
            }, error: function (data) {

            }
        });
    }

    $("#Categorys").html("");
    $("#Categorys").append("<option value=''>Seçiniz</option>");
    $.ajax({
        url: "/Record/GetCategoryTree",
        type: "GET",
        dataType: 'json',
        data: { "CategoryId": Id },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                console.log(data[i].Name);
                $("#Categorys").append("<option value='" + data[i].Id + "'>" + data[i].Name + "</option>");
            }
        }, error: function (data) {

        }
    });
}


var htmlEditorLoad = function () {
    var shortContentEditor = CKEDITOR.instances['ShortContent'];
    if (shortContentEditor) { shortContentEditor.destroy(true); }
    CKEDITOR.replace('ShortContent', {
        enterMode: CKEDITOR.ENTER_BR,
        height: 250,
        filebrowserImageUploadUrl: '/Contents',//for uploading image
        filebrowserImageBrowseUrl: '/EditorImageUpload'
    });

    var shortExplanationEditor = CKEDITOR.instances['ShortExplanation'];
    if (shortExplanationEditor) { shortExplanationEditor.destroy(true); }
    CKEDITOR.replace('ShortExplanation', {
        enterMode: CKEDITOR.ENTER_BR,
        height: 250,
        filebrowserImageUploadUrl: '/Contents',//for uploading image
        filebrowserImageBrowseUrl: '/EditorImageUpload'
    });
}

var getRecord = function (id) {
    $.ajax({
        url: "/Record/Add",
        type: "GET",
        dataType: 'html',
        data: { "id": id, "partial": true },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            $("#saveForm").html(data);
            htmlEditorLoad();
            GetAllTopCategoryLink(SearchCategoryIdRequest);

        }, error: function (data) {

        }
    });
}


var deleteImage = function (id) {
    var onay = confirm("Resmi silmek istediğinizden emin misiniz?");
    if (onay) {

        $.ajax({
            url: "/Record/DeleteImage",
            type: "POST",
            dataType: 'json',
            data: { "id": id },
            success: function (response) {
                if (response == "OK") {
                    showAlert(".popupMessage", "Resim başarıyla silindi.", "success");
                    getRecord(id);

                }
            }
        });
    }
}

$(document).ready(function () {
    htmlEditorLoad();

    GetAllTopCategoryLink(SearchCategoryIdRequest);

    $("#Categorys").change(function () {
        GetAllTopCategoryLink($(this).val());
    });

    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        if ($("#CategoryId").val() == null) {
            setTimeout(function () {
                showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen kategori seçiniz.", "error");
            }, 100);
            return;
        }

        CKEDITOR.instances['ShortContent'].updateElement();
        CKEDITOR.instances['ShortExplanation'].updateElement();
        var form = new FormData($('form')[0]);

        $.ajax({
            url: "/Record/Save",
            type: "POST",
            data: form,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {

                if (data.ResultType == 0) {
                    if ($("#Id").val() == 0) {
                        $('#saveForm').find("input,select, textarea").val("");
                        CKEDITOR.instances['ShortContent'].setData("")
                        CKEDITOR.instances['ShortExplanation'].setData("")


                        GetAllTopCategoryLink(data.Data.CategoryId);
                        scroolTop(0, 300);
                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                        }, 100);

                        getRecord(null);
                    } else {
                        GetAllTopCategoryLink(data.Data.CategoryId);
                        scroolTop(0, 300);


                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                        }, 100);

                        getRecord(data.Data.Id)

                    }
                }
                else
                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                    }, 100);

                $(this).find("button[type='submit']").prop('disabled', false);

            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });

});