:cli
chcp 65001 > nul

if "!fast_run!"=="false" (
	echo.
)


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
    chcp 437 > nul
    rem powershell -command "Start-Process cmd -ArgumentList '/c !mypath!!sys_file_name!' -Verb runas" & exit /b
	rem echo createobject("shell.application").shellexecute "!mypath!!sys_file_name! run %CD%",,,"runas",1 > runas.vbs & start /wait runas.vbs
	
	rem powershell -command "Start-Process !mypath!!sys_file_name! -Verb runas"
	
	powershell -command "Start-Process cmd -ArgumentList '/c cd /d %CD% && !mypath_not_set!!sys_file_name_not_set!' -Verb runas"
	echo.
	goto cli
)

rem help list:
if "!input_c!"=="help" (
    !py_default! "!python_console_tools!" -h
	echo.
	goto cli
)

rem restart:
if "!input_c!"=="restart" (
    cls
    %1
)

rem clear:
if "!input_c!"=="clear" (
    !py_default! "!python_console_tools!" clear "!mypath_not_set!"
	echo.
	goto cli
)

rem ls:
if "!input_c!"=="ls" (
    !py_default! "!python_console_tools!" ls
	echo.
	goto cli
)

rem install:
if "!input_c!"=="install" (
    !py_default! "!python_console_tools!" install !mypath!
	echo.
	goto cli
)

rem uninstall:
if "!input_c!"=="uninstall" (
    !py_default! "!python_console_tools!" uninstall !mypath!
	echo.
	goto cli
)
echo.
!input_c!