%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                    %
% Custom class for UNIZAR reports/thesis/books                                       %
% This class was done to check backward compatibility for                            %
% TeX Live distribution greater than or equal to 2019                                %
%                                                                                    %
%                                                                                    %
% The original template was made using TeX Live 2019 but by using this class you     %
% can compile this template in most recent TeX Live distributions                    % 
%                                                                                    %
%         MIT License - Copyright (c) 2021 Sergio Martínez-Losa	                     %
%                                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{book-unizar}[2021/11/07 Custom class for UNIZAR reports/thesis]

% https://tex.stackexchange.com/questions/9792/is-there-a-way-to-detect-from-inside-a-package-that-miktex-is-used
\RequirePackage{packages/ifdistro}

\iftexlive

	\makeatletter
	\begingroup
	\edef\get@@version{\def\noexpand\get@version##1\detokenize{TeX Live}##220##3##4##5)##6\noexpand\@nil}
	\get@@version{\gdef\TeXLiveVersion{20#3#4}}
	\expandafter\get@version\pdftexbanner\@nil
	\endgroup
	\makeatother
	
	\typeout{@@@@@@@@@@@@@}
	\typeout{@@@@@@@@@@@@@ This has been run with TeX Live \TeXLiveVersion.}
	\typeout{@@@@@@@@@@@@@}
	
	\ifnum \TeXLiveVersion=2019
		\typeout{@@@@@@@@ RUNING TeX Live 2019}
		\relax
	\else
		\ifnum \TeXLiveVersion<2019
			\typeout{@@@@@@@@}
			\typeout{@@@@@@@@ Minimum version to compile is TeX Live 2019}
			\typeout{@@@@@@@@}
			\PackageError{LaTeX}{Minimum version to compile is TeX Live 2019}
			\stop
		\else
			\typeout{@@@@@@@@ RUNING TeX Live greater than 2019}
			\RequirePackage[2020/02/08]{latexrelease} % if you use other version bigger than TeX Live2019 you must use this line, this is for backward compatibility purposes
		\fi
	\fi

\else

	\typeout{@@@@@@@@@@@@@}
	\typeout{@@@@@@@@@@@@@ This has been run with other TeX distribution different from Tex Live, maybe MikTeX?}
	\typeout{@@@@@@@@@@@@@}
	\RequirePackage[2020/02/08]{latexrelease} % Used other tex distribution different from TeX Live
	
\fi

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%\LoadClass{extbook}
\LoadClass{book}
