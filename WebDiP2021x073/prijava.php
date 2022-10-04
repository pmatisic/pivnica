<?php

$uri = $_SERVER["REQUEST_URI"];
$pos = strrpos($uri, "/");
$dir = $_SERVER["SERVER_NAME"] . substr($uri, 0, $pos + 1);
if (!isset($_SERVER["HTTPS"]) || strtolower($_SERVER["HTTPS"]) != "on") {
	$adresa = "https://" . $dir . "prijava.php";
	header("Location: $adresa");
	exit();
}

require("skripte/aplikacijskiOkvir.php");

$korimeKolacic = isset($_COOKIE["korime"]) ? $_COOKIE["korime"] : "-1";

if (isset($_POST["potvrdiPrijavu"])) {
	$greska = "";
	foreach ($_POST as $k => $v) {
		if ($k == "zapamtiMe") continue;
		if (empty($v)) {
			$greska .= "$k nije unesen.";
		}
	}
	if (!empty($greska)) {
		echo "<script type='text/javascript'>alert('$greska');</script>";
	} else {
		$korime = $_POST["korime"];
		$lozinka = $_POST["lozinka"];
		$zapamtiMe = isset($_POST["zapamtiMe"]) ? $_POST["zapamtiMe"] : "-1";
		$salt = sha1("Hj12367%4#903.-,as23");
		$lozinkaKriptirano = sha1($salt . "--" . $lozinka);
		$rezultat = SelectUpit("select * from korisnik where korisnicko_ime='$korime' and lozinka_kriptirana='$lozinkaKriptirano' and status='A'");
		if (mysqli_num_rows($rezultat) == 0) {
			$azurirajBrojPokusaja = IUDUpit("update korisnik set broj_pokusaja=broj_pokusaja+1 where korisnicko_ime='$korime'");
			$provjeriJeLiBlokiran = SelectUpit("select broj_pokusaja from korisnik where korisnicko_ime='$korime'");
			$provjeriJeLiBlokiran = mysqli_fetch_array($provjeriJeLiBlokiran);
			$dozvoljeniBrojPokusaja = SelectUpit("select broj_pokusaja from konfiguracija_sustava where id_konfiguracija_sustava=1");
			$dozvoljeniBrojPokusaja = mysqli_fetch_array($dozvoljeniBrojPokusaja);
			if ($provjeriJeLiBlokiran[0] >= $dozvoljeniBrojPokusaja[0]) {
				$datumZabrane = VrijemePomak(DatumVrijemeBaza);
				$azurirajStatus = IUDUpit("update korisnik set status='B', datum_zabrane='$datumZabrane' where korisnicko_ime='$korime'");
				$idKorisnika = SelectUpit("select * from korisnik where korisnicko_ime='$korime'");
				$idKorisnika = mysqli_fetch_array($idKorisnika);
				$idKorisnika = $idKorisnika["id_korisnik"];
				ZapisiZakljucavanje($idKorisnika);
			}
			echo "<script type='text/javascript'>alert('Neuspješna prijava.');</script>";
		} else {
			$postaviBrojPokusajaNa0 = IUDUpit("update korisnik set broj_pokusaja=0 where korisnicko_ime='$korime'");
			$podaciKorisnika = mysqli_fetch_array($rezultat);
			$korisnik = new Korisnik();
			$korisnik->postaviPodatke(
				$podaciKorisnika["id_korisnik"],
				$podaciKorisnika["korisnicko_ime"],
				$podaciKorisnika["ime"],
				$podaciKorisnika["prezime"],
				$podaciKorisnika["email"],
				$podaciKorisnika["id_tip_korisnika"],
				VrijemePomak(DatumVrijemeBaza)
			);
			if ($zapamtiMe != "-1") {
				$trajanjeKolacica = SelectUpit("select trajanje_kolacic from konfiguracija_sustava where id_konfiguracija_sustava=1");
				$trajanjeKolacica = mysqli_fetch_array($trajanjeKolacica);
				$trajanjeKolacica = VrijemePomak(Sekunde) + $trajanjeKolacica[0] * 24 * 60 * 60;
				setcookie("korime", $korisnik->dohvatiKorime(), $trajanjeKolacica);
			}
			if ($zapamtiMe == "-1" && isset($_COOKIE["korime"])) {
				setcookie("korime", $korisnik->dohvatiKorime(), time());
			}
			if (session_status() == 1) session_start();
			$_SESSION["aktivniKorisnik"] = $korisnik;
			ZapisiPrijavu();
			header("Location: index.php");
			exit();
		}
	}
}

?>

<!DOCTYPE html>
<html lang="hr">

<head>
	<title>Prijava</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/pmatisic.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_prilagodba.css" rel="stylesheet" type="text/css">
	<link href="css/pmatisic_print.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<meta name="opis" content="Prijava">
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
		<form novalidate class="obrasci" id="prijava" method="post" action="#">
			<h1>Prijava</h1>
			<p>
				<br>
				<label class="labele" for="korime">Korisničko ime:</label>
				<input class="polja" id="korime" name="korime" type="text" value="<?php if ($korimeKolacic != "-1") echo $korimeKolacic; ?>">
				<br>
				<label class="labele" for="lozinka">Lozinka:</label>
				<input class="polja" id="lozinka" name="lozinka" type="password">
				<br>
				<label class="labele" for="zapamtiMe">Zapamti me:</label>
				<input class="polja" id="zapamtiMe" name="zapamtiMe" type="checkbox">
				<br>
				<input class="polja" id="potvrdiPrijavu" name="potvrdiPrijavu" type="submit" value="Prijavi se">
				<br>
				<a href="zaboravljenaLozinka.php">Zaboravljena lozinka</a>
				<br>
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