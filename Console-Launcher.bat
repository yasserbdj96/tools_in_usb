@echo off
Setlocal EnableDelayedExpansion

rem make symbels true:
for /F "tokens=2 delims=:" %%C in ('chcp') do set /A "$CP=%%C"
chcp 437 > nul

set mypath="%~dp0"
set mypath_not_set=%~dp0
set system_folder=bin
set temp_folder=temps
set configuration=!mypath!"!system_folder!\configuration.bat"
set sys_file_name="%~n0%~x0"
set python_console_tools=!mypath_not_set!!system_folder!\python_console_tools.py

rem config.ini:
FOR /F "tokens=*" %%A IN ('type !mypath!"config.ini"') DO set %%A

rem python3_configuration:
if not "%python%"=="" (
    goto python_configuration
)

:python_configuration
    set n=0
    for %%a in (%python%) do (
	
	    set python_version=%%a
	
	    rem urls.ini:
        FOR /F "tokens=*" %%A IN ('type !mypath!"!system_folder!\urls.ini"') DO set %%A
	
	    rem configuration:
	    call !configuration! python !python_version!
		
		
		FOR /f %%G in ('""!mypath_not_set!python_!python_version!\python" "!python_console_tools!" -opt_1 !python_version!"') DO set version=%%G
		
		rem print run information:
		"!mypath_not_set!python_!python_version!\python" "!python_console_tools!" -opt_2 !version! !n!
		
		if !n!==0 (
		    set version=
			set py_default="!mypath_not_set!python_!python_version!\python"
		)
		
		set python_path="!mypath_not_set!python_!python_version!\python"
		
		doskey python!version!=!python_path! $*
	    doskey pip!version!=!python_path! -m pip $*

        set /A n+=1
		
	)
	
chcp 65001 > nul
:start
echo.

rem check if sudo or not:
openfiles >nul 2>&1
if %ErrorLevel% equ 0 ( 
    set a=└─^$
	set sudo=true
) else (
    set a=└─^>
	set sudo=false
)

rem 
set s1=^┌──(
set s2=^)──[
set s3=]

rem advanced view:
if not "%python%"=="" (
    set ss=pass
    for /f "delims=" %%i in ('"!py_default! "!python_console_tools!" -opt_3 !sudo!"') do %%i
)

rem normal view:
if not "%ss%"=="pass" (
    echo !s1!%USERNAME%@%COMPUTERNAME%!s2!%CD%!s3!
    set /p input_c=!a!
)

rem sudo
if "!input_c!"=="sudo" (
    powershell -command "Start-Process cmd -ArgumentList '/c cd /d %CD% && !sys_file_name!' -Verb runas" & exit /b
)

rem help list:
if "!input_c!"=="help" (
    !py_default! "!python_console_tools!" -h
	goto start
)

!input_c!
exit
pause
goto start
