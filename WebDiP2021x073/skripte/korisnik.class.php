<?php

    class Korisnik{

        private $id;
        private $korime;
        private $ime;
        private $prezime;
        private $email;
        private $uloga;
        private $trenutnaUloga;
        private $vrijemePrijave;
        private $zadnjeOsvjezavanje;
        private $adresa;

        public function __construct(){
        }

        public function postaviPodatke($pid, $pkorime, $pime, $pprezime, $pemail, $puloga, $pvrijemePrijave){
            $this->id = $pid;
            $this->korime = $pkorime;
            $this->ime = $pime;
            $this->prezime = $pprezime;
            $this->email = $pemail;
            $this->uloga = $puloga;
            $this->trenutnaUloga = $puloga;
            $this->vrijemePrijave = $pvrijemePrijave;
            $this->zadnjeOsvjezavanje = $pvrijemePrijave;
            $this->adresa = $_SERVER["REMOTE_ADDR"];
        }

        public function dohvatiId(){
            return $this->id;
        }

        public function dohvatiKorime(){
            return $this->korime;
        }

        public function dohvatiIme(){
            return $this->ime;
        }

        public function dohvatiPrezime(){
            return $this->prezime;
        }

        public function dohvatiEmail(){
            return $this->email;
        }

        public function dohvatiUlogu(){
            return $this->uloga;
        }

        public function dohvatiVrijemePrijave(){
            return $this->vrijemePrijave;
        }

        public function dohvatiAdresu(){
            return $this->adresa;
        }

        public function dohvatiTrenutnuUlogu(){
            return $this->trenutnaUloga;
        }

        public function promijeniUlogu($puloga){
            if($this->uloga>=$puloga){
                $this->trenutnaUloga = $puloga;
            }
        }

        public function postaviZadnjeOsvjezavanje($pvrijeme){
            $this->zadnjeOsvjezavanje = $pvrijeme;
        }

        public function dohvatiZadnjeOsvjezavanje(){
            return $this->zadnjeOsvjezavanje;
        }

    }

?>