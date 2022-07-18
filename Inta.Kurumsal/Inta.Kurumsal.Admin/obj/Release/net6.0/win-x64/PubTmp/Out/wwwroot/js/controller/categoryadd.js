
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
            url: "/Category/GetAllTopCategoryLink",
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
        url: "/Category/GetCategoryTree",
        type: "GET",
        dataType: 'json',
        data: {
            "CategoryId": Id, "id": $("#Id").val()
        },
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

var PageTypeSetting = function (id) {
    if (id == "" || id == undefined) {
        $("#explanationPanel").show();
        $("#shortExplanationPanel").show();
        return;
    }
    $.ajax({
        url: "/Category/GetPageType",
        type: "GET",
        dataType: 'json',
        data: {
            "Id": id
        }, success: function (data) {
            if (data.Data.IsShortExplanationEnabled) {
                $("#shortExplanationPanel").show();
            } else {
                $("#shortExplanationPanel").hide();
            }

            if (data.Data.IsExplanationEnabled) {
                $("#explanationPanel").show();
            } else {
                $("#explanationPanel").hide();
            }
        }, error: function (data) {

        }
    });
}

var htmlEditorLoad = function () {
    var explanationEditor = CKEDITOR.instances['Explanation'];
    if (explanationEditor) { explanationEditor.destroy(true); }
    CKEDITOR.replace('Explanation', {
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

var getCategory = function (id) {
    $.ajax({
        url: "/Category/Add",
        type: "GET",
        dataType: 'html',
        data: {
            "id": id, "partial": true
        },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            $("#saveForm").html((data));
            htmlEditorLoad();
            PageTypeSetting($("#PageTypeId").val());
            GetAllTopCategoryLink(SearchCategoryIdRequest);

        }, error: function (data) {

        }
    });
}

var deleteImage = function (id) {
    var onay = confirm("Resmi silmek istediğinizden emin misiniz?");
    if (onay) {

        $.ajax({
            url: "/Category/DeleteImage",
            type: "POST",
            dataType: 'json',
            data: { "id": id },
            success: function (response) {
                if (response == "OK") {
                    showAlert(".popupMessage", "Resim başarıyla silindi.", "success");
                    getCategory(id);
             
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
    })


    $("#PageTypeId").change(function () {
        PageTypeSetting($(this).val());
    })

    $("#saveForm").submit(function (e) {
        e.preventDefault();
        

        if ($(this).FormValidate() == false)
            return;

        $("#saveForm").find("button[type='submit']").prop('disabled', true);

        if ($("#CategoryId").val() == null) {
            setTimeout(function () {
                showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen kategori seçiniz.", "error");
            }, 100);
            return;
        }

        CKEDITOR.instances['ShortExplanation'].updateElement();
        CKEDITOR.instances['Explanation'].updateElement();


        var formData = new FormData($('#saveForm')[0]);

        $.ajax({
            url: "/Category/Save",
            type: "POST",
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (data) {
                $("#saveForm").find("button[type='submit']").prop('disabled', false);

                if (data.ResultType == 0) {
                    if ($("#Id").val() == 0) {
                        $('#saveForm').find("input,select, textarea").val("");
                        GetAllTopCategoryLink(data.Data.CategoryId);
                        scroolTop(0, 300);
                        getCategory(null);

                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                        }, 100);
                    } else {
                        GetAllTopCategoryLink(data.Data.CategoryId);
                        scroolTop(0, 300);
                        getCategory(data.Data.Id);

                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                        }, 100);
                    }


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

    PageTypeSetting($("#PageTypeId").val());


});