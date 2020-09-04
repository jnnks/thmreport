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
\define@key{thmreport.cls}{bibpath}[{}]{ \def\bibpath{#1} }
\ExecuteOptionsX{bibpath}

% --- Parameter: abstractpath ---
\define@key{thmreport.cls}{abstractpath}[{}]{ \def\abstractpath{#1} }
\ExecuteOptionsX{abstractpath}

% --- Parameter: conficlausepath ---
\define@key{thmreport.cls}{conficlausepath}[{}]{ \def\conficlausepath{#1} }
\ExecuteOptionsX{conficlausepath}


% --- Parameter: lang ---
\define@key{thmreport.cls}{lang}[de]{ \def\reportlang{#1} }
\ExecuteOptionsX{lang}

% --- Parameter: type ---
\define@key{thmreport.cls}{type}[thesis]{ \def\reporttype{#1} }
\ExecuteOptionsX{type}
\ProcessOptionsX

\DeclareOption{hasfigures}{ \def\hasfigures{true} }
\DeclareOption{hastables}{ \def\hastables{true} }
\DeclareOption{haslistings}{ \def\haslistings{true} }
\ProcessOptions\relax



% falls "lang" == "de"
\ifthenelse{\equal{\reportlang}{de}}{
  % deutsche Begriffe verwenden
  \def\abstracttitle{Abstrakt}
  \def\conficlausetitle{Sperrvermerk}

  \def\indirciteVgl{Vgl.}
}{
  \def\abstracttitle{Abstract}
  \def\conficlausetitle{Confidentiality Clause}

  \def\indirciteVgl{See}
}

\ifthenelse{\equal{\reporttype}{thesis}}{
  % Dokument ist eine Thesis
  \def\reporttype{Bachelor-Thesis}
  \def\reportsubtype{zur Erlangung des Grades Bachelor of Science}
}{
  % Dokument ist ein Praxisphasenbericht    
  \def\reporttype{Praxisphasen-Bericht}
  \def\reportsubtype{}
}


% Zeilenabstand 1.5-fach
\RequirePackage{setspace}
\onehalfspacing

% Schriftart
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

% ausgelagerte Pakete
\RequirePackage{reportmetadata}
\RequirePackage{thmpagestyles}
\RequirePackage{thmtitlepage}

\RequirePackage{etoolbox}

\AfterEndPreamble{
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

  % Liste der Abbildungen anzeigen 
  \ifdefined\hasfigures \listoffigures \fi
  
  % Liste der Tabellen anzeigen 
  \ifdefined\hastables \listoftables \fi
  
  % Liste der Listings anzeigen 
  \ifdefined\haslistings \lstlistoflistings \fi
    
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


% Literaturverzeichnis anhängen, falls vorhanden
\ifnotnull{\bibpath}{  

  \usepackage[%
    backend=biber,%
    autocite=footnote,%
    style=authortitle-ibid]{biblatex}
  \addbibresource{\bibpath}

  % commands zum Zitieren
  % indirektes Zitat
  \newcommand{\indircite}[2]{\footnote{\indirciteVgl \cite{#1} #2}}
  % direktes Zitat
  \newcommand{\dircite}[2]{\footnote{\cite{#1} #2}}
}