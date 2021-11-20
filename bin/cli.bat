:cli
chcp 65001 > nul

if "!quick_boot!"=="false" (
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
	powershell -command "Start-Process cmd -ArgumentList '/c cd /d %CD% && !mypath_not_set!!sys_file_name_not_set!' -Verb runas"
	rem echo.
	goto cli
)

rem help list:
if "!input_c!"=="help" (
    !py_default! "!python_console_tools!" -h '!mypath_not_set!'
	rem echo.
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
	rem echo.
	goto cli
)

rem ls:
if "!input_c!"=="ls" (
    !py_default! "!python_console_tools!" ls
	rem echo.
	goto cli
)

rem install:
if "!input_c!"=="install" (
    !py_default! "!python_console_tools!" install !mypath!
	rem echo.
	goto cli
)

rem uninstall:
if "!input_c!"=="uninstall" (
    !py_default! "!python_console_tools!" uninstall !mypath!
	rem echo.
	goto cli
)
rem echo.
!input_c!