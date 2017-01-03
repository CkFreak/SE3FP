#lang racket
#|Aufgabe 1.1
Eine Funktion in Racket ist dann eine Funktion höherer Ordnung, wenn sie eine Funktion als Variable entgegennehmen oder als Rückgabewert haben. 

Aufgabe 1.2
a) foldr
Hierbei handelt es sich um eine Funktion Höherer Ordnung. foldr nimmt eine Zwei Parametrige Funktion als input und einen Basiswert.
Die Funktion wird dann auf eine Liste mit Werten angewandt.

b) (plus-oder-minus x)
Diese Funktion gibt aus, ob der eingegebene Wert x positiv oder negativ ist.
Es wird keine Funktion engegegengenommen oder zurückgegeben. Also handlet es sich hierbei nicht um eine Funktion Höherer Ordnung.

c) (masala f arg1)
Diese Funktion wendet die Funktion f auf den Basiswert arg1 an. arg2 ist innerhalb der Funktion definiert und muss für das Lambda mit übergeben werden.
Es handelt sich in sofern um eine Funktion Höherer Ordnung, als das f übergeben wird. Es gibt nur dann eine Funktion als Ausgabe, wenn f
auch eine Funktion ausgibt.

d) (flip f)
Diese Funktion dreht die Eingaben für f um und ruft f dann mit den gedrehten Eingaben auf. Es handlet sich um eine Funktion höhrerer Ordnug,
da f als Varibale übergeben wird. Die Ausgabe hängt von der Übergebenen Funktion f ab.

Aufgabe 1.3

ICH HABE LEIDER KEINEN PLAN, WAS DIE HIER WOLLEN!!!!
|#