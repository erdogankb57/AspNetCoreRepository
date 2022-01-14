var table = null;
var loadRecord = function () {


    table = $('#dataTable').DataTable({
        "ajax":
        {
            "url": "/Record/GetDataList",
            "type": "post",
            "datatype": "json"
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
                    return '<a href="/RecordFile/Index/' + row.Id + '?SearchId=' + SearchCategoryIdRequest + '" class="editor_edit">Dosya</a><a href="/RecordImage/Index/' + row.Id + '?SearchId=' + SearchCategoryIdRequest + '" class="editor_edit">Resim</a>  <a href="/Record/Add?id=' + row.Id + '" class="editor_edit">Düzenle</a>  <a href="javascript:void(0)" onclick="javascript:deleteRecord(' + row.Id + ')" class="editor_remove">Sil</a>'
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
        "language": dataGridLanguage
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
        url: "/Record/Add",
        type: "POST",
        dataType: 'html',
        data: { "id": id },
        success: function (response) {
            $("#addRecordModal").html($.parseHTML(response));
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
            url: "/Record/Delete",
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

var ReturnMainCategorySearch = function () {
    GetAllTopCategorySearchLink(0);
    $("#selectedSearCategory").html("");
    $("#SearchCategoryId").val(0)
    $("#SearchId").val(0)
}

var GetAllTopCategorySearchLink = function (Id) {
    $("#selectedCategory").html("");
    $("#SearchCategoryId").val(Id)
    $("#SearchId").val(Id)

    $.ajax({
        url: "/Record/GetAllTopCategorySearchLink",
        type: "GET",
        dataType: 'html',
        data: { "id": Id },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            $("#selectedCategory").append(data);
        }, error: function (data) {

        }
    });


    $("#CategorySearch").html("");
    $("#CategorySearch").append("<option value=''>Seçiniz</option>");
    $.ajax({
        url: "/Record/GetCategorySearchTree",
        type: "GET",
        dataType: 'json',
        data: {
            "CategoryId": Id
        },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                console.log(data[i].Name);
                $("#CategorySearch").append("<option value='" + data[i].Id + "'>" + data[i].Name + "</option>");
            }
        }, error: function (data) {

        }
    });
}

var dataTableUpdate = function () {
    var listData = $('#dataTable').DataTable().data().toArray();

    $.ajax({
        url: "/Record/ListUpdate",
        type: "POST",
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(listData),
        success: function (response) {
            debugger;
            table.ajax.reload();
            showAlert(".listMessage", "Liste verileri başarıyla güncellendi.", "success")

        },
        error: function (response) {
            showAlert(".listMessage", "Liste verisi güncelleme işlemi sırasında hata oluştu.", "error")
        }
    });
}


$(document).ready(function () {
    loadRecord();

    GetAllTopCategorySearchLink(SearchCategoryIdRequest);

    $("#CategorySearch").change(function () {
        GetAllTopCategorySearchLink($(this).val());
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

        $(this).find("button[type='submit']").prop('disabled', false);

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
                url: "/Record/Delete",
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