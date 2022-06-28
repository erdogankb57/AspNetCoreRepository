var table = null;

var loadRecord = function () {



    table = $('#dataTable').DataTable({
        "autoWidth": false,
        "ajax":
        {
            "url": "/Category/GetDataList",
            "type": "post",
            "datatype": "json",
            "data": function (d) {
                var dict = [];

                dict.push({
                    "Key": "CategoryId",
                    "Value": parseInt($("#SearchId").val() == "" ? 0 : $("#SearchId").val()),
                    "MergeOperator": 1,
                    "Operator": 1
                });

                dict.push({
                    "Key": "Name",
                    "Value": $("#categoryName").val(),
                    "MergeOperator": 1,
                    "Operator": 7
                });

                //dict.push({
                //    "Key": "IsActive",
                //    "Value": true,
                //    "MergeOperator": 1,
                //    "Operator": 1
                //});

                //dict.push({
                //    "Key": "Id",
                //    "Value": [6041,6043],
                //    "MergeOperator": 1,
                //    "Operator": 10
                //});

                //dict.push({
                //    "Key": "Name",
                //    "Value": ["Biz kimiz","Neler yapıyoruz"],
                //    "MergeOperator": 1,
                //    "Operator": 10
                //});

                if (d != undefined) {
                    d.SearchParameter = JSON.stringify(dict);
                }

                return d;
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

                    var link = '<a href="/Category/Add?CategoryId=' + row.Id + '" class="editor_edit">Alt Kategori Ekle</a> ';
                    link += '<a href="/Category/Add?id=' + row.Id + '" class="editor_edit">Düzenle</a> ';
                    if (row.CanBeDeleted) {
                        link += '<a href="javascript:void(0)" onclick="javascript:deleteRecord(' + row.Id + ')" class="editor_remove">Sil</a>'
                    }
                    return link;
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
        "order": [1, "asc"],
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
        url: "/Category/Add",
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
            url: "/Category/Delete",
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



var ReturnMainCategorySearch = function () {
    GetAllTopCategorySearchLink(0);
    $("#selectedSearCategory").html("");
    $("#SearchId").val(0)
}

var GetAllTopCategorySearchLink = function (Id) {
    $("#selectedCategory").html("");
    $("#SearchId").val(Id)

    $.ajax({
        url: "/Category/GetAllTopCategorySearchLink",
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
        url: "/Category/GetCategorySearchTree",
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

var dataTableUpdate = function () {
    var listData = $('#dataTable').DataTable().data().toArray();

    $.ajax({
        url: "/Category/ListUpdate",
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

var searchDataList = function () {
    //table.columns([0]).search($("#SearchId").val(), "EQUALS")
    //    .columns([1]).search($("#categoryName").val(), "EQUALS")
    //    .draw();

    table.draw();
}

$(document).ready(function () {


    //değer atama
    //CKEDITOR.instances['Description'].setData("Vereceğiniz değer");
    //atanan değeri çekme
    //CKEDITOR.instances['Description'].getData();

    loadRecord();

    GetAllTopCategorySearchLink(SearchCategoryIdRequest);

    $("#CategorySearch").change(function () {
        GetAllTopCategorySearchLink($(this).val());
    })

    $("#PageTypeId").change(function () {
        PageTypeSetting($(this).val());
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
                url: "/Category/Delete",
                type: "POST",
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: { "ids": ids },
                success: function (response) {
                    debugger;
                    table.ajax.reload(null, false)
                    showAlert(".listMessage", "Kayıt silme işlemi başarıyla tamamlandı.", "success");
                    $("#example-select-all").prop("checked", false);

                    ReturnMainCategorySearch(0);
                },
                error: function (response) {
                    showAlert(".listMessage", "Kayıt silme işlemi sırasında hata oluştu.", "error");

                }
            });
        }
    });

    PageTypeSetting($("#PageTypeId").val());


});