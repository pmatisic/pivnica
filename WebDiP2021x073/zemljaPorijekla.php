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

if (isset($_POST["kreirajZemljuPorijekla"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $naziv = $_POST["naziv"];
        $insert = IUDUpit("insert into zemlja_porijekla values (default, '$naziv')");
        ZapisiUpit("insert into zemlja_porijekla");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

if (isset($_POST["azurirajZemljuPorijekla"])) {
    $greska = "";
    foreach ($_POST as $k => $v) {
        if (empty($v) || $v == "-1") {
            $greska .= "$k nije unesen. ";
        }
    }
    if (empty($greska)) {
        $zemlja = $_POST["zemlja"];
        $naziv = $_POST["naziv"];
        $update = IUDUpit("UPDATE zemlja_porijekla SET naziv = '$naziv' WHERE idzemlja_porijekla = '$zemlja';");
        ZapisiUpit("update zemlja_porijekla");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Zemlje porijekla</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/zemljaPorijekla_jquery.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <meta name="opis" content="Zemlja porijekla">
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
        <form class="obrasci" id="kreirajZemljuPorijekla1" method="post" action="#">
            <br>
            <h1>Kreiraj zemlju porijekla</h1>
            <br>
            <p>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <input class="polja" id="kreirajZemljuPorijekla" name="kreirajZemljuPorijekla" type="submit" value="Kreiraj zemlju porijekla">
                <br>
            </p>
        </form><br>
        <form class="obrasci" id="azurirajZemljuPorijekla1" method="post" action="#">
            <br>
            <h1>Ažuriraj zemlju porijekla</h1>
            <br>
            <p>
                <label class="labele" for="zemlja">ID: </label>
                <select class="polja" id="zemlja" name="zemlja"></select><br>
                <label class="labele" for="naziv">Naziv: </label>
                <input class="polja" id="naziv" name="naziv" type="text">
                <br>
                <input class="polja" id="azurirajZemljuPorijekla" name="azurirajZemljuPorijekla" type="submit" value="Ažuriraj zemlju porijekla">
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