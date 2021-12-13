\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdkslides}
\RequirePackage{graphicx,color}

\LoadClass{beamer}
\logo{}
\newcommand{\smalllogo}{}
\newcommand{\largelogo}{}

\newcommand\sdkfootertext[3]{\def\footfrow{#1}\def\footsrow{#2}\def\foottrow{#3}}
\sdkfootertext{}{}{}

\newif\iffooter\footertrue
\newif\ifnormaltitle\normaltitlefalse

%Itemize environment
%\setlist[itemize]{leftmargini=1ex}

\setlength\leftmargini {0ex}
\setlength\leftmarginii {1.5ex}
\setlength\leftmarginiii {1.5ex}

% AALTO COLORS DEFINED IN AALTOLOGO

% LENGTHS
\newlength\sdkfooterplace \setlength\sdkfooterplace{8.75cm}
\newlength\sdkfooterruleheight \setlength\sdkfooterruleheight{2.5pt}
\newlength\sdkfooterrulewidth \setlength\sdkfooterrulewidth{12cm}
\newlength\sdktitleboxplace \setlength\sdktitleboxplace{0cm}
\newlength\sdktitleboxheight \setlength\sdktitleboxheight{5cm}
\newlength\sdktitleboxwidth \setlength\sdktitleboxwidth{12cm}
\newlength\sdktitlesep \setlength\sdktitlesep{0.3cm}
\newlength\sdktitleentrysep \setlength\sdktitleentrysep{0.2cm}

% Colors
% Primary color
\definecolor{secondarycolor}{RGB}{140,140,140}
\definecolor{primarycolor}{RGB}{100,100,100}

% Logo
\renewcommand{\largelogo}{\includegraphics[scale=1]{./Pics/SyDeKick_textlogo.eps}}
\renewcommand{\smalllogo}{\includegraphics[scale=0.3]{./Pics/SyDeKick_textlogo.eps}}
%}

% Options
\DeclareOption{nofoot}{\footerfalse}
\DeclareOption{nologo}{\renewcommand{\largelogo}{\vspace{\largelogoheight}}\renewcommand{\smalllogo}{}}
\DeclareOption{normaltitle}{\normaltitletrue}

% This would set default options
\ExecuteOptions{normaltitle}
\ProcessOptions

% SOME CUSTOMIZATION
\useinnertheme[shadow]{rounded} % Rounded blocks
\setbeamertemplate{navigation symbols}{} % Remove navigation symbols
\setbeamertemplate{frametitle continuation}[from second] 
\setbeamersize{text margin left=1cm, text margin right=1cm}
\iffooter\setbeamertemplate{footline}{\vspace{1.1cm}}\fi % B. Brumley's fix to the "text too low problem"

% Set fonts
\renewcommand{\rmdefault}{phv} % Helvetica (resembles Arial)
\renewcommand{\sfdefault}{phv} % Helvetica (resembles Arial)
\setbeamerfont{title}{size=\Large, series=\bfseries}
\setbeamerfont{frametitle}{size=\Large, series=\bfseries}

% Set colors
\setbeamercolor{structure}{fg=primarycolor}
\setbeamercolor{alerted text}{fg=secondarycolor}
\setbeamercolor{example text}{fg=secondarycolor}

%%BLOCK
\setbeamercolor{block title}{fg=white,bg=secondarycolor!75}
\setbeamercolor{block body}{fg=black,bg=secondarycolor!10}

%ITEMIZE
\setlength\leftmargini {0em}
\setlength\leftmarginii {2em}
\setlength\leftmarginiii {3em}
\setbeamertemplate{itemize items}[triangle]
\setbeamertemplate{enumerate items}[triangle]
\setbeamertemplate{section in toc}[ball unnumbered]


% FOOTER
\usebackgroundtemplate{
  \iffooter
  \begin{minipage}{\paperwidth}
    \begin{center}
      \vspace{\sdkfooterplace}
      {\color{primarycolor}\rule{\sdkfooterrulewidth}{\sdkfooterruleheight}}
      %\includegraphics[width=\sdkfooterrulewidth, height=\sdkfooterruleheight]{./Pics/SDKbar.eps}
    \end{center}
    \vspace{-0.6cm}
    \flushleft\hspace{0.40cm}\mbox{\smalllogo}
    \vspace{-0.9cm}
    \begin{flushright}
    \Tiny \bfseries
    \footfrow \qquad \ \, \phantom{0} \\
    {\color{gray} \footsrow \qquad \ \, \phantom{0} \\
    \foottrow \qquad \ \, \phantom{0} \\}
    \end{flushright}
  \end{minipage}
  \fi
}

% TITLEPAGE
\ifnormaltitle
  % More traditional title page
  \newcommand{\sdktitleframe}{
  {\usebackgroundtemplate{}
  \frame{
  \vspace{0.6cm}
  \largelogo
  \vspace{0.3cm}
  \titlepage
  }}}
\else
  % Aalto-style title page, currently not working
  \newcommand{\sdktitleframe}{
  {\usebackgroundtemplate{
    \begin{minipage}{\paperwidth}
      \vspace{0.8cm}
      \hspace{0.5cm}
      \mbox{\largelogo}
      \vspace{\sdktitleboxplace}
      \begin{center}
        {\color{primarycolor}\rule{\sdktitleboxwidth}{\sdktitleboxheight}}
      \end{center}
    \end{minipage} 
  }
  \frame[t]{
  \vspace{1.2cm}
  \vspace{\largelogoheight}
  {\color{white} 
  {\bfseries \Large \inserttitle}  \\[\sdktitlesep]
  \insertauthor \\[\sdktitleentrysep]
  \footnotesize \insertinstitute \\[\sdktitleentrysep]
  \insertdate
  }}
  }}
\fi

%INTERMEDIATE SECTION TITLE SLIDE
\newcommand{\sectiontitle}[1][Sectiontitle]{
    \renewcommand{\sectionname}{#1}
    \section{#1}
    \begin{frame}[c]
    	\frametitle{}
        \begin{center}
            {\Large \color{primarycolor}{\textbf{#1}}}
        \end{center}
    \end{frame}
}

\newenvironment{reference}{%
    \parskip=0ex \partopsep=0ex 
    \tiny
}{%

}


