@echo off
Setlocal EnableDelayedExpansion

rem make symbels true:
for /F "tokens=2 delims=:" %%C in ('chcp') do set /A "$CP=%%C"
chcp 65001 > nul

set mypath=%~dp0
set bats_file=bin
set temps_folder=temps
set sys_file_name=%~n0%~x0


rem config.ini:
FOR /F "tokens=*" %%A IN ('type "%mypath:~0,-1%\config.ini"') DO set %%A
cls

rem python3_configuration:
if not "%python3%"=="" (
    goto python3_configuration
)

rem python3_configuration function:
:python3_configuration
    set n=0
	
    for %%a in (%python3%) do (
	    set version=
        set python3=%%a
        set python3_path=%mypath:~0,-1%\python_!python3!\python
        rem urls.ini:
        FOR /F "tokens=*" %%A IN ('type "%mypath:~0,-1%\!bats_file!\urls.ini"') DO set %%A
        rem download python3:
        call %mypath:~0,-1%\!bats_file!\configuration.bat python!python3!_url %mypath:~0,-1% python_!python3!
		
		if !n!==0 (
		    set py=
			set pi=
		    set py_default=!python3_path!
		) else (
		    set py=!python3!
			set pi=!python3!
		)
		
		for /f %%i in ('!python3_path! !mypath!!bats_file!\python_console-tools.py -opt_1 !py!') do set version=%%i
		
		!python3_path! !mypath!!bats_file!\python_console-tools.py -opt_2 !version!
		
		rem echo !version!
		
		
		doskey python!version!=!python3_path! $*
	    doskey pip!version!=!python3_path! -m pip $*

		set /A n+=1
    )

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
if not "%python3%"=="" (
    set ss=pass
    for /f "delims=" %%i in ('!py_default! !mypath!!bats_file!\python_console-tools.py -opt_3 !sudo!') do %%i
)

rem normal view:
if not "%ss%"=="pass" (
    echo !s1!%USERNAME%@%COMPUTERNAME%!s2!%CD%!s3!
    set /p input_c=!a!
)

rem sudo
if "%input_c%"=="sudo" (
    powershell -command "Start-Process cmd -ArgumentList '/c cd /d %CD% && %0' -Verb runas" & exit /b
)

%input_c%
goto start