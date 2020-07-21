% 
% Klasse für THM Berichte
% Formatvorgaben von Okt 2019
% 

\ProvidesClass{thmreport}[2019/10/01 THM Praxisphasenbericht/Thesis]
\LoadClass{report}

% Parameter verarbeiten
\RequirePackage{xkeyval}%

% define parameter
%   default value is empty -> no bib
\def\bibres{}
% -> if bibres not empty, execute first parameter
\newcommand{\ifhasbib}[1]{\ifthenelse{\equal{\bibres}{}}{}{#1}}
\define@key{thmreport.cls}{bibres}[{}]{
  \def\bibres{#1}
}

% define abstract text
\def\abstracttext{abstracttext}
\define@key{thmreport.cls}{abstracttext}[{}]{
  \def\abstracttext{#1}
}
 
\ExecuteOptionsX{bibres}
\ProcessOptionsX


% Zeilenabstand 1.5-fach
\RequirePackage{setspace}
\onehalfspacing

% font
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage[utf8]{inputenc}
\RequirePackage[german]{babel}


\RequirePackage{reportmetadata}
\RequirePackage{confidentialityclause}
\RequirePackage{thmpagestyles}
\RequirePackage{thmtitlepage}

% ----------
% ----------

% Namen von aktuellen Kapiteln, Abschnitt und Pragraphen
\let\Chaptermark\chaptermark
\def\chaptermark#1{\def\Chaptername{#1}\Chaptermark{#1}}
\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}
\let\Subsubsectionmark\subsubsectionmark
\def\subsubsectionmark#1{\def\Subsubsectionname{#1}\Subsubsectionmark{#1}}


\AtBeginDocument{
  \maketitle
  \confidentialityclause

  \chapter*{Abstrakt}
  \abstracttext
  \pagenumbering{Roman}
  \pagestyle{empty}
  \clearpage

  \tableofcontents
  
  \pagestyle{main}
}

% important: AtEndDocument needs to be defined, before biblatex is imported
% see https://tex.stackexchange.com/questions/371814
\AtEndDocument{
  \ifhasbib{\printbibliography}
}

% import csquotes and biblatex
\RequirePackage{csquotes}
\RequirePackage[backend=biber]{biblatex}
% add bibresource, if value is provided
\ifhasbib{\addbibresource{\bibres}}