<?php

require("skripte/aplikacijskiOkvir.php");

if (ImaPristup(Administrator) == false) {
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

if (isset($_POST["kreirajPivnicu"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $naziv = $_POST["naziv"];
        $adresa = $_POST["adresa"];
        $broj_telefona = $_POST["broj_telefona"];
        $email = $_POST["email"];
        $detalji = $_POST["detalji"];
        $insert = IUDUpit("insert into pivnica values (default, '$naziv', '$adresa', $broj_telefona, '$email', '$detalji')");
        ZapisiUpit("insert into pivnica");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

if (isset($_POST["azurirajPivnicu"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $pivnica = $_POST["pivnica"];
        $naziv = $_POST["naziv"];
        $adresa = $_POST["adresa"];
        $broj_telefona = $_POST["broj_telefona"];
        $email = $_POST["email"];
        $detalji = $_POST["detalji"];
        $update = IUDUpit("UPDATE pivnica SET naziv = '$naziv', adresa = '$adresa', broj_telefona = '$broj_telefona', email = '$email', detalji = '$detalji' WHERE id_pivnica = '$pivnica';");
        ZapisiUpit("update pivnica");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Pivnica</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/pivnica_jquery.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <meta name="opis" content="pivnica">
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
        <form class="obrasci" id="kreirajPivnicu1" method="post" action="#">
            <br>
            <h1>Kreiraj pivnicu</h1>
            <br>
            <p>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <label class="labele" for="adresa">Adresa: </label>
                <input class="polja" id="adresa" name="adresa" type="text">
                <br>
                <label class="labele" for="broj_telefona">Broj telefona: </label>
                <input class="polja" id="broj_telefona" name="broj_telefona" type="text">
                <br>
                <label class="labele" for="email">E-mail: </label>
                <input class="polja" id="email" name="email" type="text">
                <br>
                <label class="labele" for="detalji">Detalj: </label>
                <input class="polja" id="detalji" name="detalji" type="text">
                <br>
                <input class="polja" id="kreirajPivnicu" name="kreirajPivnicu" type="submit" value="Kreiraj pivnicu">
                <br>
            </p>
        </form><br>
        <form class="obrasci" id="azurirajPivnicu1" method="post" action="#">
            <br>
            <h1>Ažuriraj pivnicu</h1>
            <br>
            <p>
                <label class="labele" for="pivnica">Pivnica: </label>
                <select class="polja" id="pivnica" name="pivnica">
                </select><br>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <label class="labele" for="adresa">Adresa: </label>
                <input class="polja" id="adresa" name="adresa" type="text">
                <br>
                <label class="labele" for="broj_telefona">Broj telefona: </label>
                <input class="polja" id="broj_telefona" name="broj_telefona" type="text">
                <br>
                <label class="labele" for="email">E-mail: </label>
                <input class="polja" id="email" name="email" type="text">
                <br>
                <label class="labele" for="detalji">Detalj: </label>
                <input class="polja" id="detalji" name="detalji" type="text">
                <br>
                <input class="polja" id="azurirajPivnicu" name="azurirajPivnicu" type="submit" value="Ažuriraj pivnicu">
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