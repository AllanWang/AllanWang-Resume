%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Changelog
%
% v1.1
% * Added \stats function
% 
% v1.0
% * Initial release
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Intro Options
\ProvidesClass{allanwang-resume}[2017/09/28 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Variable Declarations
% Do the branching between * and normal version
\newcommand{\DeclareAuthorVariable}{%
	\@ifstar{\ting@DeclareAuthorVariable{\ting@mandatory@var}}
	{\ting@DeclareAuthorVariable{\ting@optional@var}}%
}

% The main command; the internal version of \foo is \ting@foo
% The macro \ting@foo is initialized to give an error or an info
% message when used, so if the user doesn't provide a value for a
% mandatory variable, we'll catch the issue
\newcommand{\ting@DeclareAuthorVariable}[2]{%
\@namedef{ting@#2}{#1{#2}}%
\@namedef{#2}##1{\@namedef{ting@#2}{##1}}%
}
% The error and info messages
\newcommand{\ting@mandatory@var}[1]{%
	\ClassError{ting}
	{Missing value for mandatory variable
		\expandafter\string\csname#1\endcsname}
	{You have to provide a value with
		\expandafter\string\csname#1\endcsname{...}}%
}
\newcommand{\ting@optional@var}[1]{%
	\ClassInfo{ting}
	{Missing value for optional variable
		\expandafter\string\csname#1\endcsname}%
}

\DeclareAuthorVariable*{firstname}
\DeclareAuthorVariable*{lastname}

\DeclareAuthorVariable*{github}
\DeclareAuthorVariable*{email}
\DeclareAuthorVariable*{website}
\DeclareAuthorVariable*{phone}

\usepackage{array,keycommand}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry}
\usepackage[hidelinks]{hyperref}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{666666}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}
\definecolor{accent}{HTML}{224d93}

% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}

% Font Awesome
\usepackage{fontawesome}

% Date command
\usepackage[absolute]{textpos}
\usepackage[USenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
		\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont
		Last Updated on \today
	\end{textblock}}

% Name command
\newcommand{\namesection}[2]{
	\fontsize{40pt}{60pt}
	\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont #1
	\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
}

\newcommand{\headertable}[4]{
	\fontspec[Path = fonts/lato/]{Lato-Lig}
	\fontsize{12pt}{12pt}
	\selectfont
	\renewcommand{\arraystretch}{2}
	\begin{tabular}{l l}
		#1 & #2 \\
		#3 & #4
	\end{tabular}
}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcommand{\header}[0]{

	\begin{minipage}{0.4\textwidth}
		\newdimen\headerheight
		\headerheight=\textheight
		\namesection{\ting@firstname}{\ting@lastname}
	\end{minipage}
  	\begin{minipage}{0.6\textwidth}
    	\hfill
		\headertable{\textcolor{accent}{\faPhone} \, \ting@phone}
		{\textcolor{accent}{\faChain} \, \ting@website}
		{\textcolor{accent}{\faEnvelope} \, \ting@email}
		{\textcolor{accent}{\faGithub} \, github.com/\ting@github}
	\end{minipage} \\
}

% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

% Headings command
\titleformat{\section}{\color{headings}
	\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

% Subeadings command
\titleformat{\subsection}{
	\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{
	\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}


\newcommand{\project}[3]{
	\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont
  \color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}
  \selectfont {| \, \textcolor{accent}{#2} \hfill \textcolor{date}{#3} \\} \normalfont}

\newcommand{\involvement}[2]{
	\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont
  \color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}
  \selectfont { \hfill #2 \\} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
	\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

\newcommand{\content}[1]{
	\color{accent}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont #1\\ \normalfont}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{ 
	\vspace{-0.7\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
			  {\end{itemize}\vspace{-0.7\topsep}}
			  
\newcommand{\tb}[0]{\textbullet{\,}}

\newkeycommand{\stats}[downloads=0,stars=0, forks=0]{
	\ifnum\commandkey{downloads} > 0 \textcolor{accent}{\faDownload} \, \commandkey{downloads} \quad \fi
	\ifnum\commandkey{stars} > 0 \textcolor{accent}{\faStar} \, \commandkey{stars} \quad \fi
	\ifnum\commandkey{forks} > 0 \textcolor{accent}{\faCodeFork} \, \commandkey{forks} \quad \fi
}

\newcommand{\pair}[2]{#1 \, \color{accent}\selectfont | \, #2 \normalfont}