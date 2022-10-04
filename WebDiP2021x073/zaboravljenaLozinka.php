<?php

require("skripte/aplikacijskiOkvir.php");

if (isset($_POST["potvrdiSlanje"])) {
    $greska = "";
    $email = "";
    $rezultat = null;
    if (empty($_POST["email"])) {
        $greska .= "Unesite email.";
    } else {
        $email = $_POST["email"];
        $rezultat = SelectUpit("select * from korisnik where email='$email'");
        if (mysqli_num_rows($rezultat) == 0) {
            $greska .= "Nepostojeći email.";
        }
    }
    if (!empty($greska)) {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    } else {
        $poljeZnakova = "qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM";
        $novaLozinka = "";
        for ($i = 0; $i < 10; $i++) {
            $novaLozinka .= $poljeZnakova[rand(0, strlen($poljeZnakova) - 1)];
        }
        $salt = sha1("Hj12367%4#903.-,as23");
        $kriptiranaLozinka = sha1($salt . "--" . $novaLozinka);
        $azurirajLozinkuUBazi = IUDUpit("update korisnik set lozinka='$novaLozinka', lozinka_kriptirana='$kriptiranaLozinka' where email='$email'");
        ZapisiUpit("update korisnik");
        $korime = mysqli_fetch_array($rezultat);
        $id = $korime["id_korisnik"];
        $korime = $korime["korisnicko_ime"];
        $porukaEmail = "Poštovani,\r\n";
        $porukaEmail .= "šaljemo vam novu generiranu lozinku.\r\n";
        $porukaEmail .= "Korisničko ime: $korime\r\n";
        $porukaEmail .= "Lozinka: $novaLozinka";
        $porukaEmail .= "\r\nLijep pozdrav!";
        mail($email, "Nova lozinka", $porukaEmail);
        echo "<script type='text/javascript'>alert('Na email vam je poslana nova lozinka!');</script>";
        ZapisiSlanjeLozinke($id);
        header("Location: prijava.php");
        exit();
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Zaboravljena lozinka</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <meta name="opis" content="Zaboravljena lozinka">
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
        <form novalidate class="obrasci" id="zaboravljenaLozinka" method="post" action="#">
            <p>
                <br>
            <h1>Zaboravljena lozinka</h1>
            <br>
            <label class="labele" for="email">Unesite email: </label>
            <input class="polja" id="email" name="email" type="email">
            <br>
            <input class="polja" id="potvrdiSlanje" name="potvrdiSlanje" value="Pošalji" type="submit">
            <br>
            <p>
        </form>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>