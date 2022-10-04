function dohvatiPivnice(){
    pivnice = '<option value="-1">&nbsp;</option>';
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiPivnice1',
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
                console.log(data);
				for(i=0; i<data.length; i++){
                    pivnice += '<option value="' + data[i].id_pivnica + '">' + data[i].naziv + '</option>';
                }
            }
        }
    });
    $("#pivnica").html(pivnice);
}

function dohvatiKorisnike(){
    korisnici = '<option value="-1">&nbsp;</option>';
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiKorisnike',
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
				for(i=0; i<data.length; i++){
                    korisnici += '<option value="' + data[i].id_korisnik + '">' + data[i].ime + " " 
                              + data[i].prezime + " " + data[i].korisnicko_ime + '</option>';
                }
            }
        }
    });
    $("#moderator").html(korisnici);
}

$(document).ready(function(){
    dohvatiPivnice();
    dohvatiKorisnike();
});