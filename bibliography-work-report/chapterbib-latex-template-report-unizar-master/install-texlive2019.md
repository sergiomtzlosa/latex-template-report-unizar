# Install TexLive 2019
---------------------- 

*https://tex.stackexchange.com/questions/488935/how-to-find-a-tex-live-repository-for-a-certain-version-of-tex-live#488951*

```
$ wget ftp://tug.org/historic/systems/texlive/2019/tlnet-final/install-tl-unx.tar.gz
$ tar -xzf install-tl-unx.tar.gz
$ cd install-tl-20200301/
$ sudo ./install-tl -scheme=full -repository=ftp://tug.org/historic/systems/texlive/2019/tlnet-final
$ sudo apt-get install texlive-pstricks docker python3-pygments cm-super pdfgrep poppler-utils
$ sudo apt -y install texlive-science
```
