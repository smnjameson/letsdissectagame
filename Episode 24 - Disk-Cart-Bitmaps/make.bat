java -cp c:\C64\Tools\KickAssembler\KickAss.jar cml.kickass.KickAssembler main.asm -vicesymbols -showmem -odir ./bin

node ./loader/cartify.js ./bin/main.crt GMOD2

C:\C64\Tools\Vice\x64.exe -logfile ./bin/vicelog.txt -moncommands ./bin/main.vs ./bin/main.crt

