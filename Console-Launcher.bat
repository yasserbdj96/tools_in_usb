@echo off
Setlocal EnableDelayedExpansion

title 

rem make symbels true:
for /F "tokens=2 delims=:" %%C in ('chcp') do set /A "$CP=%%C"
chcp 437 > nul

set mypath="%~dp0"
set mypath_not_set=%~dp0
set system_folder=bin
set temp_folder=temps
set configuration=!mypath!"!system_folder!\configuration.bat"
set cli=!mypath!"!system_folder!\cli.bat"
set python_configuration=!mypath!"!system_folder!\python_configuration.bat"
set sys_file_name="%~n0%~x0"
set sys_file_name_not_set=%~n0%~x0
set python_console_tools=!mypath_not_set!!system_folder!\python_console_tools.py

rem config.ini:
FOR /F "tokens=*" %%A IN ('type !mypath!"config.ini"') DO set %%A

rem python_configuration:
if not "%python%"=="" (
    rem python3_configuration:
    call !python_configuration!
)




:start
rem cli:
call !cli! %0
goto start