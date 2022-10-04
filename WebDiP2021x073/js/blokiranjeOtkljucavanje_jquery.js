velicinaStranicanja = 0;
brojStranica = 0;
trenutnaStranica = 0;
zadnjaStranicaCijela = true;
tipSortiranja = "A";
podatak = null;

function generirajFiltere() {
    filter = '<label for="korime" class="labele">Ime korisnika: </label>';
    filter += '<input id="korime" onkeyup="dohvatiPopisKorisnika();" name="korime" class="polja" type="text"><br>';
    filter += '<label for="korprezime" class="labele">Prezime korisnika: </label>';
    filter += '<input id="korprezime" onkeyup="dohvatiPopisKorisnika();" name="korprezime" class="polja" type="text"><br>';
    $("#filteri").html(filter);
}

function dohvatiVelicinuStranicanja(){
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiVelicinuStranicanja',
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
                velicinaStranicanja = data[0].stranicanje;
            }
        }
    });
}

function postaviSortiranje(tip){
    if(tip==01)tipSortiranja="PU";
    if(tip==00)tipSortiranja="PS";
    if(tip==11)tipSortiranja="ZU";
    if(tip==10)tipSortiranja="ZS";
    if(tip==21)tipSortiranja="SU";
    if(tip==20)tipSortiranja="SS";
    trenutnaStranica = 0;
    dohvatiPopisKorisnika();
}

function promijeniStranicu(broj){
    if(broj==0 && zadnjaStranicaCijela==true)
        trenutnaStranica = brojStranica;
    if(broj==0 && zadnjaStranicaCijela==false)
        trenutnaStranica = brojStranica-1;
    if(broj==1)
        trenutnaStranica = 0;
    if(broj==2 && trenutnaStranica>=1)
        trenutnaStranica -= 1;
    if(broj==3 && trenutnaStranica<=brojStranica-2)
        trenutnaStranica += 1;
    console.log(trenutnaStranica);
    dohvatiPopisKorisnika();
}

function dohvatiPopisKorisnika(){
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'blokiranjeOtkljucavanjeKorisnika',
            korime: $("#korime").val(),
            korprezime: $("#korprezime").val(),
            sortiranje: tipSortiranja,
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
                podatak = data;
                if((podatak.length/velicinaStranicanja)%1!=1){
                    brojStranica = parseInt(podatak.length/velicinaStranicanja+1);
                    zadnjaStranicaCijela = false;
                }
                if((podatak.length/velicinaStranicanja)%1==0){
                    brojStranica = podatak.length/velicinaStranicanja;
                }
            }
            if(data=="nema zapisa"){
                podatak = [];
            }
        }
    });
    gornjaGranica = 0;
    trenutniZapis = parseInt(parseInt(velicinaStranicanja*trenutnaStranica)+parseInt(velicinaStranicanja));
    if(trenutniZapis<=podatak.length){
        gornjaGranica = trenutniZapis;
    }
    else{
        gornjaGranica = podatak.length;
    }
    tablica = '<table border="2" style="margin-left:auto; margin-right:auto;"><thead><tr>';
    tablica += '<caption>Prikazano ' + gornjaGranica + ' od ' + podatak.length + ' zapisa.</caption>';
    tablica += '<th>Ime</th><th>Prezime</th><th>Korisničko ime</th>';
    tablica += '<th>Email</th>';
    tablica += '<th>Datum pristupa <a href="#" onclick="postaviSortiranje(00);">S</a> <a href="#" onclick="postaviSortiranje(01);">U</a></th>';
    tablica += '<th>Datum zabrane <a href="#" onclick="postaviSortiranje(10);">S</a> <a href="#" onclick="postaviSortiranje(11);">U</a></th>';
    tablica += '<th>Status <a href="#" onclick="postaviSortiranje(20);">S</a> <a href="#" onclick="postaviSortiranje(21);">U</a></th>';
    tablica += '<th>Akcija</th>';
    tablica += '</tr></thead><tbody>';
    var platno = document.getElementById("platno");
    var ctx = platno.getContext("2d");
    ctx.fillStyle = "rgb(0, 0, 0)";
    ctx.clearRect(0, 0, 600, 400);
    ctx.strokeRect(40, 0, 320, 400);
    for(i=velicinaStranicanja*trenutnaStranica; i<gornjaGranica; i++){
        tablica += '<tr>';
        tablica += '<td>' + podatak[i].ime + '</td>';
        tablica += '<td>' + podatak[i].prezime + '</td>';
        tablica += '<td>' + podatak[i].korisnicko_ime + '</td>';
        tablica += '<td>' + podatak[i].email + '</td>';
        tablica += '<td>' + podatak[i].datum_pristupa + '</td>';
        tablica += '<td>' + podatak[i].datum_zabrane + '</td>';
        tablica += '<td>' + podatak[i].status + '</td>';
        if(podatak[i].status=='A' && podatak[i].korisnicko_ime!='pmatisic')
            tablica += '<td><a href="#" onclick="blokirajKorisnika(' + podatak[i].id_korisnik + ')">Blokiraj</a></td>';
        if(podatak[i].status=='B' && podatak[i].korisnicko_ime!='pmatisic')
            tablica += '<td><a href="#" onclick="otkljucajKorisnika(' + podatak[i].id_korisnik + ')">Otključaj</a></td>';
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
}

function blokirajKorisnika(id){
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'blokirajKorisnika',
            korisnik: id,
        },
        dataType: "json",
        async: false,
        success: function(data) {
            
        }
    });
    dohvatiPopisKorisnika();
}

function otkljucajKorisnika(id){
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'otkljucajKorisnika',
            korisnik: id,
        },
        dataType: "json",
        async: false,
        success: function(data) {
            
        }
    });
    dohvatiPopisKorisnika();
}

$(document).ready(function(){
    generirajFiltere();
    dohvatiVelicinuStranicanja();
    dohvatiPopisKorisnika();
});