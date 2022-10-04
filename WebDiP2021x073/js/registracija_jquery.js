poruka = "";
provjeraObavezno = true;
provjeraKorime = true;
provjeraLozinke = true;
provjeraEmail = true;
provjeraZnakoviIme = true;
provjeraZnakoviPrezime = true;
provjeraSpol = true;

function validacijaRegistracije(dogadjaj) {
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'provjeriKorime',
            korime: $('#korime').val(),
        },
        dataType: "json",
        async: false,
        success: function (data) {
            if (data["postoji"] == "1") {
                poruka += "Postoji korisnik s navedenim korisničkim imenom!\n";
                provjeraKorime = false;
            }
        }
    });
    $.ajax({
        type: "POST",
        url: "skripte/ajaxOkvir.php",
        data: {
            opcija: 'provjeriEmail',
            email: $('#email').val(),
        },
        dataType: "json",
        async: false,
        success: function (data) {
            if (data["postoji"] == "1") {
                poruka += "Postoji korisnik s navedenim email-om!\n";
                provjeraEmail = false;
            }
        }
    });
    ime = $("#ime").val();
    prezime = $("#prezime").val();
    korime = $("#korime").val();
    email = $("#email").val();
    lozinka = $("#lozinka").val();
    ponovljenaLozinka = $("#ponovljenaLozinka").val();
    spol = $("#spol").val();

    if (ime == "" || prezime == "" || korime == "" || lozinka == "" || ponovljenaLozinka == "" || spol == -1) {
        poruka += "Sva polja osim adrese su obavezna!\n";
        provjeraObavezno = false;
    }

    for (i = 0; i < ime.length; i++) {
        if ((ime[i] >= 'a' && ime[i] <= 'z') || (ime[i] >= 'A' && ime[i] <= 'Z')
            || ime[i] == 'č' || ime[i] == 'ć' || ime[i] == 'š' || ime[i] == 'ž' || ime[i] == 'đ'
            || ime[i] == 'Č' || ime[i] == 'Ć' || ime[i] == 'Š' || ime[i] == 'Ž' || ime[i] == 'Đ')
            continue;
        else {
            poruka += "Ime mora sadržavati samo mala i velika slova!\n";
            provjeraZnakoviIme = false;
            break;
        }
    }

    for (i = 0; i < prezime.length; i++) {
        if ((prezime[i] >= 'a' && prezime[i] <= 'z') || (prezime[i] >= 'A' && prezime[i] <= 'Z')
            || prezime[i] == 'č' || prezime[i] == 'ć' || prezime[i] == 'š' || prezime[i] == 'ž' || prezime[i] == 'đ'
            || prezime[i] == 'Č' || prezime[i] == 'Ć' || prezime[i] == 'Š' || prezime[i] == 'Ž' || prezime[i] == 'Đ')
            continue;
        else {
            poruka += "Prezime mora sadržavati samo mala i velika slova!\n";
            provjeraZnakoviPrezime = false;
            break;
        }
    }

    if (lozinka !== ponovljenaLozinka) {
        poruka += "Lozinke se ne podudaraju!\n";
        provjeraLozinke = false;
    }

    reg = /^\w{1,}.?\w{1,}@(\w{1,}\.)\w{2,}$/g;
    re = new RegExp(reg, "");
    ok = re.test(email);
    if (email.length < 10 || email.length > 30) {
        poruka += "Duljina emaila mora biti između 10 i 30 znakova!\n";
        provjeraEmail = false;
    }
    if (!ok) {
        poruka += "Email nije ispravnog formata!\n";
        provjeraEmail = false;
    }

    if (provjeraKorime == false || provjeraLozinke == false || provjeraEmail == false || provjeraObavezno == false
        || provjeraZnakoviIme == false || provjeraZnakoviPrezime == false || provjeraSpol == false) {
        dogadjaj.preventDefault();
        alert(poruka);
    }
    poruka = "";
    provjeraObavezno = true;
    provjeraKorime = true;
    provjeraLozinke = true;
    provjeraEmail = true;
    provjeraZnakoviIme = true;
    provjeraZnakoviPrezime = true;
    provjeraSpol = true;
}

$(document).ready(function () {
    $("#potvrdiRegistraciju").click(function (event) {
        validacijaRegistracije(event);
    });
});