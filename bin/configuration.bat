rem python configuration:
if %1==python (
    set "url=!python%2_embed_url!"
    set "folder_name=python_%2"
    rem get package name:
    for /F "delims=" %%a in ("!url!") do (
        set package=%%~nxa
    )
    rem check "!temps_folder!" folder:
    if not exist !mypath!"!temp_folder!\" mkdir !mypath!"!temp_folder!"
    rem check "!python!" folder:
    if not exist !mypath!!folder_name! (
        echo [#] !folder_name! not exist!
	    rem Unzip if exist:
        if exist !mypath!"!temp_folder!\!package!" (
            echo [#] file '!mypath_not_set!!temp_folder!\!package!' exist.
		    echo [#] Unzip the file '!mypath_not_set!!temp_folder!\!package!'.
	        powershell Expand-Archive '!mypath_not_set!!temp_folder!\!package!' -DestinationPath '!mypath_not_set!!folder_name!'
        ) else (
	    rem download if not exist:
            echo [#] file '!mypath_not_set!!temp_folder!\!package!' doesn't exist.
	        echo [#] Downloading from the link "!url!"
            powershell -Command "Invoke-WebRequest !url! -OutFile '!mypath_not_set!!temp_folder!\!package!'"
		    echo [#] Unzip the file '!mypath_not_set!!temp_folder!\!package!'.
		    powershell Expand-Archive '!mypath_not_set!!temp_folder!\!package!' -DestinationPath '!mypath_not_set!!folder_name!'
        )
	    rem configuration:
	    for %%f in (!mypath!!folder_name!\*._pth) do (
	        echo [#] configure the file "%%f".
            if "%%~xf"=="._pth" echo import site>>%%f
        )
	    rem install pip:
	    echo [#] install pip.
	    !mypath!"!folder_name!\python" "!mypath_not_set!!system_folder!\get-pip.py"
	    echo [#] install requirements.txt
	    !mypath!"!folder_name!\python" -m pip install -r "!mypath_not_set!requirements.txt"
    )
)