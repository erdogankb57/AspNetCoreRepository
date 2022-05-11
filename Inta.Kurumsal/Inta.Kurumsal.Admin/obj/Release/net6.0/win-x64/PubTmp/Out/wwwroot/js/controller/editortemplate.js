var table = null;
var htmlContent = null;

var loadRecord = function () {

    table = $('#dataTable').DataTable({
        "autoWidth": false,
        "ajax":
        {
            "url": "/EditorTemplate/GetDataList",
            "type": "post",
            "datatype": "json",
            "data": function (d) {
                return $.extend({}, d, {
                    "name": $('#name').val(),
                    "surname": $('#surname').val()

                })
            }
        },
        lengthMenu: lengthMenu,
        "columns": [
            { "data": null },
            { "data": "Id" },
            { "data": "Name" },
            {
                "mRender": function (data, type, row) {
                    return '<a href="/EditorTemplate/Add?id=' + row.Id + '" class="editor_edit">Düzenle</a> <a href="javascript:void(0)" onclick="javascript:deleteRecord(' + row.Id + ')" class="editor_remove">Sil</a>'
                }
            }

        ],
        "serverSide": "true",
        "columnDefs": [{
            'targets': 0,
            'checkboxes': {
                'selectRow': true
            },
            'searchable': false,
            'orderable': false,
            'className': 'dt-body-center',
            'render': function (data, type, full, meta) {
                return '<input type="checkbox" name="id[]" value="'
                    + data.Id + '">';
            }

        }],
        "select": {
            "style": "multi"
        },
        "order": [1, "desc"],
        "processing": "true",
        "language": dataGridLanguage,
        "fixedColumns": true

    });

    $("#dataTable").show();

    $('#example-select-all').on('click', function () {
        // Check/uncheck all checkboxes in the table
        var rows = table.rows({ 'search': 'applied' }).nodes();
        $('input[type="checkbox"]', rows).prop('checked', this.checked);
        if ($('#dataTable tbody tr').hasClass('selected')) {
            $('#dataTable tbody tr').removeClass('selected');
        } else {
            $('#dataTable tbody tr').addClass('selected')
        }
    });
}

var addRecordModal = function (id) {

    $.ajax({
        url: "/EditorTemplate/Add",
        type: "POST",
        dataType: 'html',
        data: { "id": id },
        success: function (response) {
            $("#addRecordModal").html($.parseHTML(response));
            $("#addRecordModal").modal('show');
            //değer atama

            var HtmlContentEditor = CKEDITOR.instances['HtmlContent'];
            if (HtmlContentEditor) { HtmlContentEditor.destroy(true); }
            CKEDITOR.replace('HtmlContent', {
                enterMode: CKEDITOR.ENTER_BR,
                height: 250
            });


            CKEDITOR.instances['HtmlContent'].setData($("#HtmlContent").val());


            //atanan değeri çekme
            //CKEDITOR.instances['Description'].getData();
        },
        error: function (response) {

        }
    });
}

var deleteRecord = function (id) {
    var onay = confirm("Bu kaydı silmek istediğinizden emin misiniz?");
    if (onay) {

        $.ajax({
            url: "/EditorTemplate/Delete",
            type: "POST",
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "ids": id },
            success: function (response) {
                debugger;
                table.ajax.reload();
                showAlert(".listMessage", "Kayıt silme işlemi başarıyla tamamlandı.", "success")

            },
            error: function (response) {
                showAlert(".listMessage", "Kayıt silme işlemi sırasında hata oluştu.", "error")
            }
        });
    }
}


$(document).ready(function () {
    loadRecord();


    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        CKEDITOR.instances['HtmlContent'].updateElement();
        var formData = new FormData($('form')[0]);

 
        $.ajax({
            url: "/EditorTemplate/Save",
            type: "POST",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.ResultType == 0) {
                    if ($("#Id").val() == 0) {
                        $('#saveForm').find("input,select, textarea").val("");
                        CKEDITOR.instances['HtmlContent'].setData("");
                    }


                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                    }, 100);
                }
                else {
                    setTimeout(function () {
                        showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                    }, 100);
                }
                                
                $("#saveForm").find("button[type='submit']").prop('disabled', false);


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            }
        });
    });



    $('#deleteAllRecord').click(function (e) {

        var onay = confirm("Seçilen kayıtları silmek istediğinizden emin misiniz?");
        if (onay) {
            var form = $(".saveForm form");
            var ids = "";

            table.$('input[type="checkbox"]').each(function () {
                if (this.checked) {
                    ids += this.value + ",";

                    ids = ids.trim(",");
                }
            });

            ids = ids.substring(0, ids.length - 1);
            if (ids.length == 0) {
                showAlert(".listMessage", "Lütfen silmek istediğiniz kayıtları seçiniz.", "error");
                return;
            }



            $.ajax({
                url: "/EditorTemplate/Delete",
                type: "POST",
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: { "ids": ids },
                success: function (response) {
                    debugger;
                    table.ajax.reload();
                    showAlert(".listMessage", "Kayıt silme işlemi başarıyla tamamlandı.", "success");

                    $("#example-select-all").prop("checked", false);

                },
                error: function (response) {
                    showAlert(".listMessage", "Kayıt silme işlemi sırasında hata oluştu.", "error");

                }
            });
        }
    });



});