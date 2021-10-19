@ECHO OFF
REM Define jmeter path
SET JMETER_PATH=D:\Perfomance\apache-jmeter-5.4.1\apache-jmeter-5.4.1\bin

REM Define basic variables 
SET scriptFile=VIN.jmx
SET thread=1
SET ramUp=1
SET basePath=D:\Perfomance\VIN\VIN\
SET csvFile=20-user-20-event.csv
SET outputReport=vin-thread-%thread%-rampup-%ramUp%
SET resultFolder=%basePath%result\

SET scriptPath=%basePath%%scriptFile%
SET inputPath=%basePath%input\%csvFile%

SET logPath=%resultFolder%%outputReport%.jtl
SET reportPath=%resultFolder%%outputReport%
SET outputPath=%resultFolder%%csvFile%

REM check result folder is exist or not
IF exist %resultFolder% (echo ****** %resultFolder% exists) ELSE (mkdir %resultFolder% && echo ****** %resultFolder% created)

REM Result folder must be empty. Clean folder commands:
SET folder="%basePath%result"
ECHO.
ECHO ***********Clean %folder% ****************
ECHO.
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

REM run perfomance test script:
ECHO.
ECHO ***********Perfomance test****************
ECHO.

cd /d %JMETER_PATH%
CALL jmeter -n -t "%scriptPath%" -l "%logPath%" -DTHREADS=%thread% -DRAM_UP=%ramUp% -DINPUT=%inputPath% -DOUTPUT=%outputPath% -e -o "%reportPath%"

ECHO *******************END********************
timeout 30