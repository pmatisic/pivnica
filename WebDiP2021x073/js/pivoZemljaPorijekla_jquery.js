function dohvatiPivo(){
    pive = '<option value="-1">&nbsp;</option>';
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'dohvatiPivo1',
        },
        dataType: "json",
        async: false,
        success: function(data) {
            if(data!="nema zapisa" && data!="neuspjesno"){
                console.log(data);
				for(i=0; i<data.length; i++){
                    pive += '<option value="' + data[i].id_pivo + '">' + data[i].naziv + '</option>';
                }
            }
        }
    });
    $("#pivo").html(pive);
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

$(document).ready(function(){
    dohvatiPivo();
    dohvatiZemljuPorijekla();
});