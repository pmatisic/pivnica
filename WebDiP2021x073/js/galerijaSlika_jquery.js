tipSortiranja = "A";

function generirajFiltere() {
    filter = '<label for="ocj" class="labele">Ocjena: </label>';
    filter += '<input id="ocj" onkeyup="dohvatiSlike();" name="ocj" class="polja" type="number"><br>';
    $("#filteri").html(filter);
}

function postaviSortiranje(tip) {
    if (tip == 10) tipSortiranja = "IS";
    if (tip == 00) tipSortiranja = "KS";
    if (tip == 11) tipSortiranja = "IU";
    if (tip == 01) tipSortiranja = "KU";
    trenutnaStranica = 0;
    dohvatiSlike();
}

function dohvatiSlike(){
    setTimeout(function(){
        tablica = '<table border="2" style="margin-left:auto; margin-right:auto;"><thead><tr>';
        tablica += '<th>Zemlja porijekla <a href="#" onclick="postaviSortiranje(00);">S</a> <a href="#" onclick="postaviSortiranje(01);">U</a></th>';
        tablica += '<th>Cijena <a href="#" onclick="postaviSortiranje(10);">S</a> <a href="#" onclick="postaviSortiranje(11);">U</a></th>';
        tablica += '<th>Slika piva </th>';
        tablica += '</tr></thead><tbody>';
        $.ajax({
            type: "POST",
            url: "skripte/ajaxOkvir.php",
            data: {
                opcija: 'dohvatiSlike',
                ocj: $("#ocj").val(),
                sortiranje: tipSortiranja,
            },
            dataType: "json",
            async: false,
            success: function(data) {
                console.log(data);
                if(data!="nema zapisa" && data!="neuspjesno"){
                    for(i=0; i<data.length; i++){
                        tablica += '<tr>';
                        tablica += '<td>' + data[i].naz + '</td>';
                        tablica += '<td>' + data[i].cijena + '</td>';
                        tablica += '<td><img src="img/slikeGalerija/' + data[i].slika + '" alt="' + data[i].slika + '" height="300px" width="300px"/></td>';
                        tablica += '</tr>';
                    }
                }
            }
        });
        tablica += '</tbody></table>';
        $("section").html(tablica);
    },50);

}

$(document).ready(function () {
    generirajFiltere();
    dohvatiSlike();
});