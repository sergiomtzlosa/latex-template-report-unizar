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

Package bibunits needs a special compilation steps, you can keep on using the **make all** command as usual.

If you want to use TexStudio and bibunits in UNIX systems, you should set the **latex_bibunits.sh** in the compilation process, see image [config-texstudio-bibunits-compile-script-unix.png](config-texstudio-bibunits-compile-script-unix.png?raw=true) to set the script in the configuration.

If you want to use TexStudio and bibunits in Windows systems, set the path of the script **latex_bibunits.bat** in the compilation process, see image [config-texstudio-bibunits-compile-script-windows.png](config-texstudio-bibunits-compile-script-windows.png) to set the script in the configuration.

In both cases you must set the custom building script path on the building configuration in TexStudio to use bibunits. You can get the path of the script directly from the project folder to set it in the building configuration.

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

# Made with [TexLive 2019](mirror-install-latex-2019-dist.md)
