SET HOME=%HOMEDRIVE%%HOMEPATH%
SET PATH=.\BIN;%PATH%
SET "LogDir=..\Logs"
SET LogFile="%LogDir%\Copylog_%dtStamp%.log"
SET ZipFile="%LogDir%\Copylog_%dtStamp%.zip"
SET ParLog="%LogDir%\ParLog.txt"
SET TmpLog=TmpLog.txt
SET asunto=BACKUP COMPLETO - %origin%: %diasem% - %DATE:~0,2%-%DATE:~3,2%-%DATE:~6,4% - %TIME%