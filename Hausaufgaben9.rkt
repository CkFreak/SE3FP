#lang swindle
(require swindle/setf
         swindle/misc)
#|Aufgabe 1.1 Definition von Klassen|#
(defclass* Literatur ()
  (autoren
   :reader autore
   :initarg :aut
   :type <list>)
  (jahr
   :reader jah
   :initarg :jr
   :type <string>)
  (titel
   :reader titel
   :initarg :tl
   :type <string>)
  (schluessel
   :initarg :schluesse
   :reader schluessel
   :type <string>
   )
  :printer #t)

(defclass* Buch (Literatur)
  (verlag
   :reader verla
   :initarg :verl
   :type <string>)
  
  (verlagsort
   :reader verlort
   :initarg :ort
   :type <string>)
  
  
  (reihe
   :reader reih
   :initarg :rh
   :type <string>)
  
  
  (serienummer
   :reader seriennr
   :initarg :snr
   :type <string>)
  :printer #t)

(defclass* Sammelband (Buch)
  (nameHerausgeber
   :reader nameHerausgeb
   :initarg :nmeHerausg
   :type <string>)
  
  (seitenangaben
   :reader seitenang
   :initarg :seiten
   :type <string>)
  :printer #t)

(defclass* Zeitschriftenartikel (Literatur)
  (nameZeitschrift
   :reader nameZeitsch
   :initarg :nmeZeitschr
   :type  <string>)
  
  (nummerBand
   :reader nummerB
   :initarg :numrBa
   :type <string>)
  
  (nummerHeft
   :reader nummerHe
   :initarg :nmrHeft
   :type <string>)
  
  (erscheinungsmonat
   :reader erscheinungsmon
   :initarg :erschMon
   :type <string>)
  :printer #t)


(define Nessie1790 (make Buch
                         :verl "Minority Report"
                         :aut '("Nessi")
                         :jr "1790"
                         :tl "Mein Leben im Lochness: Verfolgung als Ungeheuer"
                         :id "Nessie1790"
                         :ort "Inverness"
                         :rh "Die Besondere Biographie"
                         :snr "2"))

(define Prefect1979 (make Sammelband
      :id "Prefect1979"
      :verl "Galactic Press"
      :aut '("Prefect, F.")
      :rh "Travel in Style"
      :jr "1979"
      :snr "5"
      :tl "Mostly harmless - some observations concerning the third planet of the solar sytem"
      :ort "Vega-System, 3rd planet"
      :s "420"
      :hgb "Adams, D., editor, The Hitchhiker's Guide to the Galaxy"))

(define Wells3200 (make Zeitschriftenartikel
      :id "Wells3200"
      :aut '("Wells, H. G.")
      :jr "3200"
      :tl "Zeitmaschinen leicht gemacht"
      :zt "Heimwerkerpraxis für Anfänger"
      :hnr "550"
:bnr "3"))


#|Aufgabe 1.2 Generische Funktionen und Methoden|#

(defgeneric* cite ((li Literatur))
  :combination generic-append-combination)

(defmethod cite ((li Buch))
  0)