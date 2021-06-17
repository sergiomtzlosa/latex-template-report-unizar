# Install Ghostscript 9.27
--------------------------

The recommended way

```
$ sudo apt-get update
$ sudo apt-get install ghostscript
```

If you need to downgrade version rather than provided by your Ubuntu-Version:

<ol>
<li>Download "Ghostscript 9 Source" from https://www.ghostscript.com/download/gsdnld.html (direct link to gs 9.27: https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs927/ghostscript-9.27.tar.gz)</li>
<li>Uncompress it (i.e. tar xvf ghostscript-9.27.tar.gz)</li>
<li>Go into this folder</li>
<li>sudo ./configure</li>
<li>sudo make</li>
<li>sudo make install</li>
<li>Restart Terminal</li>
<li>Test with gs -v</li>
</ol>
