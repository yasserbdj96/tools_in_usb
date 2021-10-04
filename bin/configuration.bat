rem check "!temps_folder!" folder:
if not exist "%2\!temps_folder!\" mkdir %2\!temps_folder!

rem get package name:
for /F "delims=" %%a in ("!%1!") do (
   set package=%%~nxa
)

if not exist %2\%3 (
    rem echo %3 not exist
    rem download if not exist:
    if exist %2\!temps_folder!\!package! (
        echo [#] file "%2\!temps_folder!\!package!" exist.
		echo [#] Unzip the file "%2\!temps_folder!\!package!".
	    powershell Expand-Archive %2\!temps_folder!\!package! -DestinationPath %2\%3
    ) else (
        echo [#] file "%2\!temps_folder!\!package!" doesn't exist.
	    echo [#] Downloading from the link "!%1!"
        powershell -Command "Invoke-WebRequest !%1! -OutFile %2\!temps_folder!\!package!"
		echo [#] Unzip the file "%2\!temps_folder!\!package!".
		powershell Expand-Archive %2\!temps_folder!\!package! -DestinationPath %2\%3
    )
	rem configuration:
	for %%f in (%2\%3\*._pth) do (
	    echo [#] configure the file "%%f".
        if "%%~xf"=="._pth" echo import site>>%%f
    )
	rem install pip:
	echo [#] install pip.
	%2\%3\python %2\!bats_file!\get-pip.py
	echo [#] install requirements.txt
	%2\%3\python -m pip install -r %2\requirements.txt
	
	start %2\!sys_file_name!
	exit
)