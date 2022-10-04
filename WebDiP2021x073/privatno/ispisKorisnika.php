<?php

require("../skripte/aplikacijskiOkvir.php");
function ispisKorisnika()
{
    $rezultat = SelectUpit("select k.korisnicko_ime, k.ime, k.prezime, k.email, k.lozinka, t.naziv 
        from korisnik k, tip_korisnika t where k.id_tip_korisnika=t.id_tip_korisnika");
    $tablica = "<table border=" . 2 . ">";
    $tablica .= "<thead>";
    $tablica .= "<tr>";
    $tablica .= "<th>Korisničko ime</th>";
    $tablica .= "<th>Ime</th>";
    $tablica .= "<th>Prezime</th>";
    $tablica .= "<th>Email</th>";
    $tablica .= "<th>Lozinka</th>";
    $tablica .= "<th>Tip korisnika</th>";
    $tablica .= "</tr>";
    $tablica .= "</thead>";
    $tablica .= "<tbody>";
    while ($red = mysqli_fetch_array($rezultat)) {
        $tablica .= "<tr><td>" . $red["korisnicko_ime"] . "</td><td>" . $red["ime"] .
            "</td><td>" . $red["prezime"] . "</td><td>" . $red["email"] . "</td><td>" . $red["lozinka"] . "</td>
            <td>" . $red["naziv"] . "</td></tr>";
    }
    $tablica .= "</tbody>";
    $tablica .= "</table>";
    echo $tablica;
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
    <title>Ispis korisnika</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="../css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <meta name="opis" content="Ispis korisnika">
    <meta name="datum kreiranja" content="18.03.2022.">
    <meta name="autor" content="Petar Matišić">
    <style>
        @media print {
            body {
                background: white;
                color: black;
                margin: 0;
            }

            header {
                display: none;
            }

            footer {
                display: none;
            }
        }
    </style>
</head>

<body>
    <header>
        <h1 class="naslov-zaglavlje">Pivnica</h1>
        <div> <a href="../index.php">
                <img src="../img/logo2.png" alt="Početna" class="ribbon" />
            </a></div>
        <p class="datum-vrijeme">Datum i vrijeme:<br>
            <?php
            echo VrijemePomak(DatumVrijemeBaza);
            ?>
        </p><br>
        <a href="../prijava.php" class="prijava-zaglavlje">Prijava</a><br>
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
        <?php
        ispisKorisnika();
        ?>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>