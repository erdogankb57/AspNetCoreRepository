var table = null;
var loadRecord = function () {

    table = $('#dataTable').DataTable({
        "autoWidth": false,
        "ajax":
        {
            "url": "/ContactInformation/GetDataList",
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
            { "data": "Email" },
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
        url: "/ContactInformation/Add",
        type: "POST",
        dataType: 'html',
        data: { "id": id },
        success: function (response) {
            $("#addRecordModal").html($.parseHTML(response));

            $("#deleteImage").click(function () {
                var onay = confirm("Resmi silmek istediğinizden emin misiniz?");
                if (onay) {

                    var id = $(this).attr("banner-id");
                    $.ajax({
                        url: "/ContactInformation/DeleteImage",
                        type: "POST",
                        dataType: 'json',
                        data: { "id": id },
                        success: function (response) {
                            if (response == "OK") {
                                table.ajax.reload(null, false)
                                showAlert(".popupMessage", "Resim başarıyla silindi.", "success");
                                addRecordModal($("#Id").val());
                            }
                        }
                    });
                }
            });

            $("#addRecordModal").modal('show');

        },
        error: function (response) {

        }
    });
}

var deleteRecord = function (id) {
    var onay = confirm("Bu kaydı silmek istediğinizden emin misiniz?");
    if (onay) {

        $.ajax({
            url: "/ContactInformation/Delete",
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
        url: "/ContactInformation/ListUpdate",
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

        $("#saveForm").find("button[type='submit']").prop('disabled', true);


        var formData = new FormData($('#saveForm')[0]);
        $.ajax({
            url: "/ContactInformation/Save",
            type: "POST",
            data: formData,
            dataType: 'json',
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.ResultType == 0) {
                    console.log($("#Id").val());
                    if ($("#Id").val() == "")
                        addRecordModal(null);
                    else {
                        addRecordModal(data.Data.Id);
                    }
                    scroolTop(0, 300);
                    table.ajax.reload(null, false)

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
                url: "/ContactInformation/Delete",
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