java -jar c:\C64\Tools\KickAssembler\KickAss.jar main.asm -vicesymbols -showmem -odir ./bin

node ./loader/cartify.js ./bin/main.crt MAGICDESK

C:\C64\Tools\Vice\x64.exe -logfile ./bin/vicelog.txt -moncommands ./bin/main.vs ./bin/main.crt

