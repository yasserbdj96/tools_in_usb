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
		if "!n!"=="!python_default!" (
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
		    if "!quick_boot!"=="false" (
		        "!mypath_not_set!python_!python_version!\python" "!python_console_tools!" -opt_2 !vx! !n! !python_default!
			)
		)
		
		set python_path="!mypath_not_set!python_!python_version!\python"
		
		doskey python!version!=!python_path! $*
	    doskey pip!version!=!python_path! -m pip $*

        set /A n+=1
		
	)

    if "!opt!"=="run" ( cd /D "%2" )