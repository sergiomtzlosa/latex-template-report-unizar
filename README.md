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

## BIBLIOGRAPHY FLAVOURS

Besides the default bibliography, there are two projects with one implements bibunits and chapterbib for bibliography, feel free to e¡use them if you need bibliography at the end of each chapter.

Check out the bibliography flavours [here](bibliography-work-report)

# Made with TexLive 2019
