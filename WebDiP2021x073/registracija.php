<?php

require("skripte/aplikacijskiOkvir.php");

if (isset($_POST['potvrdiRegistraciju'])) {

    $greska = "";

    $vrijednosti = array('secret' => "6Ld9LEogAAAAAArUMkNsTAlaLPvOVI4Q10CYhW-d", 'response' => $_POST['g-recaptcha-response']);
    $options = array(
        'http' => array(
            'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
            'method'  => 'POST',
            'content' => http_build_query($vrijednosti)
        )
    );
    $context  = stream_context_create($options);
    $rezultat = file_get_contents("https://www.google.com/recaptcha/api/siteverify", false, $context);
    if ($rezultat === false) {
        $greska .= "CAPTHA provjera nije kontaktirala server, provjerite povezanost sa internetom!";
    }
    $json = json_decode($rezultat, true);
    $prolaz = $json['success'];
    if (!$prolaz) {
        $greska .= "CAPTHA provjera nije uspjela!";
    }

    $ime = $_POST["ime"];
    $prezime = $_POST["prezime"];
    $korime = $_POST["korime"];
    $email = $_POST["email"];
    $lozinka = $_POST["lozinka"];
    $ponovljenaLozinka = $_POST["ponovljenaLozinka"];
    $adresa = $_POST["adresa"];
    $spol = $_POST["spol"];

    foreach ($_POST as $k => $v) {
        if ($k == "adresa")
            continue;
        if (empty($v) || ($k == "spol" && $v == "-1")) {
            $greska .= "$k nije unesen.";
        }
        if ($k == "ime" || $k == "prezime") {
            if (preg_match('/^[a-zA-zščćžđČĆŽŠĐ]+$/', $v) == false) {
                $greska .= "$k mora sadržavati samo velika i mala slova.";
            }
        }
        if ($k == "korime") {
            $rezultat = SelectUpit("select * from korisnik where korisnicko_ime='$v'");
            if (mysqli_num_rows($rezultat) > 0)
                $greska .= "Postoji korisnik s korisničkim imenom $v.";
        }
        if ($k == "email") {
            $rezultat = SelectUpit("select * from korisnik where email='$v'");
            if (mysqli_num_rows($rezultat) > 0) {
                $greska .= "Postoji korisnik s email-om $v";
            }
            if (strlen($v) < 10 || strlen($v) > 30) {
                $greska .= "$k mora imati između 10 i 30 znakova.";
            }
            if (preg_match('/^\w{1,}.?\w{1,}@(\w{1,}\.)\w{2,}$/', $v) == false) {
                $greska .= "$k nije ispravnog formata.";
            }
        }
    }

    if ($lozinka !== $ponovljenaLozinka)
        $greska .= "Lozinke se ne podudaraju.";

    if (!empty($greska)) {
        echo "<script type='text/javascript'>alert('$greska');</script>";
    }
    if (empty($greska)) {
        $salt = sha1("Hj12367%4#903.-,as23");
        $kriptiranaLozinka = sha1($salt . "--" . $lozinka);
        $datumPristupa = VrijemePomak(DatumVrijemeBaza);
        $upit = "insert into korisnik values 
                (default, " . Registrirani . ", '$ime', '$prezime', '$korime', '$lozinka', 
                '$kriptiranaLozinka', '$email', '$adresa', '$spol', '$datumPristupa',
                'NULL', 0, 'B', '2022-04-01 00:00:00')";
        $izvrsiUpit = IUDUpit($upit);
        ZapisiUpit("insert into korisnik");
        $rezultat = SelectUpit("select max(id_korisnik) from korisnik");
        $rezultat = mysqli_fetch_array($rezultat);
        $korisnikId = $rezultat[0];
        $aktivacijskiKod = sha1($salt . "--" . $datumPristupa);
        $upit2 = "insert into aktivacijski_kodovi values (default, '$aktivacijskiKod', '$datumPristupa', $korisnikId)";
        $izvrsiUpit2 = IUDUpit($upit2);
        ZapisiUpit("insert into aktivacijski_kodovi");
        $porukaEmail = "Poštovani,\r\n";
        $porukaEmail .= "uspješno ste se registrirali. Šaljemo vam ovaj aktivacijski kod kako bi ste potvrdili svoju registraciju.\r\n";
        $porukaEmail .= "Link za aktivaciju: barka.foi.hr/WebDiP/2021_projekti/WebDiP2021x073/aktivacija.php\r\n";
        $porukaEmail .= "Aktivacijski kod: $aktivacijskiKod";
        $porukaEmail .= "\r\nLijep pozdrav!";
        mail($email, "Aktivacijski kod", $porukaEmail);
        echo "<script type='text/javascript'>alert('Uspješno ste se registrirali! Na email ste primili aktivacijski kod!');</script>";
        header("Location: aktivacija.php");
        exit();
    }
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Registracija</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/registracija_jquery.js"></script>
    <meta name="opis" content="Registracija">
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
    <section>
        <form novalidate class="obrasci" id="registracija" method="post" action="#">
            <h1>Registracija</h1>
            <br>
            <p>
                <label class="labele" for="ime">Ime: </label>
                <input class="polja" id="ime" name="ime" type="text">
                <br>
                <label class="labele" for="prezime">Prezime: </label>
                <input class="polja" id="prezime" name="prezime" type="text">
                <br>
                <label class="labele" for="korime">Korisničko ime: </label>
                <input class="polja" id="korime" name="korime" type="text">
                <br>
                <label class="labele" for="lozinka">Lozinka: </label>
                <input class="polja" id="lozinka" name="lozinka" type="password">
                <br>
                <label class="labele" for="ponovljenaLozinka">Ponovljena lozinka: </label>
                <input class="polja" id="ponovljenaLozinka" name="ponovljenaLozinka" type="password">
                <br>
                <label class="labele" for="email">Email: </label>
                <input class="polja" id="email" name="email" type="text" placeholder="nesto@nesto.nesto">
                <br>
                <label class="labele" for="adresa">Adresa: </label>
                <input class="polja" id="adresa" name="adresa" type="text">
                <br>
                <label class="labele" for="spol">Spol: </label>
                <select class="polja" id="spol" name="spol">
                    <option value="-1">&nbsp;</option>
                    <option value="M">Muško</option>
                    <option value="Z">Žensko</option>
                </select>
                <br>
            <div class="g-recaptcha" data-sitekey="6Ld9LEogAAAAANMFMwsR6ON63A_kDf104xgdpci-"></div>
            <br>
            <input class="polja" id="potvrdiRegistraciju" name="potvrdiRegistraciju" type="submit" value="Registriraj se">
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