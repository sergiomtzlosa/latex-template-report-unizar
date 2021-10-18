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

## Package bibunits

Package bibunits needs a special compilation steps, you can keep on using the **make all** command as usual, but if you what to use TexStudio and bibunits, you should set the **latex_bibunits.sh** in the compilation process, to do this see image [config-texstudio-bibunits-compile-script-unix.png](config-texstudio-bibunits-compile-script-unix.png?raw=true) to set the script in the configuration (this is only necessary for UNIX systems, for Windows systems just compile twice with TexStudio).

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

Made with TexLive 2019
