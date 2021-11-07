\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{book-unizar}[2021/11/07 Custom class for UNIZAR reports/thesis]

\makeatletter
\begingroup
\edef\get@@version{\def\noexpand\get@version##1\detokenize{TeX Live}##220##3##4##5)##6\noexpand\@nil}
\get@@version{\gdef\TeXLiveVersion{20#3#4}}
\expandafter\get@version\pdftexbanner\@nil
\endgroup
\makeatother

\typeout{!!!!!!!!!!!!!}
\typeout{!!!!!!!!!!!!! This has been run with TeX Live \TeXLiveVersion.}
\typeout{!!!!!!!!!!!!!}

\ifnum \TeXLiveVersion=2019
	\typeout{!!!!!!!! RUNING TeX Live 2019}
	\relax
\else
	\ifnum \TeXLiveVersion<2019
		\typeout{!!!!!!!!}
		\typeout{!!!!!!!! Minimum version to compile is TeX Live 2019}
		\typeout{!!!!!!!!}
		\PackageError{LaTeX}{Minimum version to compile is TeX Live 2019}
		\stop
	\else
		\typeout{!!!!!!!! RUNING TeX Live greater than 2019}
		\RequirePackage[2020/02/08]{latexrelease} % if you use other version bigger than TeX Live2019 uses this line, this is for backward compatibility purposes
	\fi
\fi

\LoadClass{book}