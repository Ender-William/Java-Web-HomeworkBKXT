window.onload = function () {
    var title = document.title;
    var menu = document.getElementById('menu');
    var items = menu.getElementsByTagName('a');
    for (var i = 0; i < items.length; i++) {
        if (title == items[i].innerHTML) {
            items[i].className = "checked";
        }
    }
};