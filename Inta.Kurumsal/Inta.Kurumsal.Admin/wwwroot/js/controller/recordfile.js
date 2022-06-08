var table = null;
var loadRecord = function () {

    table = $('#dataTable').DataTable({
        "autoWidth": false,
        "ajax":
        {
            "url": "/RecordFile/GetDataList",
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
                "data": "OrderNumber",
                render: function (data, type, row) {
                    return '<input class="form-control OrderNumber" id="OrderNumber" name="OrderNumber" type="text"  value = ' + row.OrderNumber + '  >';
                }
            },
            {
                "mRender": function (data, type, row) {
                    return '<a href="javascript:void(0)" onclick="addRecordModal(' + row.Id + ')" class="editor_edit">Düzenle</a> <a href="javascript:void(0)" onclick="javascript:deleteRecord(' + row.Id + ')" class="editor_remove">Sil</a>'
                }
            }

        ],
        "drawCallback": function (settings) {
            $(".OrderNumber").on("change", function () {
                var $row = $(this).parents("tr");
                var rowData = table.row($row).data();

                rowData.OrderNumber = $(this).val();
            })
        },
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
        url: "/RecordFile/Add",
        type: "POST",
        dataType: 'html',
        data: { "id": id },
        success: function (response) {
            $("#addRecordModal").html($.parseHTML(response));


            $("#deleteFile").click(function () {
                var onay = confirm("Resmi silmek istediğinizden emin misiniz?");
                if (onay) {
                    $("#FileName").val("");
                    $("#saveForm").submit();
                }
            });

            $("#addRecordModal").modal('show');

        },
        error: function (response) {

        }
    });
}

var bulkRecordModal = function (id) {

    $.ajax({
        url: "/RecordFile/BulkAdd",
        type: "POST",
        dataType: 'html',
        data: { "id": id },
        success: function (response) {
            $("#bulkRecordModal").html($.parseHTML(decodeURI(response)));
            $("#bulkRecordModal").modal('show');
        },
        error: function (response) {

        }
    });
}
var deleteRecord = function (id) {
    var onay = confirm("Bu kaydı silmek istediğinizden emin misiniz?");
    if (onay) {

        $.ajax({
            url: "/RecordFile/Delete",
            type: "POST",
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "ids": id },
            success: function (response) {
                debugger;
                table.ajax.reload(null, false)
                showAlert(".listMessage", "Kayıt silme işlemi başarıyla tamamlandı.", "success")

            },
            error: function (response) {
                showAlert(".listMessage", "Kayıt silme işlemi sırasında hata oluştu.", "error")
            }
        });
    }
}

var dataTableUpdate = function () {
    var listData = $('#dataTable').DataTable().data().toArray();

    $.ajax({
        url: "/RecordFile/ListUpdate",
        type: "POST",
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(listData),
        success: function (response) {
            debugger;
            table.ajax.reload(null, false)
            showAlert(".listMessage", "Liste verileri başarıyla güncellendi.", "success")

        },
        error: function (response) {
            showAlert(".listMessage", "Liste verisi güncelleme işlemi sırasında hata oluştu.", "error")
        }
    });
}

$(document).ready(function () {
    loadRecord();

    $("#saveForm").submit(function (e) {
        e.preventDefault();

        if ($(this).FormValidate() == false)
            return;

        $(this).find("button[type='submit']").prop('disabled', true);


        var formData = new FormData($('#saveForm')[0]);
        $.ajax({
            url: "/RecordFile/Save",
            type: "POST",
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.ResultType == 0) {
                    console.log($("#Id").val());
                    if ($("#Id").val() == "") {
                        addRecordModal(null);
                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt işlemi başarıyla tamamlandı.", "success");
                        }, 100);
                    }
                    else {
                        addRecordModal(data.Data.Id);
                        setTimeout(function () {
                            showAlert(".popupMessage", "Kayıt güncelleme işlemi başarıyla tamamlandı.", "success");
                        }, 100);
                    }

                    table.ajax.reload(null, false)
                    scroolTop(0, 300);

                    
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

    $("#bulkSaveForm").submit(function (e) {
        e.preventDefault();
        $(".popupMessage").html("");
        ProgressClear($("#progressbar"));
        if ($(".file-upload").val() == null || $(".file-upload").val() == "") {
            showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen resim seçiniz.", "error"); return;
        }

        var fileCount = parseInt($(".file-upload").get(0).files.length)

        var formData = new FormData();
        for (var i = 0; i < fileCount; i++) {

            formData.append("file", $(".file-upload").get(0).files[i]);
        }

        $.ajax({
            xhr: function () {
                var xhr = new window.XMLHttpRequest();

                /// Upload progress
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = evt.loaded / evt.total;
                        //Do something with upload progress
                        // ProgressStart($("#progressbar"), parseInt(percentComplete * 100), 1);

                        $("#progressbar").progressbar({
                            value: parseInt(percentComplete * 100)
                        });
                    }
                }, false);

                return xhr;
            },
            url: "/RecordFile/ImageBulkSave",
            type: "POST",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.ResultType == 0) {
                    table.ajax.reload(null, false)

                    showAlert(".popupMessage", "Yükleme ve kayıt işlemleri başarıyla tamamlandı.", "success");

                    $("#upload-summary").html("Toplam Yüklenen dosya adedi: " + data.Data.length);
                }


            }, error: function (data) {
                setTimeout(function () {
                    showAlert(".popupMessage", "Kayıt işlemi sırasında hata oluştu. Lütfen alanları kontrol ediniz.", "error");
                }, 100);
            },
            async: true
        });


        $(".file-upload").val(null);
        table.ajax.reload(null, false)


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
                url: "/RecordFile/Delete",
                type: "POST",
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: { "ids": ids },
                success: function (response) {
                    debugger;
                    table.ajax.reload(null, false)
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