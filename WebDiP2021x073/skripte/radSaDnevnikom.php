<?php

    function DohvatiPreglednik(){
        $u_agent = $_SERVER['HTTP_USER_AGENT'];
        $preglednik = 'Nepoznat';
        $sustav = 'Nepoznat';

        if (preg_match('/linux/i', $u_agent)){
            $sustav = 'Linux';
        }
        elseif (preg_match('/macintosh|mac os x/i', $u_agent)){
            $sustav = 'Mac';
        }
        elseif (preg_match('/windows|win32/i', $u_agent)){
            $sustav = 'Windows';
        }
        if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent)){
            $preglednik = 'Internet Explorer';
        }
        elseif(preg_match('/Firefox/i',$u_agent)){
            $preglednik = 'Mozilla Firefox';
        }
        elseif(preg_match('/Chrome/i',$u_agent)){
            $preglednik = 'Google Chrome';
        }
        elseif(preg_match('/Safari/i',$u_agent)){
            $preglednik = 'Apple Safari';
        }
        elseif(preg_match('/Opera/i',$u_agent)){
            $preglednik = 'Opera';
        }
        elseif(preg_match('/Netscape/i',$u_agent)){
            $preglednik = 'Netscape';
        }
        return "$sustav $preglednik";
    }

    function ZapisiUBazu($korisnikId, $tipZapisa, $zapis){
        $datum = VrijemePomak(DatumVrijemeBaza);
        $preglednik = DohvatiPreglednik();
        $adresa = $_SERVER["REMOTE_ADDR"];
        $rezultat = IUDUpit("insert into dnevnik values (default, $korisnikId, $tipZapisa, '$zapis', '$datum', '$preglednik', '$adresa')");
    }

    function ZapisiPrijavu(){
        $korisnikId = DohvatiIDKorisnika();
        if($korisnikId!=-1){
            ZapisiUBazu($korisnikId, Prijava, basename($_SERVER['PHP_SELF']));
        }
    }

    function ZapisiOdjavu(){
        $korisnikId = DohvatiIDKorisnika();
        if($korisnikId!=-1){
            ZapisiUBazu($korisnikId, Odjava, basename($_SERVER['PHP_SELF']));
        }
    }

    function ZapisiUpit($upit){
        $korisnikId = DohvatiIDKorisnika();
        if($korisnikId!=-1){
            ZapisiUBazu($korisnikId, Upit, $upit);
        }
    }

    function ZapisiPosjetu(){
        $korisnikId = DohvatiIDKorisnika();
        if($korisnikId!=-1){
            ZapisiUBazu($korisnikId, Posjeta, basename($_SERVER['PHP_SELF']));
        }
    }

    function ZapisiZakljucavanje($id){
        ZapisiUBazu($id, Zakljucavanje, basename($_SERVER['PHP_SELF']));
    }

    function ZapisiSlanjeLozinke($id){
        ZapisiUBazu($id, SlanjeLozinke, basename($_SERVER['PHP_SELF']));
    }

    function ZapisiAktivaciju($id){
        ZapisiUBazu($id, Aktivacija, basename($_SERVER['PHP_SELF']));
    }

?>