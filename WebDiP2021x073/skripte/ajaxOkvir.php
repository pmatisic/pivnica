<?php

    require("aplikacijskiOkvir.php");

    $opcija="";

    if(isset($_POST["opcija"])){
        $opcija = $_POST["opcija"];
    }
    else{
        echo json_encode("neuspjesno");
        exit();
    }

    if($opcija=="provjeriKorime"){
        $korime = $_POST["korime"];
        $rezultat = SelectUpit("select * from korisnik where korisnicko_ime='$korime'");
        $brojRedaka = mysqli_num_rows($rezultat);
        $polje = null;
        if($brojRedaka>0){
            $polje["postoji"]="1";
        }
        else{
            $polje["postoji"]="0";
        }
        echo json_encode($polje);
        exit();
    }

    if($opcija=="provjeriEmail"){
        $email = $_POST["email"];
        $rezultat = SelectUpit("select * from korisnik where email='$email'");
        $brojRedaka = mysqli_num_rows($rezultat);
        $polje = null;
        if($brojRedaka>0){
            $polje["postoji"]="1";
        }
        else{
            $polje["postoji"]="0";
        }
        echo json_encode($polje);
        exit();
    }

    function KreirajJSON($upit){
        $rezultat = SelectUpit($upit);
        if(mysqli_num_rows($rezultat)==0){
            echo json_encode("nema zapisa");
        }
        else{
            $polje = array();
            while($red = mysqli_fetch_assoc($rezultat)){
                $polje[] = $red;
            }
            echo json_encode($polje);
        }
        exit();
    }

    if($opcija=="dohvatiPivnice1"){
        KreirajJSON("select * from pivnica");
    }

    if($opcija=="dohvatiPivnice"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $telefon = $_POST["telefon"];
        $ime = $_POST["ime"];

        $upit = "SELECT naziv, adresa, broj_telefona, email, detalji from pivnica";

        if(isset($_POST["telefon"]) && $_POST["telefon"]!=""){
            $upit .= " where broj_telefona='$telefon'";
        }
        if(isset($_POST["ime"]) && $_POST["ime"]!=""){
            $upit .= " where naziv='$ime'";
        }



        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 1 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 2 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="dohvatiPivo1"){
        KreirajJSON("select * from pivo");
    }

    if($opcija=="dohvatiZemlju1"){
        KreirajJSON("select * from zemlja_porijekla");
    }

    if($opcija=="dohvatiPivo"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $cijen = $_POST["cijen"];
        $ime = $_POST["ime"];

        $upit = "SELECT naziv, cijena, opis, volumen, rok_trajanja, slika from pivo";

        if(isset($_POST["cijen"]) && $_POST["cijen"]!=""){
            $upit .= " where cijena='$cijen'";
        }
        if(isset($_POST["ime"]) && $_POST["ime"]!=""){
            $upit .= " where naziv='$ime'";
        }



        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 1 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 2 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="dohvatiZemlju"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $idz = $_POST["idz"];
        $ime = $_POST["ime"];

        $upit = "SELECT idzemlja_porijekla, naziv from zemlja_porijekla";

        if(isset($_POST["idz"]) && $_POST["idz"]!=""){
            $upit .= " where idzemlja_porijekla='$idz'";
        }
        if(isset($_POST["ime"]) && $_POST["ime"]!=""){
            $upit .= " where naziv='$ime'";
        }

        $upit .= " group by 1";

        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 2 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 1 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="dohvatiSlike"){
        $ocj = $_POST["ocj"];

        $upit="SELECT pivo.cijena, pivo.slika, zemlja_porijekla.naziv as naz, recenzija.ocjena from pivo, zemlja_porijekla, recenzija where recenzija.pivo_id_pivo = pivo.id_pivo and pivo.zemlja_porijekla_idzemlja_porijekla = zemlja_porijekla.idzemlja_porijekla";

        if(isset($_POST["ocj"]) && $_POST["ocj"]!=""){
            $upit .= " and recenzija.ocjena='$ocj'";
        }

        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 1 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 3";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 3 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="promijeniUlogu"){
        $uloga = $_POST["tip"];
        if(KorisnikPrijavljen()==true){
            $korisnik = DohvatiSesiju();
            $korisnik->promijeniUlogu($uloga);
        }
    }

    if($opcija=="statistikaNovosti"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $godina = $_POST["godina"];
        $kategor = $_POST["kategor"];

        $upit = "SELECT naziv, count(novosti) as broj, novosti, kategorija, postotak_alkohola, godina_proizvodnje from pivo";

        if(isset($_POST["godina"]) && $_POST["godina"]!=""){
            $upit .= " where godina_proizvodnje='$godina'";
        }
        if(isset($_POST["kategor"]) && $_POST["kategor"]!=""){
            $upit .= " where kategorija='$kategor'";
        }
        $upit .= " group by 1";
        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 1 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 2 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="dohvatiVelicinuStranicanja"){
        KreirajJSON("select * from konfiguracija_sustava");
    }
    
    if($opcija=="statistikaNarudzbi"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $datumOd = $_POST["datumOd"];
        $datumDo = $_POST["datumDo"];
        $brojnar = $_POST["brojnar"];
        $zem = $_POST["zem"];

        $upit = "SELECT id_pivo, broj_narudzbe, vrijeme_postavljanja, cijena, volumen, zemlja_porijekla.naziv from narudzba, pivo, zemlja_porijekla where narudzba_id_narudzba = id_narudzba and zemlja_porijekla_idzemlja_porijekla = idzemlja_porijekla";

        if(isset($_POST["brojnar"]) && $_POST["brojnar"]!=""){
            $upit .= " and broj_narudzbe='$brojnar'";
        }
        if(isset($_POST["zem"]) && $_POST["zem"]!=""){
            $upit .= " and zemlja_porijekla.naziv='$zem'";
        }
        if(isset($_POST["datumOd"]) && $_POST["datumOd"]!=""){
            $datumOd = $_POST["datumOd"];
            $upit .= " and vrijeme_postavljanja>='$datumOd'";
        }
        if(isset($_POST["datumDo"]) && $_POST["datumDo"]!=""){
            $datumDo = $_POST["datumDo"];
            $upit .= " and vrijeme_postavljanja<='$datumDo'";
        }
        $upit .= " group by 6";
        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 2 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 1 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="rangListaKorisnika"){
        $brojKorisnika = SelectUpit("select * from konfiguracija_sustava");
        $brojKorisnika = mysqli_fetch_array($brojKorisnika);
        $brojKorisnika = $brojKorisnika["top_lista"];
        $datumOd = $_POST["datumOd"];
        $datumDo = $_POST["datumDo"];

        $upit = "SELECT naziv, count(id_narudzba) as broj, vrijeme_postavljanja from narudzba, pivnica where pivnica_id_pivnica = id_pivnica";

        if(isset($_POST["datumOd"]) && $_POST["datumOd"]!=""){
            $datumOd = $_POST["datumOd"];
            $upit .= " and vrijeme_postavljanja>='$datumOd'";
        }
        if(isset($_POST["datumDo"]) && $_POST["datumDo"]!=""){
            $datumDo = $_POST["datumDo"];
            $upit .= " and vrijeme_postavljanja<='$datumDo'";
        }
        $upit .= " group by 1";
        if($_POST["sortiranje"]=="IU"){
            $upit .= " order by 2";
        }
        if($_POST["sortiranje"]=="IS"){
            $upit .= " order by 2 desc";
        }
        if($_POST["sortiranje"]=="KU"){
            $upit .= " order by 1";
        }
        if($_POST["sortiranje"]=="KS"){
            $upit .= " order by 1 desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="blokiranjeOtkljucavanjeKorisnika"){
        $korime = $_POST["korime"];
        $korprezime = $_POST["korprezime"];
        $upit = "select * from korisnik";
        if(isset($_POST["korime"]) && $_POST["korime"]!=""){
            $upit .= " where ime='$korime'";
        }
        if(isset($_POST["korprezime"]) && $_POST["korprezime"]!=""){
            $upit .= " where prezime='$korprezime'";
        }
        if($_POST["sortiranje"]=="PU"){
            $upit .= " order by datum_pristupa";
        }
        if($_POST["sortiranje"]=="PS"){
            $upit .= " order by datum_pristupa desc";
        }
        if($_POST["sortiranje"]=="ZU"){
            $upit .= " order by datum_zabrane";
        }
        if($_POST["sortiranje"]=="ZS"){
            $upit .= " order by datum_zabrane desc";
        }
        if($_POST["sortiranje"]=="SU"){
            $upit .= " order by status";
        }
        if($_POST["sortiranje"]=="SS"){
            $upit .= " order by status desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="blokirajKorisnika"){
        $korisnik = $_POST["korisnik"];
        $azuriraj = IUDUpit("update korisnik set status='B' where id_korisnik=$korisnik");
        ZapisiUpit("update korisnik");
    }

    if($opcija=="otkljucajKorisnika"){
        $korisnik = $_POST["korisnik"];
        $azuriraj = IUDUpit("update korisnik set status='A' where id_korisnik=$korisnik");
        ZapisiUpit("update korisnik");
    }

    if($opcija=="dohvatiKonfiguraciju"){
        KreirajJSON("select * from konfiguracija_sustava");
    }

    if($opcija=="dohvatiKorisnike"){
        KreirajJSON("select * from korisnik");
    }

    if($opcija=="dohvatiDnevnikRada"){
        $upit = "select k.ime, k.prezime, k.korisnicko_ime, t.naziv, d.zapis, d.datum, d.preglednik, d.adresa 
        from korisnik k, dnevnik d, tip_zapisa t 
        where d.id_korisnik=k.id_korisnik and t.id_tip_zapisa=d.id_tip_zapisa";
        if(isset($_POST["korime"]) && $_POST["korime"]!=""){
            $korime = $_POST["korime"];
            $upit .= " and k.korisnicko_ime='$korime'";
        }
        if(isset($_POST["tipZapisa"]) && $_POST["tipZapisa"]!=""){
            $tipZapisa = $_POST["tipZapisa"];
            $upit .= " and t.naziv='$tipZapisa'";
        }
        if(isset($_POST["datumOd"]) && $_POST["datumOd"]!=""){
            $datumOd = $_POST["datumOd"];
            $upit .= " and d.datum>='$datumOd'";
        }
        if(isset($_POST["datumDo"]) && $_POST["datumDo"]!=""){
            $datumDo = $_POST["datumDo"];
            $upit .= " and d.datum<='$datumDo'";
        }
        if($_POST["sortiranje"]=="U"){
            $upit .= " order by d.datum";
        }
        if($_POST["sortiranje"]=="S"){
            $upit .= " order by d.datum desc";
        }
        KreirajJSON($upit);
    }

    if($opcija=="korisnik"){
        KreirajJSON("select * from korisnik");
    }

    if($opcija=="tipKorisnika"){
        KreirajJSON("select * from tip_korisnika");
    }

    if($opcija=="aktivacijskiKodovi"){
        KreirajJSON("select * from aktivacijski_kodovi");
    }

    if($opcija=="dnevnik"){
        KreirajJSON("select * from dnevnik");
    }

    if($opcija=="tipZapisa"){
        KreirajJSON("select * from tip_zapisa");
    }

    if($opcija=="konfiguracijaSustava"){
        KreirajJSON("select * from konfiguracija_sustava");
    }

    if($opcija=="moderator"){
        KreirajJSON("select * from moderator");
    }

?>