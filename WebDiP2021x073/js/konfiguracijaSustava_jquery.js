function dohvatiPodatke() {
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiKonfiguraciju',
        },
        dataType: "json",
        async: false,
        success: function (data) {
            if (data != "nema zapisa" && data != "neuspjesno") {
                $("#pomak").val(data[0].pomak);
                $("#stranicanje").val(data[0].stranicanje);
                $("#sesija").val(data[0].trajanje_sesija);
                $("#kolacic").val(data[0].trajanje_kolacic);
                $("#aktKod").val(data[0].trajanje_aktivacijski_kod);
                $("#brojPokusaja").val(data[0].broj_pokusaja);
                $("#topLista").val(data[0].top_lista);
            }
        }
    });
}

$(document).ready(function () {
    dohvatiPodatke();
});