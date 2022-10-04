<?php

require("skripte/aplikacijskiOkvir.php");

ZapisiPosjetu();

if (SesijaIstekla() == true) {
	header("Location: odjava.php");
	exit();
} else {
	KorisnikOsvjezioStranicu();
}

if (!isset($_COOKIE["UvjetiKoristenja"])) {
	echo "<script type='text/javascript'>alert('Ova stranica biljezi kolacice!');</script>";
	$trajanjeKolacica = SelectUpit("select trajanje_kolacic from konfiguracija_sustava where id_konfiguracija_sustava=1");
	$trajanjeKolacica = mysqli_fetch_array($trajanjeKolacica);
	$trajanjeKolacica = VrijemePomak(Sekunde) + $trajanjeKolacica[0] * 24 * 60 * 60;
	setcookie("UvjetiKoristenja", "Da", $trajanjeKolacica);
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
	<title>Početna stranica</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/pmatisic.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/promjenaUloge_jquery.js"></script>
	<meta name="opis" content="Početna stranica">
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
		<?php
		if (KorisnikPrijavljen() == true) {
			$korisnik = DohvatiSesiju();
			echo "<h1>Dobrodošao, " . $korisnik->dohvatiKorime() . "!</h1>";
		} else {
			echo "<h1>Dobrodošli na stranicu Pivovare Medvedgrad!</h1>";
		}
		?>
	</section>
	<footer>
		<address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
		<p>&copy; 2022 P. Matišić</p>
	</footer>
</body>

</html>