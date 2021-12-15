@echo off
SETLOCAL ENABLEEXTENSIONS

Call Config.bat

Call lib/Date.bat

Call lib/Params.bat

REM Clear logs
echo hi >> %ParLog%
echo hi >> %TmpLog%
del %ParLog% > nul
del %TmpLog% > nul

echo +------------------------------------------------------->> %LogFile%
echo + INICIO: %diasem% - %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4% - %TIME% 	>> %LogFile%
echo +------------------------------------------------------->> %LogFile%
echo.							>> %LogFile%

Call lib/Copia_Local.bat
echo. 							     >> %ParLog%
Call lib/Copia_Remota.bat

REM Create Report
echo +------------------------------------------------------->> %LogFile%
echo + Carpeta Origen: %origin_dir%>> %LogFile%
echo +------------------------------------------------------->> %LogFile%
echo + COPIA LOCAL EN %origin%>> %LogFile%
echo + Ultima Copia Local: %origin_local_copy_dir%/%loclastfile%>> %LogFile%
echo + Destino Local     : %origin_local_copy_dir%/%origin%_%dtstamp%>> %LogFile%
echo +------------------------------------------------------->> %LogFile%
echo + COPIA REMOTA DE %origin% A %destination%>> %LogFile%
echo + Ultima Copia Remota %destination%: ../%remlastfile1%/>> %LogFile%
echo + Destino %destination%: %destination_address%/%origin%_%dtstamp%>> %LogFile%
echo +------------------------------------------------------->> %LogFile%
echo + RESUMEN:>> %LogFile%
echo +         %asunto%>> %LogFile%
echo +         %cuerpo%>> %LogFile%
echo +------------------------------------------------------->> %LogFile%
echo.      						>> %LogFile%

echo +------------------------------------------------------->> %ParLog%
echo + FIN: %diasem% - %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4% - %TIME%>> %ParLog% 
echo +------------------------------------------------------->> %ParLog%

type %ParLog%>> %LogFile%
del %ParLog% > nul
