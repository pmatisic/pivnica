<?php

require("skripte/aplikacijskiOkvir.php");

if (ImaPristup(Administrator) == false) {
    header("Location: index.php");
    exit();
}

if (SesijaIstekla() == true) {
    header("Location: odjava.php");
    exit();
} else {
    KorisnikOsvjezioStranicu();
}

ZapisiPosjetu();

if (isset($_POST["konfiguriraj"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v)) {
            $greska .= "$k nije unesen.";
        }
    }
    if (empty($greska)) {
        $stranicanje = $_POST["stranicanje"];
        $pomak = $_POST["pomak"];
        $aktKod = $_POST["aktKod"];
        $kolacic = $_POST["kolacic"];
        $sesija = $_POST["sesija"];
        $topLista = $_POST["topLista"];
        $brojPokusaja = $_POST["brojPokusaja"];
        $azuriraj = IUDUpit("update konfiguracija_sustava set pomak=$pomak, stranicanje=$stranicanje, 
            trajanje_sesija=$sesija, trajanje_kolacic=$kolacic, trajanje_aktivacijski_kod=$aktKod, 
            broj_pokusaja=$brojPokusaja, top_lista=$topLista where id_konfiguracija_sustava=1");
        ZapisiUpit("update konfiguracija_sustava");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Konfiguracija sustava</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/konfiguracijaSustava_jquery.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <meta name="opis" content="Konfiguracija sustava">
    <meta name="datum kreiranja" content="18.03.2022.">
    <meta name="autor" content="Petar Matišić">
</head>

<body>
    <header>
        <h1 class="naslov-zaglavlje">Pivnica</h1>
        <div> <a href="index.php">
                <img src="img/logo.png" alt="Početna" class="ribbon" />
            </a></div>
        <p class="datum-vrijeme">Datum i vrijeme:<br>
            <?php
            echo VrijemePomak(DatumVrijemeBaza);
            ?>
        </p><br>
        <?php
        generirajPromjenuUloge();
        generirajMjestoOdjave();
        ?>
        <div class="hamburger-menu">
            <input id="menu__toggle" type="checkbox" />
            <label class="menu__btn" for="menu__toggle">
                <span></span>
            </label>
            <nav class="menu__box">
                <?php
                generirajNavigaciju();
                ?>
            </nav>
        </div>
    </header>
    <section>
        <form class="obrasci" id="konfiguracija" method="post" action="#">
            <br>
            <h1>Konfiguracija sustava</h1>
            <br>
            <p>
                <label class="labele" for="pomak">Pomak vremena: </label>
                <input class="polja" id="pomak" name="pomak" type="number">
                <br>
                <label class="labele" for="stranicanje">Stranicanje: </label>
                <input class="polja" id="stranicanje" name="stranicanje" type="number">
                <br>
                <label class="labele" for="sesija">Trajanje sesije: </label>
                <input class="polja" id="sesija" name="sesija" type="number">
                <br>
                <label class="labele" for="kolacic">Trajanje kolačića: </label>
                <input class="polja" id="kolacic" name="kolacic" type="number">
                <br>
                <label class="labele" for="aktKod">Trajanje akt. kod: </label>
                <input class="polja" id="aktKod" name="aktKod" type="number">
                <br>
                <label class="labele" for="brojPokusaja">Broj pokušaja: </label>
                <input class="polja" id="brojPokusaja" name="brojPokusaja" type="number">
                <br>
                <label class="labele" for="topLista">Broj korisnika: </label>
                <input class="polja" id="topLista" name="topLista" type="number">
                <br>
                <input class="polja" id="konfiguriraj" name="konfiguriraj" type="submit" value="Potvrdi">
            </p>
            <br>
        </form>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>