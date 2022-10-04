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

if (isset($_POST["dodijeliPivo"])) {
    $greska = "";
    if ($_POST["pivo"] == "-1")
        $greska .= "Pivo nije odabrano.";
    if ($_POST["zemlja"] == "-1")
        $greska .= "Zemlja porijekla nije odabrana.";
    if (empty($greska)) {
        $pivo = $_POST["pivo"];
        $zemlja = $_POST["zemlja"];
        $izvrsiUpit = IUDUpit("UPDATE pivo SET zemlja_porijekla_idzemlja_porijekla = '$zemlja' WHERE id_pivo = '$pivo';");
        ZapisiUpit("update pivo");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Pivo - zemlja porijekla</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <script src="js/pivoZemljaPorijekla_jquery.js"></script>
    <meta name="opis" content="Pivo - zemlja porijekla">
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
        <form class="obrasci" id="pivoZemljaPorijekla" method="post" action="#">
            <br>
            <h1>Dodijeli pivo zemlji porijekla</h1>
            <br>
            <p>
                <label class="labele" for="zemlja">Zemlja porijekla: </label>
                <select class="polja" id="zemlja" name="zemlja">
                </select><br>
                <label class="labele" for="pivo">Pivo: </label>
                <select class="polja" id="pivo" name="pivo">
                </select>
                <br>
                <br>
                <input class="polja" id="dodijeliPivo" name="dodijeliPivo" type="submit" value="Dodijeli pivo">
                <br>
            </p>
        </form>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>