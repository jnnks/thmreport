Das Package enthält eine LaTeX documentclass zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus. 

Als Vorlage wurdensowohl die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

<img src="https://i.ibb.co/r0BfRqy/titlepage.png" width="256"> <img src="https://i.ibb.co/vVbVT1d/chapterpage.png" width="256"> <img src="https://i.ibb.co/2n5nWMK/nonchapterpage.png" width="256"> <img src="https://i.ibb.co/4J9f5Cp/cite.png" width="256">



# Erste Schritte
## Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone git@github.com:jnnksdev/thmreport.git`

## Erstellung eines Berichts
Das Template ist ausgelegt mit minimalem Inhalt ein brauchbares Ergebnis zu produzieren. Alle Parameter sind optional oder haben Standardwerte.

```
\documentclass{thmreport}

\begin{document}

    Inhalt des Berichts

\end{document}
```

# Features
Das Template existiert, um die Erstellung des Berichts einfacher zu gestalten. Viele Kleinigkeiten, die per Hand gemacht werden müssten, sind eingerichtet.

## Maße
Die vorgegebenen Abstände entsprechen den offiziellen Vorgaben der THM/StdPlus. Falls keine genauen Vorgaben gemacht werden, wurde das Dokument "Richtlinie Wissenschaftliches Arbeiten" selbst als Vorlage verwendet.
Das ist beispielsweise bei dem Abstand der Seitenzahl zum oberen und rechten Papierrand der Fall.

## Literaturverzeichnis
Zum Einsatz kommt biber/bibatex. Das ist ein Paket, welches in allen mordernen Tex Installationen vorhanden ist, bzw. installiert werden kann. 
Das Literaturverzeichnis wird nach Vorgabe am Ende des Dokumentes eingefügt und Zitate werden mit Verweiß auf eine Fußnote erstellt.

## Zitieren
Für einfaches zitieren gibt es zwei commands, die das erstellen einer Fußnote und den Eintrag in das Literaturverzeichnis übernehmen.

### Direktes Zitat
Anweisung: `\dircite{schluessel}{[info]}`
Parameter: `schluessel`: Schlüssel der Quelle
           `info`      : Information zum Zitat, z.B. "(S. 69)"

Erzeugt ein hochgestellten Index an der eingefügten Stelle mit einer Fußnote, die Autor Titel und [Info] enthält.


### Indirektes Zitat
Anweisung: `\indircite{schluessel}{[info]}`
Parameter: `schluessel`: Schlüssel der Quelle
           `info`      : Information zum Zitat, z.B. "(S. 69)"

Erzeugt ein hochgestellten Index an der eingefügten Stelle mit einer Fußnote, die Autor Titel und [Info] enthält, allerdings wird ein "Vgl." oder im englischen "See" vorangestellt.

# Anspassung und Erweiterung
## Paramter der documentclass
`abstractpath`[Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text des Abstrakts enthält.

`conficlausepath` [Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text der Vertraulichkeitsklausel

`bibpath`[Zeichenkette]: relativer Pfad zu einer .bib Datei, die die Definitionen des Literaturverzeichnisses enthält.

`lang`["en", "de"]: gibt an, ob der Bericht in Englisch oder Deutsch verfasst ist.

`type`["thesis", "report"]: gibt an, ob der Bericht ein Praxisphasenbericht oder eine Thesis ist.

`hasfigures`: gibt an, ob eine Liste der Abbildungen eingefügt werden soll
`hastables`: gibt an, ob eine Liste der Tabellen eingefügt werden soll
`haslistings`: gibt an, ob eine Liste der Listings eingefügt werden soll


## Änderung der Meta-Daten
Die documentclass enthält Variablen, die nicht als Parameter repräsentiert sind. Dafür werden commands verwendet, die sich wie globale Variablen verhalten.

Werte wie Titel, Autor und Name der Firma müssen vorgegeben werden. Best Practise ist eine zusätzliche Datei einzuführen, die alle Meta-Daten enthält und diese in der Preambel mit `\include{path}` einzufügen.

Die Standart Werte der Meta-Daten sind die Namen der commands, die sie repräsentieren. Der Title des Dokuments ist mit dem command `\title` definiert und kann durch `\def{\title}{Mein Titel}` angepasst werden.

Hier ist eine Beispiel Implementation einer Meta-Daten Datei:
```
\def\title{Dokumenterstellung mit LaTeX}
\def\subtitle{Abwägung von Vor- und Nachteilen eines logischen Markups}

\def\student{Max Mustermann}
\def\studentStrasse{Musterstraße 3}
\def\studentOrt{Wetzlar}
\def\matnr{133742069}

\def\betreuer{Herr Betreuer}
\def\professor{Prof. Hochschule}

\def\firma{MusterFirma GmbH}
\def\firmaOrt{Wetzlar}

\def\abgabedat{01.01.2020}
```

# Eingebundene Packages
Auch wenn die documentclass minimalistisch gestaltet ist, sind einige packages nötig, um die Funktionalität bereitzustellen.

* ifthen
    logische Algebra zum abfragen von Werten und ausführen von ensprechenden Anweisungen
* xkeyval
    Sammlung von key-value Paaren zum Setzen von Parametern

* setspace
    Der zeilenabstand wird damit verändert.

* helvet 
    Helvetica Font (sehr ähnlich zu Arial)

* etoolbox
    Enthält `\AfterEndPreamble`, wird verwendet um Titelseite, Inhaltsangabe, etc. am Anfang des Dokuments einzufügen.

* biblatex
    Erstellung und Management der Bibliographie 
