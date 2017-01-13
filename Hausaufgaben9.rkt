#lang swindle
(require swindle/setf
         swindle/misc)

(defclass* Literatur ()
  (autoren
   :reader autoren
   :initarg :aut
   :type <list>)
  (jahr
   :reader jahr
   :initarg :jr
   :type <integer>)
  (titel
   :reader titel
   :initarg :tl
   :type <string>)
  (schluessel
   :initarg :schluessel
   :reader schluessel
   :type <integer>
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