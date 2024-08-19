Requirements
You will need the following fonts

Chaparral Pro Display

Fontin

Monaco

Comic Sans MS Regular

Myriad Pro

The easiest way to get the fonts working is to use  XeTeX or LuaTeX and the fontspec package. 
They can use any TTF font installed on the system. 
For Linux this means both the system wide fonts and any fonts you put into ~/.fonts/

Otherwise you may edit the beamerfontthemeguwahati.sty

Installation Instructions

1. For a local installation you can simply copy all files into a folder and start modifying guwahati-example.tex

2. For a system wide installation on Ubuntu/ Linux systems do the following

3. Find the directory where your latex packages are installed
   
    $ kpsewhich -var-value TEXMFLOCAL

4. On my machine this returned /usr/local/share/texmf

5. Create a new folder to store the theme

    $ sudo mkdir /usr/local/share/texmf/tex/latex/beamerguwahati

6. Copy the files into the newly created folder

7. Run texhash command
   $sudo texhash

