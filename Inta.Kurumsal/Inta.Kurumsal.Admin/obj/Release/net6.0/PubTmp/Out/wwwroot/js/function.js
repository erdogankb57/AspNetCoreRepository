var ProgressStart = function (elem, val, time) {
    var start = parseInt(elem.attr("start-num"));
    var stop = parseInt(val);
    var interval = setInterval(function () {
        if (start < stop && start <= 100) {
            start = start + 5;

            elem.progressbar({
                value: start
            });
            elem.attr("start-num", start);
        } else {
            clearInterval(interval);
        }

    }, time);
    
}

var ProgressClear = function (elem) {
    elem.attr("start-num",0)
    elem.progressbar({
        value: elem.attr("start-num", 0)
    });

}
