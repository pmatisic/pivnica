<?php

    require("baza.class.php");

    function SelectUpit($upit){
        $veza = new Baza();
        $veza->spojiDB();
        $rezultat = $veza->selectDB($upit);
        $veza->zatvoriDB();
        return $rezultat;
    }

    function IUDUpit($upit){
        $veza = new Baza();
        $veza->spojiDB();
        $rezultat = $veza->updateDB($upit);
        $veza->zatvoriDB();
        return $rezultat;
    }

?>