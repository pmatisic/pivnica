<?php

require("skripte/aplikacijskiOkvir.php");

if (isset($_POST["potvrdiAktivaciju"])) {
    $greska = "";
    if (empty($_POST["aktivacijskiKod"])) {
        $greska .= "Unesite aktivacijski kod.";
    }
    if (empty($greska)) {
        $aktivacijskiKod = $_POST["aktivacijskiKod"];
        $trajanjeKoda = IUDUpit("select trajanje_aktivacijski_kod from konfiguracija_sustava where id_konfiguracija_sustava=1");
        $trajanjeKoda = mysqli_fetch_array($trajanjeKoda);
        $trajanjeKoda = $trajanjeKoda[0];
        $trenutnoVrijeme = VrijemePomak(DatumVrijemeBaza);
        $rezultat = SelectUpit("select * from aktivacijski_kodovi where vrijednost='$aktivacijskiKod'");
        $rezultat = mysqli_fetch_array($rezultat);
        $datumKreiranja = $rezultat["datum_kreiranja"];
        $razlika = strtotime($trenutnoVrijeme) - strtotime($datumKreiranja);
        if ($razlika > $trajanjeKoda * 60 * 60) {
            echo "<script type='text/javascript'>alert('Aktivacijski kod je istekao.');</script>";
        } else {
            $korisnikId = $rezultat["id_korisnik"];
            $azuriraj = IUDUpit("update korisnik set status='A' where id_korisnik=$korisnikId");
            $obrisi = IUDUpit("delete from aktivacijski_kodovi where id_korisnik=$korisnikId");
            ZapisiAktivaciju($korisnikId);
            echo "<script type='text/javascript'>alert('Uspješno ste aktivirali račun!');</script>";
            header("Location: prijava.php");
        }
    } else {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Aktivacija računa</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/registracija_jquery.js"></script>
    <meta name="opis" content="Aktivacija računa">
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
        <form novalidate class="obrasci" id="aktivacija" method="post" action="#">
            <h1>Aktivacija računa</h1>
            <br>
            <p>
                <label class="labele" for="aktivacijskiKod">Aktivacijski kod: </label>
                <input class="polja" id="aktivacijskiKod" name="aktivacijskiKod" type="text">
                <br>
                <input id="potvrdiAktivaciju" name="potvrdiAktivaciju" value="Potvrdi" type="submit">
                <br>
            </p>
        </form>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>
<script src='https://www.google.com/recaptcha/api.js'></script>

</html>