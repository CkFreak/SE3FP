#lang swindle
(require swindle/setf
         swindle/misc)

(defclass* Literatur ()
  (items
   :schluessel
   :autor
   :erscheinungsjahr
   :titel )
  :printer #t)

(defclass* Schluessel ()
  (schluessel :accessor schl :initarg :schlu
              )
  :printer #t)

(defclass* Autor ()
  (autor :accessor aut :initarg :auto)
  :printer #t)

(defclass* Erscheinungsjahr ()
  (erscheinungsjahr :accessor erschJ :initvalue :jahr)
  :printer #t)

(defclass Titel ()
  (titel :accessor tit :initvalue :titel)
  :printer #t)