velicinaStranicanja = 0;
brojStranica = 0;
trenutnaStranica = 0;
zadnjaStranicaCijela = true;
tipSortiranja = "A";
podatak = null;

function generirajFiltere(){
    filter = '<label for="korime" class="labele">Korisničko ime: </label>';
    filter += '<input id="korime" onkeyup="dohvatiDnevnikRada();" name="korime" class="polja" type="text"><br>';
    filter += '<label for="tipZapisa" class="labele">Tip zapisa: </label>';
    filter += '<input id="tipZapisa" onkeyup="dohvatiDnevnikRada();" name="tipZapisa" class="polja" type="text"><br>';
    filter += '<label for="datumAktiviranja" class="labele">Datum aktiviranja: </label>';
    filter += '<input id="datumAktiviranja" onchange="dohvatiDnevnikRada();" name="datumAktiviranja" class="polja" type="datetime-local"><br>';
    filter += '<label for="datumZavrsetka" class="labele">Datum zavrsetka: </label>';
    filter += '<input id="datumZavrsetka" onchange="dohvatiDnevnikRada();" name="datumZavrsetka" class="polja" type="datetime-local"><br>';
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
    if(tip==1)tipSortiranja="U";
    if(tip==0)tipSortiranja="S";
    trenutnaStranica = 0;
    dohvatiDnevnikRada();
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
    dohvatiDnevnikRada();
}

function dohvatiDnevnikRada(){
    dAkt = "";
    dZav = "";
    if($("#datumAktiviranja").val()!=""){
        dAkt = $("#datumAktiviranja").val();
        dAkt = dAkt.substring(0, 10) + " " + dAkt.substring(11, 19);
    }
    if($("#datumZavrsetka").val()!=""){
        dZav = $("#datumZavrsetka").val();
        dZav = dZav.substring(0, 10) + " " + dZav.substring(11, 19);
    }
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiDnevnikRada',
            korime: $("#korime").val(),
            tipZapisa: $("#tipZapisa").val(),
            datumOd: dAkt,
            datumDo: dZav,
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
    tablica += '<th>Ime</th><th>Prezime</th><th>Korisničko ime</th><th>Tip zapisa</th><th>Zapis</th>';
    tablica += '<th>Datum <a href="#" onclick="postaviSortiranje(0);">S</a> <a href="#" onclick="postaviSortiranje(1);">U</a></th>';
    tablica += '<th>Preglednik</th><th>Adresa</th>';
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
        tablica += '<td>' + podatak[i].naziv + '</td>';
        tablica += '<td>' + podatak[i].zapis + '</td>';
        tablica += '<td>' + podatak[i].datum + '</td>';
        tablica += '<td>' + podatak[i].preglednik + '</td>';
        tablica += '<td>' + podatak[i].adresa + '</td>';
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

$(document).ready(function(){
    generirajFiltere();
    dohvatiVelicinuStranicanja();
    dohvatiDnevnikRada();
});