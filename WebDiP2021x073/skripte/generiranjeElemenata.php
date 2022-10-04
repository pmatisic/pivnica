<?php

    function generirajLinkNavigacije($tekst, $link){
        echo '<li><a href="' . $link . '">' . $tekst . '</a></li>';
    }

    function generirajNavigacijuGost(){
        if(basename($_SERVER["SCRIPT_FILENAME"])=="ispisKorisnika.php"){
            echo "<ul>";
            generirajLinkNavigacije("Početna", "../index.php");
            generirajLinkNavigacije("O Autoru", "../oAutoru.php");
            generirajLinkNavigacije("Dokumentacija", "../dokumentacija.php");
            generirajLinkNavigacije("Prijava", "../prijava.php");
            generirajLinkNavigacije("Registracija", "../registracija.php");
            generirajLinkNavigacije("Rang lista", "../rangLista.php");
            generirajLinkNavigacije("Galerija slika", "../galerijaSlika.php");
            echo "</ul>";
        }
        else{
            echo "<ul>";
            generirajLinkNavigacije("Početna", "index.php");
            generirajLinkNavigacije("O Autoru", "oAutoru.php");
            generirajLinkNavigacije("Dokumentacija", "dokumentacija.php");
            generirajLinkNavigacije("Prijava", "prijava.php");
            generirajLinkNavigacije("Registracija", "registracija.php");
            generirajLinkNavigacije("Rang lista korisnika", "rangLista.php");
            generirajLinkNavigacije("Galerija slika", "galerijaSlika.php");
            echo "</ul>";
        }
    }

    function generirajNavigacijuRegistrirani(){
        echo "<ul>";
        generirajLinkNavigacije("Početna", "index.php");
        generirajLinkNavigacije("Statistika novosti", "statistikaNovosti.php");
        echo "</ul>";
    }

    function generirajNavigacijuModerator(){
        echo "<ul>";
        generirajLinkNavigacije("Početna", "index.php");
        generirajLinkNavigacije("Pivo", "pivo.php");
        generirajLinkNavigacije("Zemlje porijekla piva", "pivoZemljaPorijekla.php");
        generirajLinkNavigacije("Statistika narudžbi", "statistikaNarudzbi.php");
        echo "</ul>";
    }

    function generirajNavigacijuAdministrator(){
        echo "<ul>";
        generirajLinkNavigacije("Početna", "index.php");
        generirajLinkNavigacije("Pivnica", "pivnica.php");
        generirajLinkNavigacije("Moderatori pivnica", "moderatoriPivnica.php");
        generirajLinkNavigacije("Zemlje porijekla", "zemljaPorijekla.php");
        generirajLinkNavigacije("Blokiranje otključavanje", "blokiranjeOtkljucavanje.php");
        generirajLinkNavigacije("Konfiguracija sustava", "konfiguracijaSustava.php");
        generirajLinkNavigacije("Dnevnik rada", "dnevnikRada.php");
        //generirajLinkNavigacije("CRUD", "crud.php");
        echo "</ul>";
    }

    function generirajNavigaciju(){
        $uloga = TrenutnaUlogaKorisnika();
        if($uloga==Anonimni){
            generirajNavigacijuGost();
        }
        if($uloga==Registrirani){
            generirajNavigacijuRegistrirani();
        }
        if($uloga==Moderator){
            generirajNavigacijuModerator();
        }
        if($uloga==Administrator){
            generirajNavigacijuAdministrator();
        }
    }

    function generirajPromjenuUloge(){
        if(KorisnikPrijavljen()==true){
            $ispis = '<select id="uloga" name="uloga" class="prijava-zaglavlje" style="background-color: #C05351;">';
            $ispis .= '<option value="2"';
            if(TrenutnaUlogaKorisnika()==2){
                $ispis .= ' selected>Registrirani</option>';
            }
            else{
                $ispis .= '>Registrirani</option>';
            }
            if(KorijenskaUlogaKorisnika()>=3){
                $ispis .= '<option value="3"';
                if(TrenutnaUlogaKorisnika()==3){
                    $ispis .= ' selected>Moderator</option>';
                }
                else{
                    $ispis .= '>Moderator</option>';
                }
            }
            if(KorijenskaUlogaKorisnika()>=4){
                $ispis .= '<option value="4"';
                if(TrenutnaUlogaKorisnika()==4){
                    $ispis .= ' selected>Administrator</option>';
                }
                else{
                    $ispis .= '>Administrator</option>';
                }
            }
            $ispis .= '</select>';
            echo $ispis;
        }
    }

    function generirajMjestoOdjave(){
        if(KorisnikPrijavljen()==true){
            echo '<a href="odjava.php" class="prijava-zaglavlje">Odjava</a><br>';
        }
        else{
            echo '<a href="prijava.php" class="prijava-zaglavlje">Prijava</a><br>';
        }
    }

?>