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

En ambos casos se debe poner la ruta del script de compilación en la configuración de TexStudio para usar bibunits. Puedes usar la ruta del script que esta dentro de la carpeta del proyecto.

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

# Realizado con [TexLive 2019](mirror-install-latex-2019-dist.md)
