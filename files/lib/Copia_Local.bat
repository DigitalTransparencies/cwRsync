echo +------------------------------------------------------->> %ParLog%
echo + COPIA LOCAL EN %origin%>> %ParLog%
echo +------------------------------------------------------->> %ParLog%
FOR /F "tokens=5" %%G IN ('rsync.exe --list-only %origin_local_copy_dir%/') DO SET loclastfile=%%G> nul
"rsync.exe" -rtvHp --delete --progress --exclude=%exclude% --log-file=%TmpLog% --link-dest="../%loclastfile%" "%origin_dir%" "%origin_local_copy_dir%/%origin%_%dtstamp%"

findstr /C:"rsync error:" %TmpLog% > nul
IF %ERRORLEVEL% EQU 0 (
	SET cuerpotmp=Copia Local en %origin% : ERRONEA
	SET asunto=BACKUP INCOMPLETO O ERRONEO - %origin%: %diasem% - %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4% - %TIME%
) ELSE (
	SET cuerpotmp=Copia Local en %origin% : CORRECTA
)

SET cuerpo=%cuerpo% %cuerpotmp%

type %TmpLog% >> %ParLog%
del %TmpLog% > nul
