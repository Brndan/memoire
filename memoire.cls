% Copyright © 2011 - 2016 Brendan Chabannes
% This work is licenced under the MIT licence

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memoire}[03/06/2011]

\LoadClass[oneside,12pt,a4paper]{report} 


%\RequirePackage{hyphenat}
% Contrôler par une option le choix de la césure
\newif\if@cesure\@cesurefalse
\DeclareOption{sanscesure}{\@cesuretrue}
\ProcessOptions\relax

\if@cesure
  \RequirePackage[none]{hyphenat}
  \sloppy
\fi


% Polices
\RequirePackage[no-math]{fontspec}
\RequirePackage{xltxtra}


% Le scaling sert à avoir une métrique plus proche d'Utopia.


%\newfontfamily\greekfont[ExternalLocation = {./Fontes/EB-Garamond/},
%Script=Greek, 
%Scale = 1.2,
%Extension= .otf,
%UprightFont = *-Regular ,
%BoldFont = *-Bold ,
%ItalicFont = *-Italic,
%Mapping=tex-text,
%Ligatures=Common,
%Numbers = Uppercase,
%Contextuals = NoAlternate,
%]
%{EBGaramond}

\newfontfamily\greekfont[ExternalLocation = {./Fontes/GFSDidotClassic/},
Script = Greek,
Extension= .otf,
Mapping=tex-text,
Ligatures=Common,
Scale = 1.10
]{GFSDidotClassic}

\newfontfamily\specialtxt[
Mapping=tex-text,
Ligatures=Common,
Scale = 1.12
]{Junicode}

%\setmainfont[
%Mapping=tex-text,
%Ligatures=Common,
%Scale = 1.19
%]{Junicode}

\setmainfont[ExternalLocation = {./Fontes/Utopia/},
Extension= .otf,
UprightFont = *-Regular ,
BoldFont = *-Bold ,
ItalicFont = *-Italic,
BoldItalicFont = *-BoldIt,
Mapping=tex-text,
Ligatures=Common,
Scale = 1.1
]{UtopiaStd}

%\setmainfont[ExternalLocation = {./Fontes/EB-Garamond/},
%Extension= .otf,
%UprightFont = *-Regular ,
%BoldFont = *-Bold ,
%ItalicFont = *-Italic,
%Mapping=tex-text,
%Ligatures={Common, Historic},
%Scale = 1.2,
%Numbers = Uppercase,
%Contextuals = NoAlternate,
%]{EBGaramond}

%\setmainfont[ExternalLocation = {./Fontes/AGaramondPro/},
%Extension= .otf,
%UprightFont = *-Regular ,
%BoldFont = *-Bold ,
%ItalicFont = *-Italic,
%Mapping=tex-text,
%Ligatures=Common,
%Scale = 1.2,
%Numbers = Uppercase,
%Contextuals = Alternate
%]{AGaramondPro}

% Interligne 1.5 par défaut pour tout le document
\RequirePackage{setspace}
\onehalfspacing

% Notes de bas de page continues
\RequirePackage{chngcntr}
\counterwithout{footnote}{chapter}

% Pas de no de page sur les pages de partie.
\RequirePackage{nonumonpart} 

% Package verse pour indiquer les numéros de ligne
%\RequirePackage{verse}


\RequirePackage{polyglossia}
\setmainlanguage{french}
%\setotherlanguage{latin}
\setotherlanguage{english}
\setotherlanguage[variant=ancient]{greek}

% Guillemets français
\RequirePackage{csquotes}

