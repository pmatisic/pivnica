<?php

    function VrijemePomak($tip){
        $rezultat = SelectUpit("select * from konfiguracija_sustava");
        $rezultat = mysqli_fetch_array($rezultat);
        $pomak = $rezultat["pomak"];
        if($tip==PomakBaza){
            return $pomak;
        }
        if($tip==DatumVrijemeBaza){
            return date('Y-m-d H:i:s', (time()+$pomak*60*60));
        }
        if($tip==Datum){
            return date('Y-m-d', (time()+$pomak*60*60));
        }
        if($tip==Vrijeme){
            return date('H:i:s', (time()+$pomak*60*60));
        }
        if($tip==Sekunde){
            return time()+$pomak*60*60;
        }
    }

?>