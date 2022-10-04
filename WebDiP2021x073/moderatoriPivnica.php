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

if (isset($_POST["dodijeliModeratora"])) {
    $greska = "";
    if ($_POST["pivnica"] == "-1")
        $greska .= "Pivnica nije odabrana.";
    if ($_POST["moderator"] == "-1")
        $greska .= "Moderator nije odabran.";
    if (empty($greska)) {
        $pivnica = $_POST["pivnica"];
        $moderator = $_POST["moderator"];
        $izvrsiUpit = IUDUpit("insert into moderator values ($pivnica, $moderator)");
        ZapisiUpit("insert into moderator");
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Moderatori pivnica</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/promjenaUloge_jquery.js"></script>
    <script src="js/moderatoriPivnica_jquery.js"></script>
    <meta name="opis" content="Moderatori pivnica">
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
        <form class="obrasci" id="moderatorUstanove" method="post" action="#">
            <br>
            <h1>Dodijeli moderatora pivnici</h1>
            <br>
            <p>
                <label class="labele" for="pivnica">Pivnica: </label>
                <select class="polja" id="pivnica" name="pivnica">
                </select>
                <br>
                <label class="labele" for="moderator">Moderator: </label>
                <select class="polja" id="moderator" name="moderator">
                </select>
                <br>
                <input class="polja" id="dodijeliModeratora" name="dodijeliModeratora" type="submit" value="Dodijeli moderatora">
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