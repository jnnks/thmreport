Das Package enthält eine LaTeX documentclass zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus. 

Als Vorlage wurdensowohl die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

# Erste Schritte
## Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone git@github.com:jnnksdev/thmreport.git`

## Erstellung eines Berichts
Das Template ist ausgelegt mit minimalem Inhalt ein brauchbares Ergebnis zu produzieren. Alle Parameter sind optional oder haben Stadardwerte.

```
\documentclass{thmreport}

\begin{document}

    Inhalt des Berichts

\end{document}
```

# Features
Das Template existiert, um die Erstellung des Berichts einfacher zu gestalten. Viele Kleinigkeiten, die per Hand gemacht werden müssten, sind eingerichtet.

## Literaturverzeichnis
Zum Einsatz kommt biber/bibatex. Das ist ein Paket, welches in allen mordernen Tex Installationen vorhanden ist, bzw. installiert werden kann. 
Das Literaturverzeichnis wird nach Vorgabe am Ende des Dokumentes eingefügt und Zitate werden mit Verweiß auf eine Fußnote erstellt.

## Zitieren
Für einfaches zitieren gibt es zwei commands, die das erstellen einer Fußnote und den Eintrag in das Literaturverzeichnis übernehmen.

`\dircite{schluessel}`: direktes/wörtliches Zitat
`\indircite{schluessel}`: indirektes Zitat

`schluessel` ist hier ein beispielhafter Eintrag in dem Literaturverzeichnis.


# Anspassung und Erweiterung
## Paramter der documentclass
`abstractpath`[Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text des Abstrakts enthält.
`conficlausepath` [Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text der Vertraulichkeitsklausel
`bibpath`[Zeichenkette]: relativer Pfad zu einer .bib Datei, die die Definitionen des Literaturverzeichnisses enthält.
`lang`["en", "de"]: gibt an, ob der Bericht in Englisch oder Deutsch verfasst ist.
`type`["thesis", "report"]: gibt an, ob der Bericht ein Praxisphasenbericht oder eine Thesis ist.

## Änderung der Meta-Daten
Die documentclass enthält Variablen, die nicht als Parameter repräsentiert sind. Dafür werden commands verwendet, die sich wie globale Variablen verhalten.

Werte wie Titel, Autor und Name der Firma müssen vorgegeben werden. Best Practise ist eine zusätzliche Datei einzuführen, die alle Meta-Daten enthält und diese in der Preambel mit `\include{path}` einzufügen.

Die Standart Werte der Meta-Daten sind die Namen der commands, die sie repräsentieren. Der Title des Dokuments ist mit dem command `\title` definiert und kann durch `\renewcommand{\title}{Mein Titel}` angepasst werden.

Hier ist eine Beispiel Implementation einer Meta-Daten Datei:
```
\renewcommand{\bericht}{Bachelor-Thesis}
\renewcommand{\berichtZwei}{zur Erlangung des Grades Bachelor of Science}

\renewcommand{\title}{Dokumenterstellung mit LaTeX}
\renewcommand{\subtitle}{Abwägung von Vor- und Nachteilen eines logischen Markups}

\renewcommand{\student}{Max Mustermann}
\renewcommand{\studentStrasse}{Musterstraße 3}
\renewcommand{\studentOrt}{Wetzlar}
\renewcommand{\matnr}{133742069}

\renewcommand{\betreuer}{Herr Betreuer}
\renewcommand{\professor}{Prof. Hochschule}

\renewcommand{\firma}{MusterFirma GmbH}
\renewcommand{\firmaOrt}{Wetzlar}

\renewcommand{\abgabedat}{01.01.2020}
```