# Install Ghostscript 9.27
--------------------------

The recommended way

```
$ sudo apt-get update
$ sudo apt-get install ghostscript
```

If you need to downgrade version rather than provided by your Ubuntu-Version:

1 .- Download "Ghostscript 9 Source" from https://www.ghostscript.com/download/gsdnld.html (direct link to [gs 9.27](https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/ghostscript-9.27.tar.gz))
2 .- Uncompress it (f.e. tar xvf ghostscript-9.27.tar.gz)
3 .- go into this folder
4 .- sudo ./configure
5 .- sudo make
6 .- sudo make install
7 .- restart Terminal
8 .- Test with gs -v
