@ECHO OFF
REM Define jmeter path
SET JMETER_PATH=D:\Perfomance\apache-jmeter-5.4.1\apache-jmeter-5.4.1\bin

REM Please Define basic variables 
SET BASE_PATH=D:\Perfomance\VIN\VIN\
SET SCRIPT_NAME=VIN.jmx
SET THREAD=20
SET RAMP_UP=20
SET CSV_FILE=20-user-20-event.csv

REM variable 
SET outputReport=vin-thread-%THREAD%-rampup-%RAMP_UP%
SET resultFolder=%BASE_PATH%result\
SET scriptPath=%BASE_PATH%%SCRIPT_NAME%
SET inputPath=%BASE_PATH%input\%CSV_FILE%
SET logPath=%resultFolder%%outputReport%.jtl
SET reportPath=%resultFolder%%outputReport%
SET outputPath=%resultFolder%%CSV_FILE%

ECHO.
ECHO ==================PREPARE ENVIRONMENT==================
ECHO.

REM check result folder is exist or not
IF exist %resultFolder% (echo %resultFolder% already exists!) ELSE (mkdir %resultFolder% && echo %resultFolder% was created!)

REM Result folder must be empty. Clean folder commands:
SET folder="%BASE_PATH%result"
cd /d %folder%
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

REM run perfomance test script:
ECHO.
ECHO ==================EXECUTE TEST==================
ECHO.

cd /d %JMETER_PATH%
CALL jmeter -n -t "%scriptPath%" -l "%logPath%" -DTHREADS=%THREAD% -DRAM_UP=%RAMP_UP% -DINPUT=%inputPath% -DOUTPUT=%outputPath% -e -o "%reportPath%"

ECHO ==================END==================
timeout 30