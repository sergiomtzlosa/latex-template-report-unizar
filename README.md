# Unofficial LaTeX template for thesis/reports/books with logos and style of Universidad de Zaragoza

Output PDF [here](report.pdf).

Compile the report.tex file in unix systems:

```
make all
```

Recommended OpenSource LaTex editor: [TeXstudio](https://www.texstudio.org/)

## Configure TeXStudio

Over Options -> Texstudio configuration -> Orders, set the following line in section *PDFLaTex*:

```
pdflatex -synctex=1 --shell-escape -interaction=nonstopmode -enable-write18 %.tex
```

Configure BiBTex with the following command:

```
bibtex ?a*.aux
```

## Install pygments

Install pygments on windows: [pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7).

See [Makefile](Makefile) to install pygments on unix systems.

## Install cm-super

Install the cm-super package using the [graphical package administrator from MikTex](https://tex.stackexchange.com/questions/88368/how-do-i-invoke-cm-super) and refresh the installed fonts.

On GNU/Linux systems:

```
sudo apt-get install cm-super
```

Finally, you can import building settings for TeXStudio using the **TeXStudio profile** file for UNIX or Windows systems from **TeXStudio-profile folder**, go to menu **Options --> Load profile...** to load them.

## Bibliography flavors

Besides the default bibliography style, there are three projects which implement bibunits, chapterbib or default style with subsections for bibliography, feel free to e¡use them if you need bibliography at the end of each chapter.

Check out the bibliography flavours [here](bibliography-work-report)

## Docker PDF compression

The command **make all-cover** in the Makefile uses Docker to reduce pdf file size, if you want to use it you must install [Docker](https://www.docker.com/products/docker-desktop).

## Magic comments

If you put this command in Unix systems at the beginning of the file **report.tex**:

```
% !TeX TS-program = make all
```

TexStudio will invoke **make all** command from the Makefile.

## Made with TeXLive 2019

Ready for latest TexLive releases

~~If you want to use this template, you must install TeXLive 2019. You can get here how to install it for [windows](install-texlive2019-windows.md), [GNU/Linux](install-texlive2019-linux.md) and [Mac](install-texlive2019-mac.md).~~

## Overleaf template

This template is ready to use in [overleaf](https://cs.overleaf.com/latex/templates/latex-phd-template-unizar/cfgtthjfynrx): 

# BibTeX citation

If you use this software, please add a BibTex entry in your document to refer this project:

```
@Misc{SergioTemplateLatex2021,
	author       = {Martínez-Losa Del Rincón, Sergio},
	howpublished = {\url{https://github.com/sergiomtzlosa/latex-template-report-unizar}},
	title        = {{U}nofficial {L}a{T}e{X} template for reports/books/thesis with corporate logos of {U}niversidad de {Z}aragoza with a beautiful look and feel},
	year         = {2021},
	commit       = {ef0242edd8260c39179310fe1b3bc55c9f69d230},
	journal      = {GitHub repository},
	publisher    = {GitHub},
}
```
