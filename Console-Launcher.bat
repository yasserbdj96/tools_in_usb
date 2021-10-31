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
set cli=!mypath!"!system_folder!\cli.bat"
set sys_file_name="%~n0%~x0"
set sys_file_name_not_set=%~n0%~x0
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
		set vx=!version!
		
		set opt=%1
		if !n!==0 (
		    set version=
			set py_default="!mypath_not_set!python_!python_version!\python"
			
			if "!opt!"=="python" (
			    !py_default! %2
			    goto start
			)
		)
		
        if "!opt:~0,7!"=="python3" (
		    if "!opt!"=="python!vx!" (
		        "!mypath_not_set!python_!python_version!\python" %2
				goto start
			)
		)
		
        rem if "%1"==""python_run"" (cd "%2")
		rem Console-Launcher.bat python388 python_test.py
		
		
		rem print run information:
		if not "!opt:~0,6!"=="python" (
		    "!mypath_not_set!python_!python_version!\python" "!python_console_tools!" -opt_2 !vx! !n!
		)
		
		set python_path="!mypath_not_set!python_!python_version!\python"
		
		doskey python!version!=!python_path! $*
	    doskey pip!version!=!python_path! -m pip $*

        set /A n+=1
		
	)

    if "!opt!"=="run" ( cd /D "%2" )


:start
rem cli:
call !cli! %0
goto start