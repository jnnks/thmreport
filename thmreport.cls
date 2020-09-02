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

  % falls "lang" == "de"
  \ifthenelse{\equal{#1}{de}}{
    % deutsche Begriffe verwenden
    \def\abstracttitle{Abstrakt}
    \def\conficlausetitle{Sperrvermerk}
  }{
    \def\abstracttitle{Abstract}
    \def\conficlausetitle{Confidentiality Clause}
  }
}
\ExecuteOptionsX{lang}


\def\reporttype{thesis}
\define@key{thmreport.cls}{type}[{}]{
  \def\reportlang{#1}

  \ifthenelse{\equal{#1}{thesis}}{
    % Dokument ist eine Thesis
    \def\reporttype{Bachelor-Thesis}
    \def\reportsubtype{zur Erlangung des Grades Bachelor of Science}
  }{
    % Dokument ist ein Praxisphasenbericht    
    \def\reporttype{Praxisphasen-Bericht}
    \def\reportsubtype{}
  }
}
\ExecuteOptionsX{type}


\ProcessOptionsX

% commands zum Zitieren
% indirektes Zitat
\newcommand{\indircite}[1]{\footnote{Vgl. \cite{#1}}}
% direktes Zitat
\newcommand{\dircite}[1]{\footnote{\cite{#1}}}
\newcommand{\dircitee}[2]{\footnote{\cite{#1} #2}}

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

  \pagenumbering{Roman}
  \setcounter{page}{2}
  \pagestyle{plain}

  \ifnotnull{\conficlausepath}{
    \chapter*{\conficlausetitle}
    \input{\conficlausepath}
  }

  \ifnotnull{\abstractpath}{
    \chapter*{\abstracttitle}
    \input{\abstractpath}
  }

  
  \tableofcontents
  \clearpage
  \pagenumbering{arabic}
  \pagestyle{main}
}

% important: AtEndDocument needs to be defined, before biblatex is imported
% see https://tex.stackexchange.com/questions/371814
\AtEndDocument{
  \pagestyle{empty}
  \ifnotnull{\bibpath}{
    \printbibliography
  }
}

% import csquotes and biblatex
\RequirePackage{csquotes}

% Literaturverzeichnis anhängen, falls vorhanden
\ifnotnull{\bibpath}{  
  \usepackage[%
    backend=biber,%
    autocite=footnote,%
    style=authortitle-ibid]{biblatex}
  \addbibresource{\bibpath}
}