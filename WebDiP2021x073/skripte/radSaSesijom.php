<?php

    function TrajanjeSesije(){
        $trajanje = SelectUpit("select trajanje_sesija from konfiguracija_sustava where id_konfiguracija_sustava=1");
        $trajanje = mysqli_fetch_array($trajanje);
        $trajanje = $trajanje[0];
        return $trajanje;
    }

    function DohvatiSesiju(){
        if(session_status()==1)session_start();
        if(isset($_SESSION["aktivniKorisnik"]))
            return $_SESSION["aktivniKorisnik"];
        return false;
    }

    function KorisnikPrijavljen(){
        if(session_status()==1)session_start();
        if(isset($_SESSION["aktivniKorisnik"]))
            return true;
        return false;
    }

    function KorisnikOsvjezioStranicu(){
        $korisnik = DohvatiSesiju();
		if($korisnik!=false){
			$korisnik->postaviZadnjeOsvjezavanje(VrijemePomak(DatumVrijemeBaza));
		}
    }

    function DohvatiIDKorisnika(){
        $korisnik = DohvatiSesiju();
        if($korisnik!=false){
            return $korisnik->DohvatiId();
        }
        return -1;
    }

    function SesijaIstekla(){
        $trajanjeSesije = TrajanjeSesije()*60*60;
        $korisnik = DohvatiSesiju();
        if($korisnik!=false){
            $zadnjeOsvjezavanje = strtotime($korisnik->dohvatiZadnjeOsvjezavanje());
            $trenutnoVrijeme = strtotime(VrijemePomak(DatumVrijemeBaza));
            if($trenutnoVrijeme-$zadnjeOsvjezavanje>$trajanjeSesije){
                return true;
            }
        }
        return false;
    }

    function TrenutnaUlogaKorisnika(){
        if(KorisnikPrijavljen()){
            $korisnik = DohvatiSesiju();
            return $korisnik->dohvatiTrenutnuUlogu();
        }  
        else return 1;
    }

    function KorijenskaUlogaKorisnika(){
        if(KorisnikPrijavljen()){
            $korisnik = DohvatiSesiju();
            return $korisnik->dohvatiUlogu();
        }  
        else return 1;
    }

    function ImaPristup($trazenaUloga){
        if(TrenutnaUlogaKorisnika()<$trazenaUloga){
            return false;
        }
        return true;
    }

?>