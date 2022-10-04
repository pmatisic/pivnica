<?php

require("skripte/aplikacijskiOkvir.php");

?>

<!DOCTYPE html>
<html>

<head>
    <title>O autoru</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/pmatisic.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
    <link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <meta name="opis" content="O autoru">
    <meta name="datum kreiranja" content="18.03.2022.">
    <meta name="autor" content="Petar Matišić">
</head>

<body>
    <header>
        <h1 class="naslov-zaglavlje">Pivnica</h1>
        <div> <a href="index.php">
                <img src="img/logo2.png" alt="Početna" class="ribbon" />
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
        <ul class="lista-pocetna">
            <li>Ime: Petar</li>
            <li>Prezime: Matišić</li>
            <li>E-mail: pmatisic@foi.hr</li>
            <li>JMBAG: 0016145882</li>
        </ul>
        <img class="slika-autora" src="img/me.JPG" alt="Slika autora stranice" />
        <div id="blok-teksta-pocetna"><br>
            <p>
                Petar Matišić rođen je 24. travnja 2001. godine u gradu Livnu (BiH).
                Od najranijih godina živi u Gornjem Vakufu-Uskoplju (BiH), gdje je
                pohađao osnovnu i srednju školu. Nakon završene osnovne škole upisao se
                u srednju elektrotehničku školu, slijedeći tako svoj cilj od malih nogu
                - biti informatičar. Nakon izvrsnog uspjeha u srednjoj školi, počeo je
                nadograđivati svoje znanje nakon upisa na Fakultet organizacije i informatike
                u Varaždinu, Sveučilište u Zagrebu.
            </p>
            <p>
                Trenutno je na trećoj godini preddiplomskog sveučilišnog studija
                informatike. Područja njegovog interesa u kontekstu istraživanja
                su različita područja računarske znanosti, poput strojnog učenja i računalnog vida. Osim
                obrazovanja, aktivan je član lokalnog i
                međunarodnog društva, aktivnim i volonterskim radom.
            </p>
        </div>
    </section>
    <footer>
        <address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
        <p>&copy; 2022 P. Matišić</p>
    </footer>
</body>

</html>