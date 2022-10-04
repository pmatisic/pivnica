velicinaStranicanja = 0;
brojStranica = 0;
trenutnaStranica = 0;
zadnjaStranicaCijela = true;
tipSortiranja = "A";
podatak = null;

function generirajFiltere() {
    filter = '<label for="idz" class="labele">ID zemlje: </label>';
    filter += '<input id="idz" onkeyup="generirajSadrzaj();" name="idz" class="polja" type="number"><br>';
    filter += '<label for="ime" class="labele">Naziv zemlje: </label>';
    filter += '<input id="ime" onkeyup="generirajSadrzaj();" name="ime" class="polja" type="text"><br>';
    $("#filteri").html(filter);
}

function dohvatiVelicinuStranicanja() {
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiVelicinuStranicanja',
        },
        dataType: "json",
        async: false,
        success: function (data) {
            if (data != "nema zapisa" && data != "neuspjesno") {
                velicinaStranicanja = data[0].stranicanje;
            }
        }
    });
}

function postaviSortiranje(tip) {
    if (tip == 10) tipSortiranja = "IS";
    if (tip == 00) tipSortiranja = "KS";
    if (tip == 11) tipSortiranja = "IU";
    if (tip == 01) tipSortiranja = "KU";
    trenutnaStranica = 0;
    generirajSadrzaj();
}

function promijeniStranicu(broj) {
    if (broj == 0 && zadnjaStranicaCijela == true)
        trenutnaStranica = brojStranica;
    if (broj == 0 && zadnjaStranicaCijela == false)
        trenutnaStranica = brojStranica - 1;
    if (broj == 1)
        trenutnaStranica = 0;
    if (broj == 2 && trenutnaStranica >= 1)
        trenutnaStranica -= 1;
    if (broj == 3 && trenutnaStranica <= brojStranica - 2)
        trenutnaStranica += 1;
    console.log(trenutnaStranica);
    generirajSadrzaj();
}

function dohvatiZemljuPorijekla(){
    zemlje = '<option value="-1">&nbsp;</option>';
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiZemlju1',
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
				for(i=0; i<data.length; i++){
                    zemlje += '<option value="' + data[i].idzemlja_porijekla + '">' + data[i].naziv + '</option>';
                }
            }
        }
    });
    $("#zemlja").html(zemlje);
}

function generirajSadrzaj() {
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiZemlju',
            idz: $("#idz").val(),
            ime: $("#ime").val(),
            sortiranje: tipSortiranja,
        },
        dataType: "json",
        async: false,
        success: function (data) {
            console.log(data);
            if (data != "nema zapisa" && data != "neuspjesno") {
                podatak = data;
                if ((podatak.length / velicinaStranicanja) % 1 != 1) {
                    brojStranica = parseInt(podatak.length / velicinaStranicanja + 1);
                    zadnjaStranicaCijela = false;
                }
                if ((podatak.length / velicinaStranicanja) % 1 == 0) {
                    brojStranica = podatak.length / velicinaStranicanja;
                }
            }
            if (data == "nema zapisa") {
                podatak = [];
            }
        }
    });
    gornjaGranica = 0;
    trenutniZapis = parseInt(parseInt(velicinaStranicanja * trenutnaStranica) + parseInt(velicinaStranicanja));
    if (trenutniZapis <= podatak.length) {
        gornjaGranica = trenutniZapis;
    }
    else {
        gornjaGranica = podatak.length;
    }
    setTimeout(function () {
        tablica = '<table border="2" style="margin-left:auto; margin-right:auto;"><thead><tr>';
        tablica += '<caption>Prikazano ' + gornjaGranica + ' od ' + podatak.length + ' zapisa.</caption>';
        tablica += '<th>ID zemlje <a href="#" onclick="postaviSortiranje(00);">S</a> <a href="#" onclick="postaviSortiranje(01);">U</a></th>';
        tablica += '<th>Naziv <a href="#" onclick="postaviSortiranje(10);">S</a> <a href="#" onclick="postaviSortiranje(11);">U</a></th>';
        tablica += '</tr></thead><tbody>';
        var platno = document.getElementById("platno");
        var ctx = platno.getContext("2d");
        ctx.fillStyle = "rgb(0, 0, 0)";
        ctx.clearRect(0, 0, 600, 400);
        ctx.strokeRect(40, 0, 320, 400);
        for (i = velicinaStranicanja * trenutnaStranica; i < gornjaGranica; i++) {
            tablica += '<tr>';
            tablica += '<td>' + podatak[i].idzemlja_porijekla + '</td>';
            tablica += '<td>' + podatak[i].naziv + '</td>';
            tablica += '</tr>';
            var c = Math.round(Math.random() * 255);
            var z = Math.round(Math.random() * 255);
            var p = Math.round(Math.random() * 255);
            var boja = "rgb(" + c + "," + z + "," + p + ")";
            ctx.fillStyle = boja;
            ctx.fillRect(100 + 35 * (i - 1), 6 * (podatak[i].idzemlja_porijekla * 10), 30, 800);
        }
        tablica += '</tbody></table>';
        tablica += '<a href="#" onclick="promijeniStranicu(1);"> Prva </a>';
        tablica += '<a href="#" onclick="promijeniStranicu(2);"> Prethodna </a>';
        tablica += '<a href="#" onclick="promijeniStranicu(3);"> Sljedeća </a>';
        tablica += '<a href="#" onclick="promijeniStranicu(0);"> Zadnja </a>';
        $("#tablica").empty();
        $("#tablica").html(tablica);
    }, 50);
}

$(document).ready(function () {
    generirajFiltere();
    dohvatiVelicinuStranicanja();
    generirajSadrzaj();
    dohvatiZemljuPorijekla();
});