velicinaStranicanja = 0;
brojStranica = 0;
trenutnaStranica = 0;
zadnjaStranicaCijela = true;
tipSortiranja = "A";
podatak = null;

function generirajFiltere() {
    filter = '<label for="godina" class="labele">Godina proizvodnje: </label>';
    filter += '<input id="godina" onkeyup="dohvatiStatistiku();" name="godina" class="polja" type="number"><br>';
    filter += '<label for="kategor" class="labele">Kategorija: </label>';
    filter += '<input id="kategor" onkeyup="dohvatiStatistiku();" name="kategor" class="polja" type="text"><br>';
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
    dohvatiStatistiku();
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
    dohvatiStatistiku();
}

function dohvatiStatistiku() {
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'statistikaNovosti',
            godina: $("#godina").val(),
            kategor: $("#kategor").val(),
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
        tablica += '<th>Naziv piva <a href="#" onclick="postaviSortiranje(10);">S</a> <a href="#" onclick="postaviSortiranje(11);">U</a></th>';
        tablica += '<th>Broj novosti </th>';
        tablica += '<th>Novost </th>';
        tablica += '<th>Kategorija <a href="#" onclick="postaviSortiranje(11);">S</a> <a href="#" onclick="postaviSortiranje(10);">U</a></th>';
        tablica += '<th>Postotak alkohola </th>';
        tablica += '<th>Godina proizvodnje </th>';
        tablica += '</tr></thead><tbody>';
        var platno = document.getElementById("platno");
        var ctx = platno.getContext("2d");
        ctx.fillStyle = "rgb(0, 0, 0)";
        ctx.clearRect(0, 0, 600, 400);
        ctx.strokeRect(40, 0, 320, 400);
        for (i = velicinaStranicanja * trenutnaStranica; i < gornjaGranica; i++) {
            tablica += '<tr>';
            tablica += '<td>' + podatak[i].naziv + '</td>';
            tablica += '<td>' + podatak[i].broj + '</td>';
            tablica += '<td>' + podatak[i].novosti + '</td>';
            tablica += '<td>' + podatak[i].kategorija + '</td>';
            tablica += '<td>' + podatak[i].postotak_alkohola + '</td>';
            tablica += '<td>' + podatak[i].godina_proizvodnje + '</td>';
            tablica += '</tr>';
            var c = Math.round(Math.random() * 255);
            var z = Math.round(Math.random() * 255);
            var p = Math.round(Math.random() * 255);
            var boja = "rgb(" + c + "," + z + "," + p + ")";
            ctx.fillStyle = boja;
            ctx.fillRect(100 + 35 * (i - 1), 6 * (i * 10), 30, 800);
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
    dohvatiStatistiku();
});