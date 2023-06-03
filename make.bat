ECHO OFF
REM delete previous files
DEL bin\*.gb
DEL bin\*.map
DEL bin\*.noi

SET PROJECT=game

REM Compile a .gb file and project files
SET LCC=C:\GBDK\bin\lcc
SET FLAGS=-Wl-yt0x19 -Wl-yoA -Wl-j -autobank
SET INCLUDE=-Iinclude -Iinclude\sfx
SET LIB="-Wl-llib\hUGEDriver.lib"
SET FILES=src\*.c src\gfx\*.c src\sfx\*.c

%LCC% %FLAGS% %LIB% %INCLUDE% -o bin\%PROJECT%.gb %FILES%

REM ROM Usage
utils\romusage bin\%PROJECT%.gb

REM start game in bgb
SET BGB=C:\gbdk\bin\bgb
%BGB% bin\%PROJECT%.gb