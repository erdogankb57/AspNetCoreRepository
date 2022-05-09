var dataGridLanguage = {
    "sLoadingRecords": "Yükleniyor...",
    "sProcessing": "Yükleniyor...",
    "sSearch": "Ara:",
    "sInfo": "_START_ - _END_ arası toplam _TOTAL_ kayıt.",
    "sInfoEmpty": "",
    "sInfoFiltered": "Toplam _MAX_ kayıt listelendi.",
    "sLengthMenu": "Her sayfada _MENU_ kayıt listele",
    "sEmptyTable": "Gösterilecek kayıt bulunamadı.",
    "oPaginate": {
        "sFirst": "İlk",
        "sLast": "Son",
        "sNext": "İleri",
        "sPrevious": "Geri"

    }
}

var lengthMenu = [
    [10, 20, 40, 60, 80, 100],
    ['10 kayıt', '20 kayıt', '40 kayıt', '60 kayıt', '80 kayıt', '100 kayıt']
];

var scroolTop = function (num, time) {
    var body = $("html, body, .modal");
    body.stop().animate({ scrollTop: num }, time);
}

var showLoading = function () {
    // $("body").css("overflow","hidden");
    $(".loading-content").show();

}

var hideLoading = function () {
    // $("body").css("overflow","auto");
    $(".loading-content").hide();
}

var showAlert = function (elem, message, type) {
    if (type == "success") {
        var showMessage = "<div class='alert alert-success' role='alert'>" + message + "</div>";
        $('' + elem + '').html(showMessage);
        $('' + elem + '').find(".alert");
    } else {
        var showMessage = "<div class='alert alert-danger' role='alert'>" + message + "</div>";
        $('' + elem + '').html(showMessage);
        $('' + elem + '').find("alert");
    }
};



$(document).ready(function () {

    //showLoading();

   
    $(".nav-menu").perfectScrollbar();
    $('.notification-body').perfectScrollbar();

    //nav menu start
    $(".nav-menu ul .item").click(function (event) {
        event.stopPropagation();
        var active = $(this).hasClass("active");
        $(".nav-menu ul li").find("ul").hide();
        $(".nav-menu ul li a").removeClass("active");

        if (parseInt($(this).parent("li").has("ul").length) > 0) {
            if (active) {
                $(this).removeClass("active")
                $(this).parent("li").find("ul").stop().fadeOut(200);
            } else {
                $(this).addClass("active");
                $(this).parent("li").find("ul").stop().fadeIn(200);
            }
        }
        setTimeout(function () { $(".nav-menu").perfectScrollbar("update"); }, 200);

       

    })

    $('.nav-menu li a[item-id="' + activeMenuId + '"]').addClass("active");
    $('.nav-menu li a[item-id="' + activeMenuId + '"]').parent("li").find("ul").addClass("active");

    //nav menu end
    $(".show-mobile").click(function () {
        $(".main-left").fadeIn(200);
        $("#menuOpacity").fadeIn(200);
        $("body").css("overflow", "hidden");
    });

    $("#menuOpacity, .main-left .close-mobile").click(function () {
        $(".main-left").fadeOut(200);
        $("#menuOpacity").fadeOut(200);
        $("body").css("overflow", "auto");

    });

    /*Bootstrap tab active */
    var url = window.location.href;
    if (url.indexOf("#") > -1) {
        var activeTab = url.substring(url.indexOf("#") + 1);

        if (activeTab != undefined && activeTab != "") {
            $(".tab-pane").removeClass("active");
            $("#" + activeTab).addClass("active");
            $('a[href="#' + activeTab + '"]').tab('show');
            $('a[href="#' + activeTab + '"]').focus();
        }
    }
    /*Bootstrap tab active end*/


    hideLoading();
    //showAlert("Mesajınız","Kayıt işlemi başarıyla tamamlandı.");

    $("img").each(function () {
        imgsrc = this.src;
        // console.log(imgsrc);
        if (this.src == undefined || this.src == null) {
            this.css("display", "none");
        }
    });

    $('.nav-menu').perfectScrollbar("update");

    $("#dropDownLanguage select").change(function () {
        $.ajax({
            url: "/Language/SetLanguage",
            type: "POST",
            dataType: 'json',
            data: { "id": $(this).val() },
            success: function (response) {
                if (response == "OK") {
                    location.reload();
                }
            },
            error: function (response) {
            }
        });
    })
})

$(function () {
    $('.treeview ul li input[type="checkbox"]').change(function () {
        console.log($(this).is(":checked"))
        if ($(this).is(":checked")) {
            $(this).parent("li").find("ul:first").show();
            $(this).parent("li").find("ul:first").find("input").prop("checked", true);

        } else {
            $(this).parent("li").find("ul:first").hide();
            $(this).parent("li").find("ul:first").find("input").prop("checked", false);

        }
    });
})

