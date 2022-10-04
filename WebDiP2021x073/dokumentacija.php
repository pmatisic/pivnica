<?php

require("skripte/aplikacijskiOkvir.php");

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Dokumentacija</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <meta name="opis" content="Dokumentacija">
    <meta name="datum kreiranja" content="18.03.2022.">
    <meta name="autor" content="Petar Matišić">
</head>

<body>
    <header>
        <h1 class="naslov-zaglavlje">Pivnica</h1>
        <div> <a href="index.php">
                <img src="img/logo2.png" alt="Početna" class="ribbon" />
            </a></div>
        <p class="datum-vrijeme">Datum i vrijeme:<br>
            <?php
            echo VrijemePomak(DatumVrijemeBaza);
            ?>
        </p><br>
        <a href="prijava.php" class="prijava-zaglavlje">Prijava</a><br>
        <div class="hamburger-menu">
            <input id="menu__toggle" type="checkbox" />
            <label class="menu__btn" for="menu__toggle">
                <span></span>
            </label>
            <nav class="menu__box">
                <?php
                generirajNavigacijuGost();
                ?>
            </nav>
        </div>
    </header>
    <section style="text-align: left;">
        <h1>Opis projektnog zadatka</h1>
        <p>
            Projektni zadatak je Pivnica. Zadatak je strukturno bio orijentiran da se korisniku omogući narudžba piva unutar neke pivnice. Cilj je bio kreirati četiri različite uloge korisnika u sustavu: registrirani i neregistrirani korisnik, moderator i administrator, te njima pripadajuće funkcionalnosti. Neregistrirani korisnik ima mogućnost pregleda broja naručenih piva po pivnici u vremenskom razdoblju (od-do), može vidjeti galeriju slika piva u odabranoj pivnici uz mogućnost sortiranja po zemlji podrijekla ili cijeni i može filtrirati po ocjeni. Registrirani korisnik ima mogućnost pregledavanja statistike broja novosti grupirano po nazivu piva. Moderator ima mogućnost kreiranja/pregledavanja/ažuriranja pive (Ožujsko, Franziskaner, Budweiser, ...) i pridruživanja zemlji porijekla. Za svaku pivu unosi naziv, cijenu, opis, volumen, rok trajanja i postavlja sliku piva. Administrator kreira/pregledava/ažurira pivnice (Medvedgrad, Medina škrinja, ...) i dodjeljuje moderatore pivnici te kreira/pregledava/ažurira zemlje podrijetla (Hrvatska, Njemačka, Češka, ...). Uz to administrator ima mogućnost konfiguracije sustava (broj redaka straničanja, trajanje sesije i kolačića, pomak vremena, trajanje aktivacijskog koda, broj dozvoljenih pokušaja kod prijave i broj korisnika za prikaz liste najčešće pristupanih), pojedinačno rješenje (CRUD) za svaku tablicu u sustavu, te može blokirati i otključavati korisničke račune.
        </p>
        <h1>Opis projektnog rješenja</h1>
        <p>
            Projektno rješenje smatram da je dobro implementirano. Glavni dijelovi opisa zadataka su implementirani osim dijela sa moderatorom (2 i 4 točka) te reg. korisnikom (sve osim 4 točke). Projektno rješenje je strukturirano tako da su sve stranice u .php skriptama, sve dohvaćanja podataka iz baze su ostvarena putem AJAX-a, tako da ukoliko se na nekoj PHP stranici dohvaćaju podaci putem AJAX-a ona ima svoju zasebnu Javascript datoteku u js folderu. Bitno je naglasiti da se podatci u tablicama ažuriraju dinamički bez osvježavanja stranice kao i dijagrami. Svi AJAX zahtjevi se šalju na ajaxOkvir.php skriptu koja prima te zahtjeve i vraća odgovarajuće JSON fileove. Kako administrator ima sve mogućnosti registriranog, neregistriranog korisnika i moderatora, da mu ne bi generirao navigaciju od neki veći broj poveznica, napravio sam mogućnost da može mijenjati navigaciju ovisno o ulozi koju odabere, isto tako može i moderator. Sve skripte koje se koriste u cijelom projektu nalaze se u folderu "skripte" te će one nešto kasnije biti opisane. Slike piva se spremaju u folder img/slikeGalerija, dok se u bazu podataka spremaju samo nazivi tih slika. Kako ne bi došlo do nekakvih nesuglasica u nazivima slika, u rješenju sam stavio ograničenje da se ne može uploadati slika na server ukoliko već postoji slika s istim nazivom. Još je važno naglasiti da administrator ima mogućnost CRUD-a (pregled, kreiranje, ažuriranje, brisanje) nad svih 13 tablica u bazi podataka. Sva kreiranja i ažuriranja u bazu su realizirana unutar samih php stranica, dok je pregled i brisanje ostvareno putem slanja AJAX zahtjeva na ajaxOkvir.php skriptu. Prilikom otvaranja bilo koje stranice provjerava se ima li korisnik pristup toj stranici, ukoliko nema usmjerava ga se na početnu stranicu. Istek sesije je realiziran na sljedeći način: svaki put kada korisnik osvježi stranicu u klasi korisnik uspoređuje se trenutno vrijeme kada je korisnik osvježio stranicu sa zadnjim vremenom osvježavanja, ako je ta razlika veća od trajanja sesije korisnika se odjavljuje, a u suprotnom atribut "zadnjeOsvjezavanje" u klasi "korisnik" se postavlja na trenutno vrijeme.
        </p>
        <h1>ERA model</h1>
        <p>
            <a href="img/eraModel.png" target="_blank"><img src="img/eraModel.png" alt="ERA model" height="713" width="1013"></a>
            <br>
            ERA model se sastoji od 13 tablica, od toga je jedna tablica slabi entitet (veza M:N). Središnja tablica ERA modela je korisnik s pripadajućim atributima, od kojih je važno izdvojiti status koji označava je li korisnik aktivan ili blokiran. Tip_korisnika označava vrstu korisnika (administrator, moderator, registrirani, anonimni). U dnevnik se bilježi sve što je tko kada radio a tip_zapisa označava je li to posjeta, upit, prijava, odjava i dr. U tablicu moderator se spremaju moderatori određenih pivnica, dok se u pivnicu bilježe narudžbe dostupne korisnicima za određene pive. Jako bitna tablica je i pivo koja ima vezu i sa recenzijom i sa zemljama porijekla te samom narudžbom. U tablici narudžba se spremaju sve plaćene ili neplaćene korisničke narudžbe.
        </p>
        <h1>Navigacijski dijagram</h1>
        <p>
            <a href="img/navigacijskiDijagram.png" target="_blank"><img src="img/navigacijskiDijagram.png" alt="Navigacijski dijagram" height="713" width="1013"></a>
            <br>
        </p>
        <p>
        <h1>Popis i opis skripata</h1>
        <h3>PHP skripte</h3>
        1. ajaxOkvir.php - skripta na koju se šalju AJAX zahtjevi, prima podatak opcija koji označava što je potrebno izvršiti, te
        vraća odgovarajući JSON file<br>
        2. aplikacijskiOkvir.php - skripta koja uključuje se ostale pomoćne skripte osim ajaxOkvir.php skripte te se ona poziva kod svake
        PHP stranice.<br>
        3. baza.class.php - skripta s nastave koja sadrži klasu za spajanje na MySQL bazu podataka<br>
        4. bazaSkraceno.php - skripta koja sadrži dvije funkcije: SelectUpit i IUDUpit. Ovu skriptu sam napravio kako ne bi svugdje u kodu
        trebao instancirati klasu baza i onda izvršavati upit, nego ovako samo proslijedim ovim dvjema funkcijama upit i unutar njih se
        instancira klasa baza.<br>
        5. generiranjeElemenata.php - skripta koja sadrži funkcije za generiranje elemenata navigacije, generiranje mjesta odjave ukoliko je
        korisnik prijavljen u sustav, odnosno mjesta prijave ako nije prijavljen te elementa za promjenu navigacije.<br>
        6. konstante.php - skripta koja sadrži konstante za ID-ove tipa korisnika iz baze, ID-ove tipa zapisa kod dnevnika te konstante za
        tip pomaka vremena.<br>
        7. korisnik.class.php - klasa koja sadrži podatke o prijavljenom korisniku te se ta klasa sprema u sesiju. Važno je izdvojiti atribut
        zadnjeOsvjezavanje koje označava kada je korisnik zadnji put osvježio stranicu kako bi se moglo odrediti je li korisnička sesija istekla,
        te metode za dohvaćanje "korijenske" uloge korisnika (uloga u bazi) i "trenutne" uloge korisnika (koja mu se navigacija prikazuje).<br>
        8. pomocneFunkcije.php - skripta sadrži funkciju: VrijemePomak koja vraća virtualno vrijeme ovisno o pomaku, te se može zadati koji
        format se želi dohvatiti (sekunde, format kao u bazi, normalni format...)<br>
        9. radSaDnevnikom.php - skripta koja omogućuje unos podataka u bazu i aktivnosti korisnika ovisno o tipu zapisa (prijava, odjava,
        posjeta, upit, zaključavanje, slanje lozinke).<br>
        10. radSaSesijom.php - skripta koja sadrži sve funkcije za rad sa sesijom: dohvaćanje trajanja sesije iz baze, dohvaćanje podataka iz sesije,
        dohvaćanje ID-a korisnika koji je prijavljen, provjera ima li prijavljeni korisnik pravo pristupa određenoj stranici, provjera je li
        korisniku istekla sesija.<br><br>
        <h3>JS skripte</h3>
        11. blokiranjeOtkljucavanje_jquery.js - skripta koja putem AJAX zahtjeva dohvaća popis svih korisnika te ih u obliku tablice prikazuje,
        te u zadnjem stupcu tablica pored svakog korisnika stoji otključaj (ako je korisnik blokiran) te zaključaj (ako je korisnik aktivan).
        Klikom na neki od tih linkova se opet AJAX zahtjevom šalje id korisnika i ažurira se status korisnika u bazi.<br>
        12. dnevnikRada_jquery.js - dinamički se kreiraju filteri te prikaz sadržaja tablice dnevnik iz baze.<br>
        13. konfiguracijaSustava_jquery.js - skripta koja dohvaća podatke o konfiguraciji sustava iz baze putem AJAX-a.<br>
        14. moderatoriPivnica_jquery.js - skripta koja putem AJAX-a dohvaća popis svih pivnica i popis svih korisnika.<br>
        15. promjenaUloge_jquery.js - skripta koja omogućuje korisniku promjenu navigacije ukoliko ima ulogu veću od registriranog
        korisnika. Promjenom select elementa putem AJAX-a se šalje navigacija tražene uloge i ona se prikazuje korisniku.<br>
        16. registracija_jquery.js - skripta koja sadrži validaciju na korisničkoj strani: provjera korisničkog imena putem AJAX-a,
        provjera da ime i prezime sadrže samo slova, provjera podudaranja lozinki, provjera duljine emaila (između 10 i 30), te provjera
        formata emaila.<br>
        </p>
        <h1>Popis korištenih tehnologija i alata</h1>
        <p>
            1. Visual Studio Code - alat za uređivanje programskog koda (uz to još i dodatak za prijenos datoteka na server)<br>
            2. cmd - alat za spajanje na server, te dodjeljivanje prava pristupa direktoriju<br>
            3. MySQL Workbench - alat za izradu modela baze<br>
            4. phpMyAdmin - alat za izradu baze podataka <br>
            5. xampp - lokalni poslužitelj za prikaz web stranica<br>
        </p>
        <h1>Popis vanjskih biblioteka i literature</h1>
        <p>
            1. <a href="https://code.jquery.com/jquery-3.3.1.min.js">JQuery</a> - biblioteka za JQuery funkcije<br>
            2. <a href="https://developers.google.com/recaptcha/docs/display">Google reCAPTCHA API</a> - Googleov API za CAPTCHA provjeru automata<br>
            3. <a href="https://github.com/">GitHub servis</a> - Servis koji je odličan izvor pomagala<br>
            4. <a href="https://stackoverflow.com/">stackoverflow</a> - Servis sa dosta objašnjenja i uputa za rad ovog projekta i odličan izvor pomagala<br>
        </p>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>