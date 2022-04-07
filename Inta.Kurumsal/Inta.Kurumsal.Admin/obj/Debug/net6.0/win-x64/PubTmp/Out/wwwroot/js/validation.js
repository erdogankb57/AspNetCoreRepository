$(document).ready(function () {
    console.log($("input"));
    $('body').on('blur', 'input, select, tectarea', function () {
        if ($(this).attr("required") == "required" && $(this).val() == "") {
            if ($(this).hasClass("noneValidate")) {
                $(this).css("border", "solid 1px #b24242");
            }
        } else if ($(this).attr("numeric") == "numeric" && $.isNumeric($(this).val()) == false) {
            if ($(this).hasClass("noneValidate")) {
                $(this).css("border", "solid 1px #b24242");
            }
        } else {
            if ($(this).hasClass("noneValidate")) {
                $(this).css("border", "solid 1px #44b242");
                $(this).removeClass("noneValidate");
            }

        }
    });
});

jQuery.fn.extend({
    FormValidate: function () {
        var validateStatus = true;
        this.each(function () {
            $(this).find("input, textarea").each(function (item) {
                var elem = $(this);

                if (elem.attr("required") == "required" && elem.val() == "") {
                    $(elem).css("border", "solid 1px #b24242"); $(this).focus();
                    validateStatus = false;
                    $(this).addClass("noneValidate");
                } else if (elem.attr("numeric") == "numeric" && $.isNumeric(elem.val()) == false) {
                    elem.css("border", "solid 1px #b24242"); $(this).focus();
                    $(this).addClass("noneValidate");
                    validateStatus = false;

                } else {
                    elem.css("border", "");
                    $(this).removeClass("noneValidate");

                }
                $(".noneValidate:first").focus();
            });

            $(this).find("select").each(function (item) {
                var elem = $(this);
                if ($(this).find("option[value!='']").length > 0) {
                    if (elem.attr("required") == "required" && elem.val() == "") {
                        $(elem).css("border", "solid 1px #b24242"); $(this).focus();
                        validateStatus = false;
                        $(this).addClass("noneValidate");
                    } else if (elem.attr("numeric") == "numeric" && $.isNumeric(elem.val()) == false) {
                        elem.css("border", "solid 1px #b24242"); $(this).focus();
                        $(this).addClass("noneValidate");
                        validateStatus = false;

                    } else {
                        elem.css("border", "");
                        $(this).removeClass("noneValidate");

                    }
                    $(".noneValidate:first").focus();
                }
            });
        });

        return validateStatus;
    }
});
