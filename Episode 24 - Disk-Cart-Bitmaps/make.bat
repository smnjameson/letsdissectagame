java -jar c:\C64\Tools\KickAssembler\KickAss.jar slideshow.asm -vicesymbols -showmem -odir ./bin

node ./loader/cartify.js ./bin/slideshow.crt GMOD2

C:\C64\Tools\Vice\x64.exe -logfile ./bin/vicelog.txt -moncommands ./bin/slideshow.vs ./bin/slideshow.crt

