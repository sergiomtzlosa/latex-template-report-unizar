# Plantilla de LaTeX no oficial para tésis/informes/libros con logos y estilo de la Universidad de Zaragoza

Platilla de LaTeX para realizar informes/documentos/libros/tésis con el logo de la Universidad de Zaragoza.

Archivo PDF resultante [aqui](report.pdf).

Compilar el archivo report.tex en sistemas unix:

```
make all
```

Editor LaTeX OpenSource recomendado: [TeXstudio](https://www.texstudio.org/)

## Configurar TeXStudio

En Options -> Texstudio configuration -> Orders, poner la siguiente linea en la seccion de *PDFLaTex*:

```
pdflatex -synctex=1 --shell-escape -interaction=nonstopmode -enable-write18 %.tex
```

## Paquete bibunits

El paquete bibunits necesita unos pasos de compilación especiales, puedes seguir usando el comando **make all** como de costumbre, pero si quieres usar TexStudio y bibunits, debes incluir el script **latex_bibunits.sh** en el proceso de compilación, ver imagen [config-texstudio-bibunits-compile-script-unix.png](config-texstudio-bibunits-compile-script-unix.png?raw=true) para establecer el script en la configuración.

Si deseas usar el paquete bibunits en sistemas Windows, debes poner el script **latex_bibunits.bat** en el proceso de compilación, ver imagen [config-texstudio-bibunits-compile-script-windows.png](config-texstudio-bibunits-compile-script-windows.png).

En ambos casos se debe poner la ruta del script de compilación en la configuración de TexStudio para usar bibunits. Puedes usar la ruta del script que esta dentro de la carpeta del proyecto para ponerla en la configuración de compilación.

## Instalar pygments

Instalar pygments en windows: [pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7).

Para instalar pygments en sistemas unix mirar [Makefile](Makefile).

## Instalar cm-super

Instalar el paquete cm-super con el [administrador grafico de MikTex](https://tex.stackexchange.com/questions/88368/how-do-i-invoke-cm-super) y refrescar las fuentes.

En sistemas GNU/Linux:

```
sudo apt-get install cm-super
```

Finalmente, puedes importar la configuración para compilar el documento en TeXStudio usando el archivo correspondiente para sistemas UNIX o Windows que se encuentra en la carpera **TeXStudio-profile**, menú **Options -> Load profile ...**

## Compresión de PDF con Docker 

El comando **make all-cover** del archivo Makefile usa Docker para comprimir el archivo pdf, si desea usar este comando debes instalar Docker](https://www.docker.com/products/docker-desktop).

## Magic comments

Si pones este comando en sistemas Unix al principio del archivo **report.tex**:

```
% !TeX TS-program = make all
````

TexStudio llamara al comando **make all** del archivo Makefile, esto no esta disponible en sistemas Windows.

# Realizado con [TexLive 2019](mirror-install-latex-2019-dist.md)

# Citación BibTeX

Si vas a usar este software, por favor incluye una entrada de BibTeX en tu documento para hacer referencia a este proyecto:

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