% Texte en exposant.
\providecommand{\up}[1]{\textsuperscript{#1}}

%% Commandes premier, deuxième…

\providecommand{\ier}{\textsuperscript{er}}
\providecommand{\iers}{\textsuperscript{ers}}
\providecommand{\iere}{\textsuperscript{ère}}
\providecommand{\ieres}{\textsuperscript{ères}}
\providecommand{\ieme}{\textsuperscript{e}}
\providecommand{\iemes}{\textsuperscript{es}}
\providecommand{\nd}{\textsuperscript{nd}}
\providecommand{\nds}{\textsuperscript{nds}}
\providecommand{\nde}{\textsuperscript{nde}}
\providecommand{\ndes}{\textsuperscript{ndes}}
\providecommand{\no}{\textsuperscript{o}}
\providecommand{\nos}{\textsuperscript{os}}

\providecommand{\mme}{M\textsuperscript{me}\space}
\providecommand{\mmes}{M\textsuperscript{mes}\space}
\providecommand{\mr}{M.\space}
\providecommand{\mrs}{MM.\space}


% Bonnes notes, sans exposant.
\makeatletter
\renewcommand\@makefntext[1]{%
  \noindent\makebox[2em][r]{\@thefnmark.\space}#1}
\makeatother

% Changer l'apparence des titres (de chapitre, de section…)
\RequirePackage{titlesec}

% On utilise biblatex et ses belles possibilités pour la biblio, plus biber (Texlive 2011+)
\RequirePackage[backend=biber,hyperref,style=verbose-trad2,useauthor=true, useeditor=false]{biblatex}

% On met tout en noir, sans quoi ça déstabilise le quidam
\RequirePackage[hyperindex=true, colorlinks=true, linkcolor=black, citecolor=black, filecolor=black, urlcolor=black, bookmarks=true,hypertexnames=false]{hyperref}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%        Bibliographie
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Redéfinir les mots-clefs pour la biblio, et ajouter un "art. cit."
% Explication : si entrytype = article, alors op. cit → art. cit.
% Sinon, si entrytype = inproceedings, alors 

% Structure canonique :
 %\iffieldequalstr{entrytype}{article/book/whatever}{Exécute si vrai}{Exécute si faux}

\DefineBibliographyStrings{french}{
opcit = \iffieldequalstr{entrytype}{article}{art\adddotspace cit\adddot}{%
\iffieldequalstr{entrytype}{inproceedings}{art\adddotspace cit\adddot}{\iffieldequalstr{entrytype}{incollection}{art\adddotspace cit\adddot}{\emph{op\adddotspace cit}\adddot}}},
idem = {\emph{idem}},
ibidem = {\emph{Ibid\adddot}},
byeditor = {\'ed\adddotspace \smartof{} },
in = {}%
}

%\DefineBibliographyStrings{french}{
%opcit = \iffieldequalstr{entrytype}{article}{art\adddotspace cit\adddot}{%
%\iffieldequalstr{entrytype}{inproceedings}{art\adddotspace cit\adddot}{\emph{op\adddotspace cit}\adddot}},
%idem = {\emph{idem}},
%ibidem = {\emph{Ibid\adddot}},
%byeditor = {\'ed\adddotspace \smartof{} },
%in = {}%
%}

%\DefineBibliographyStrings{french}{
%opcit = \iffieldequalstr{entrytype}{inproceedings}{art\adddotspace cit\adddot}{\emph{op\adddotspace cit}\adddot},
%idem = {\emph{idem}},
%ibidem = {\emph{ibid\adddot}},
%byeditor = {\'ed\adddotspace \smartof{} },
%in = {}%
%}

% Virgules au lieu de points dans la biblio.
\renewcommand*{\newunitpunct}{\addcomma\space}

%%% Tripoter le style standard pour avoir une virgule au lieu de deux points avant la date.
\renewbibmacro*{publisher+location+date}{%
\printlist{location}%
\iflistundef{publisher}
{\setunit*{\addspace}}
{\setunit*{\addcomma\space}}%
\printlist{publisher}%
\setunit*{\addcomma\space}%
\printfield{year}%
\newunit
} 

%% Obtenir l'année de publication d'un article de périodique entre virgules sans parenthèses.
  \renewbibmacro*{issue+date}{%
    \printfield{issue}
    \addcomma\space%
    \printfield{year}
  }%


%% Il est possible de redéfinir des sections dans la biblio 
% Exemple :
%\providecommand{bibheading{corpus}{\subsection*{-A- Textes du corpus}}

%%%%%%% Fin Bibliographie


% Pour faire des titres à l'apparence plus convenable.
\renewcommand\thechapter{\Roman{chapter}}
\titleformat{\chapter}[hang]{\bf\huge}{\thechapter}{2pc}{} 

\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{- \Alph{section} -}
\renewcommand\thesubsection{\arabic{subsection}.}
\renewcommand\thesubsubsection{\alph{subsubsection}}


%%%% Vers. Usage :
% \begin{vers}[optionnel:incrément]{obligatoire:lignedébut}
% blabla
% \end{vers}

\newenvironment{vers}[2][2]{%
\begin{minipage}{11cm}%
\begin{verse}%
\small%
\poemlines{#1}%
\setverselinenums{#2}{0}}{\end{verse}\end{minipage}}


\let\oldverse=\verse
\let\oldendverse=\endverse
\renewenvironment{verse}
   {\singlespacing\oldverse}
   {\oldendverse}

%%%% Citations avec interligne simple
% Copyright (C) 2002 Mike Nolta <mrnolta@princeton.edu>, GPL V. 2.0 and
% later version. http://www.physics.princeton.edu/cosmology/computing/PrincetonThesis.cls


\let\oldquotation=\quotation
\let\oldendquotation=\endquotation
\renewenvironment{quotation}
   {\singlespacing\oldquotation}
   {\oldendquotation}

\let\oldquote=\quote
\let\oldendquote=\endquote
\renewenvironment{quote}
   {\singlespacing\oldquote}
   {\oldendquote}
%%%%%%

