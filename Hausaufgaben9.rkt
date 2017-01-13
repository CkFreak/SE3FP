#lang swindle
(require swindle/setf
         swindle/misc)
#|Aufgabe 1.1 Definition von Klassen|#
(defclass* Literatur ()
  (autoren
   :reader autoren
   :initarg :aut
   :type <list>)
  (jahr
   :reader jahr
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
   :reader verlag
   :initarg :verl
   :type <string>)
  
  (verlagsort
   :reader ort
   :initarg :ort
   :type <string>)
  
  
  (reihe
   :reader reihe
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


(define Nessie (make Buch
                         :verl "Minority-Verlag"
                         :aut '("Nessi")
                         :jr "1790"
                         :tl "Mein Leben im Lochness: Verfolgung als Ungeheuer"
                         :id "Nessie1790"
                         :ort "Inverness"
                         :rh "Die Besondere Biographie"
                         :snr "2"))

(define Prefect (make Sammelband
                          :id "Prefect1979"
                          :verl "Galactic Press"
                          :aut '("Prefect, F.")
                          :rh "Travel in Style"
                          :jr "1979"
                          :snr "5"
                          :tl "Mostly harmless - some observations concerning the third planet of the solar sytem"
                          :ort "Vega-System, 3rd planet"
                          :seiten "500"
                          :nmeHerausg "Adams, D., editor, The Hitchhiker's Guide to the Galaxy"))

(define Wells (make Zeitschriftenartikel
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
  (string-append (car (autoren li))
                 "("(jahr li) "). "
                 (titel li) ", Band "
                 (seriennr li) " aus der Reihe "
                 (reihe li) ". "
                 (verlag li) ", "
                 (ort li)
                 ))

(defmethod cite ((li Sammelband))
  (string-append (car (autoren li))
                 " (" (jahr li) "). "
                 (titel li) ". In "
                 (nameHerausgeb li)
                 "volume " (seriennr li) " of \""
                 (reihe li) "\"."
                 (verlag li) ", "
                 (ort li) ", 1500 edition, p. " (seitenang li)))

(cite Nessie)
(cite Prefect)