<?php

require("skripte/aplikacijskiOkvir.php");

if (ImaPristup(Moderator) == false) {
    header("Location: index.php");
    exit();
}

ZapisiPosjetu();

if (SesijaIstekla() == true) {
    header("Location: odjava.php");
    exit();
} else {
    KorisnikOsvjezioStranicu();
}

if (isset($_POST["kreirajPivo"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $naziv = $_POST["naziv"];
        $cijena = $_POST["cijena"];
        $opis = $_POST["opis"];
        $volumen = $_POST["volumen"];
        $rok_trajanja = $_POST["rok_trajanja"];
        $slika = $_POST["slika"];
        $insert = IUDUpit("insert into pivo values (default, '$naziv', '$cijena', '2010', 'Novost br. 2', '$slika', '4.00', 'Ale', '2', '1', '$opis', '$volumen', '$rok_trajanja')");
        ZapisiUpit("insert into pivo");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

if (isset($_POST["azurirajPivo"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $pivo = $_POST["pivo"];
        $naziv = $_POST["naziv"];
        $cijena = $_POST["cijena"];
        $opis = $_POST["opis"];
        $volumen = $_POST["volumen"];
        $rok_trajanja = $_POST["rok_trajanja"];
        $slika = $_POST["slika"];
        $update = IUDUpit("UPDATE pivo SET naziv = '$naziv', cijena = '$cijena', opis = '$opis', volumen = '$volumen', rok_trajanja = '$rok_trajanja', slika = '$slika' WHERE id_pivo = '$pivo';");
        ZapisiUpit("update pivo");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Pivo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/pivo_jquery.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <meta name="opis" content="Pivo">
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
        <form class="obrasci" id="kreirajPivo1" method="post" action="#">
            <br>
            <h1>Kreiraj pivo</h1>
            <br>
            <p>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <label class="labele" for="cijena">Cijena (HRK): </label>
                <input class="polja" id="cijena" name="cijena" type="number" step=".01">
                <br>
                <label class="labele" for="opis">Opis: </label>
                <textarea class="polja" id="opis" name="opis" rows="15" cols="20"></textarea>
                <br>
                <label class="labele" for="volumen">Volumen: </label>
                <input class="polja" id="volumen" name="volumen" type="text">
                <br>
                <label class="labele" for="rok_trajanja">Rok trajanja: </label>
                <input class="polja" id="rok_trajanja" name="rok_trajanja"  type="datetime-local">
                <br>
                <label class="labele" for="slika">Slika: </label>
                <input class="polja" id="slika" name="slika" type="text">
                <br>
                <input class="polja" id="kreirajPivo" name="kreirajPivo" type="submit" value="Kreiraj pivo">
                <br>
            </p>
        </form><br>
        <form class="obrasci" id="azurirajPivo1" method="post" action="#">
            <br>
            <h1>Ažuriraj pivo</h1>
            <br>
            <p>
                <label class="labele" for="pivo">ID: </label>
                <select class="polja" id="pivo" name="pivo"></select><br>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <label class="labele" for="cijena">Cijena (HRK): </label>
                <input class="polja" id="cijena" name="cijena" type="number" step=".01">
                <br>
                <label class="labele" for="opis">Opis: </label>
                <textarea class="polja" id="opis" name="opis" rows="15" cols="20"></textarea>
                <br>
                <label class="labele" for="volumen">Volumen: </label>
                <input class="polja" id="volumen" name="volumen" type="text">
                <br>
                <label class="labele" for="rok_trajanja">Rok trajanja: </label>
                <input class="polja" id="rok_trajanja" name="rok_trajanja"  type="datetime-local">
                <br>
                <label class="labele" for="slika">Slika: </label>
                <input class="polja" id="slika" name="slika" type="text">
                <br>
                <input class="polja" id="azurirajPivo" name="azurirajPivo" type="submit" value="Ažuriraj pivo">
                <br>
            </p>
        </form>
    </section><br>
    <section>
        <div id="filteri">
        </div>

        <div id="tablica" class="klasaPrintanje">
        </div>
        <br>
        <canvas id="platno" width="800" height="400" class="klasaPrintanje">
        </canvas>
        <br>
        <input class="polja" type="submit" value="Print" onclick="window.print();">
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>