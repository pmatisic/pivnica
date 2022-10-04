<?php

require("skripte/aplikacijskiOkvir.php");

ZapisiOdjavu();
session_start();
session_unset();
session_destroy();

header("Location: index.php");
exit();

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
		<a href="prijava.php" class="prijava-zaglavlje">Prijava</a><br>
		<div class="hamburger-menu">
			<input id="menu__toggle" type="checkbox" />
			<label class="menu__btn" for="menu__toggle">
				<span></span>
			</label>
			<nav class="menu__box">
				<?php generirajNavigacijuGost(); ?>
			</nav>
		</div>
	</header>
	<section>
		<h1>Odjavili ste se iz sustava!</h1>
	</section>
	<footer>
		<address>Kontakt: <a href="mailto:pmatisic@foi.hr">Petar Matišić</a></address>
		<p>&copy; 2022 P. Matišić</p>
	</footer>
</body>

</html>