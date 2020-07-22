# thmreport
Das Package enthält eine LaTeX documentclass zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus. 

Als Vorlage wurdensowohl die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

## Erste Schritte
### Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone git@github.com:jnnksdev/thmreport.git`

### Erstellung eines Berichts
Das Template ist ausgelegt mit minimalem Inhalt ein brauchbares Ergebnis zu produzieren. Alle Parameter sind optional oder haben Stadardwerte.

```
\documentclass{thmreport}

\begin{document}

    Inhalt des Berichts

\end{document}
```

## Anspassung und Erweiterung
### Paramter der documentclass
`abstractpath`[Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text des Abstrakts enthält.
`conficlausepath` [Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text der Vertraulichkeitsklausel
`bibpath`[Zeichenkette]: relativer Pfad zu einer .bib Datei, die die Definitionen des Literaturverzeichnisses enthält.
`lang`["en", "de"]: gibt an, ob der Bericht in Englisch oder Deutsch verfasst ist.
