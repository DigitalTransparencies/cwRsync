echo +------------------------------------------------------->> %ParLog%
echo + COPIA REMOTA A %destination%  			     >> %ParLog%
echo +------------------------------------------------------->> %ParLog%
FOR /F "tokens=5" %%G IN ('rsync.exe  --password-file=rsync_pass --list-only %destination_address%/') DO SET remlastfile1=%%G> nul
"rsync.exe" -rtvHz --delete --progress --password-file=rsync_pass --exclude=%exclude% --log-file=%TmpLog% --password-file="rsync_pass" --link-dest="../%remlastfile1%" --chmod="777" "%origin_dir%" "%destination_address%/%dtstamp%"

findstr /C:"rsync error:" %TmpLog% > nul
IF %ERRORLEVEL% EQU 0 (
	SET cuerpotmp=Copia Remota a %destination%   : ERRONEA
	SET asunto=BACKUP INCOMPLETO O ERRONEO - %origin%: %diasem% - %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4% - %TIME%
) ELSE (
	SET cuerpotmp=Copia Remota a %destination%   : CORRECTA
)

SET cuerpo=%cuerpo% %cuerpotmp%

type %TmpLog% >> %ParLog%
del %TmpLog% > nul