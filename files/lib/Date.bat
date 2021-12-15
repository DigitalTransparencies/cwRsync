for /f "tokens=1,2,3 delims=-/." %%a in ("%DATE%") do (SET dd=%%a&SET mm=%%b&SET yy=%%c)
SET /a dd=100%dd%%%100,mm=100%mm%%%100
SET /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,dow=153*m+2
SET /a dow=dow/5+dd+y*365+y/4-y/100+y/400-2472630,dow%%=7,dow+=1

IF %dow% == 1 SET diasem=Lunes
IF %dow% == 2 SET diasem=Martes
IF %dow% == 3 SET diasem=Miercoles
IF %dow% == 4 SET diasem=Jueves
IF %dow% == 5 SET diasem=Viernes
IF %dow% == 6 SET diasem=Sabado
IF %dow% == 7 SET diasem=Domingo


SET HOUR=%time:~0,2%
SET dtStamp9=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_0%time:~1,1%%time:~3,2%%time:~6,2%_%diasem%
SET dtStamp24=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%_%diasem%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)
