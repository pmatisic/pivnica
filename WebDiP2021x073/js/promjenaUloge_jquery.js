function promijeniUlogu() {
    console.log("poslano");
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'promijeniUlogu',
            tip: $("#uloga").val(),
        },
        dataType: "json",
        async: false,
        success: function (data) {

        }
    });
    location.reload();
}

$(document).ready(function () {
    $("#uloga").change(promijeniUlogu);
});