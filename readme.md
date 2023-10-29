Installation Instructions

1. For a local installation you can simply copy all files into a folder and start modifying guwahati-example.tex

2. For a system wide installation on Ubuntu/ Linux systems do the following

3. Find the directory where your latex packages are installed
   
    $ kpsewhich -var-value TEXMFLOCAL

4. On my machine this returned /usr/local/share/texmf

5. Create a new folder to store the theme

    $ sudo mkdir /usr/local/share/texmf/tex/latex/beamer

6. Copy the files into the newly created folder

7. Run texhash command
   $sudo texhash
