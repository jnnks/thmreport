% 
% Klasse für THM Berichte
% Formatvorgaben von Okt 2019
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thmreport}[2019/10/01 THM Praxisphasenbericht/Thesis]
\LoadClass{report}

\RequirePackage{ifthen}
\RequirePackage{cmds}


% ---Parameter verarbeiten
\RequirePackage{xkeyval}
% --- Parameter: bibpath ---
\define@key{thmreport.cls}{bibpath}[{}]{
  \def\bibpath{#1}
}
\ExecuteOptionsX{bibpath}


% --- Parameter: abstractpath ---
\def\abstractpath{}
\define@key{thmreport.cls}{abstractpath}[{}]{
  \def\abstractpath{#1}
}
\ExecuteOptionsX{abstractpath}


% --- Parameter: conficlausepath ---
\def\conficlausepath{}
\define@key{thmreport.cls}{conficlausepath}[{}]{
  \def\conficlausepath{#1}
}
\ExecuteOptionsX{conficlausepath}


% --- Parameter: lang ---
\def\reportlang{de}
\define@key{thmreport.cls}{lang}[{}]{
  \def\reportlang{#1}
}
\ExecuteOptionsX{lang}


\ProcessOptionsX


% Zeilenabstand 1.5-fach
\RequirePackage{setspace}
\onehalfspacing

% Schriftart
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage[utf8]{inputenc}

\ifthenelse{\equal{\reportlang}{de}}{
  % deutsch als Sprache angeben
  \RequirePackage[ngerman]{babel}
} {
  \RequirePackage[english]{babel}
}



% ausgelagerte Pakete
\RequirePackage{reportmetadata}
\RequirePackage{confidentialityclause}
\RequirePackage{thmpagestyles}
\RequirePackage{thmtitlepage}


\AtBeginDocument{
  \maketitle

  \ifnotnull{\conficlausepath}{
    \chapter*{Confidentiality Clause}
    \input{\conficlausepath}
  }

  \ifnotnull{\abstractpath}{
    \chapter*{Abstrakt}
    \input{\abstractpath}
  }

  \pagenumbering{Roman}
  \pagestyle{empty}
  \clearpage

  \tableofcontents
  
  \pagestyle{main}

  % leeres Kapitel
  % ohne aktuelles Kapitel kann 
  \chapter*{}
}

% important: AtEndDocument needs to be defined, before biblatex is imported
% see https://tex.stackexchange.com/questions/371814
\AtEndDocument{
  \ifnotnull{\bibpath}{
    \printbibliography
  }
}

% import csquotes and biblatex
\RequirePackage{csquotes}

% Literaturverzeichnis anhängen, falls vorhanden
\ifnotnull{\bibpath}{
  \RequirePackage[backend=biber]{biblatex}
  \addbibresource{\bibpath}
}