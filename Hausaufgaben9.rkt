#lang swindle
(require swindle/setf
         swindle/misc)

(defclass* Schluessel ()
  (schluessel :accessor schl :initarg :schlu
              )
  :printer #t)

(defclass* Autor ()
  (autor :accessor aut :initarg :auto)
  :printer #t)

(defclass* Erscheinungsjahr ()
  (erscheinungsjahr :accessor erschJ :initarg :jahr)
  :printer #t)

(defclass Titel ()
  (titel :accessor tit :initarg :titel)
  :printer #t)

(defclass* Literatur (Schluessel Autor Erscheinungsjahr Titel)
  (items
   :schluessel
   :autor
   :erscheinungsjahr
   :titel )
  :printer #t)