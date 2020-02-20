; build command:
; make prg INSTALL=0900 RESIDENT=0400 ZP=e8

; configuration
config_DECOMPRESSOR             = $ff
config_DIRTRACK                 = $12
config_DISABLE_WATCHDOG         = $01
config_END_ADDRESS_API          = $00
config_FILENAME_MAXLENGTH       = $10
config_IDLE_BUS_LOCK            = $00
config_LC_SPEED                 = $06
config_LOAD_COMPD_API           = $00
config_LOAD_RAW_API             = $01
config_LOAD_TO_API              = $00
config_LOAD_UNDER_D000_DFFF     = $01
config_LOAD_VIA_KERNAL_FALLBACK = $00
config_MEM_DECOMP_API           = $00
config_MEM_DECOMP_TO_API        = $00
config_NTSC_COMPATIBILITY       = $00
config_ONLY_1541_AND_COMPATIBLE = $01
config_UNINSTALL_API            = $00

; zeropage
loadaddrlo                      = $e8
loader_zp_first                 = $e8
loadaddrhi                      = $e9
loader_zp_last                  = $ec

; resident
loadraw                         = $0400
openfile                        = $040b
pollblock                       = $0451

; install
drivecode41                     = $0900
install                         = $10dd
