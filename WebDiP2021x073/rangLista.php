<?php

require("skripte/aplikacijskiOkvir.php");

if (SesijaIstekla() == true) {
	header("Location: odjava.php");
	exit();
} else {
	KorisnikOsvjezioStranicu();
}

ZapisiPosjetu();

?>


<!DOCTYPE html>
<html lang="hr">

<head>
	<title>Rang lista</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/pmatisic.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/rangLista_jquery.js"></script>
	<script src="js/promjenaUloge_jquery.js"></script>
	<meta name="opis" content="Rang lista">
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