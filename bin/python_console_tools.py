#!/usr/bin/env python
# coding:utf-8

#s
try:
    from pipincluder import pipincluder
except:
    print("please use this command : pip install pipincluder")
    exit()
exec(pipincluder("import sys,os,subprocess,shutil",
                 "from hexor import hexor",
                 "import yasserbdj96",
                 "from biglibrary import *").modules())


p1=hexor(True,"hex")

red="#ea4335"
blue="#4285f4"
yallew="#fbbc05"
green="#34a853"

# python version for start (from x.x.x to xxx):
if sys.argv[1]=="-opt_1":
    version=""
    try:
        v=sys.argv[2].split(".")
        for i in range(len(v)):
            version+=v[i]
    except:
        pass
    print(version)

# python to start:
elif sys.argv[1]=="-opt_2":
    sps=17
    if sys.argv[3]==sys.argv[4]:
        on=p1.c('==> ',yallew)+p1.c('python, pip ',green)+p1.c(' ==> ',yallew)+p1.c('[Default]',blue)
    else:
        on=p1.c('==> ',yallew)+p1.c(f'python{sys.argv[2]}, pip{sys.argv[2]}',green)
    version=f'Python {sys.version.split("(")[0]}'
    ve=" "*int(sps-len(version))
    print(p1.c('[#] ',yallew)+p1.c(version,red)+ve+on)
    
##
elif sys.argv[1]=="-opt_3":
    COMPUTERNAME=p1.c("!COMPUTERNAME!",green)
    CD=p1.c("!CD!",yallew)
    
    if sys.argv[2]=="true":
        ccd=red
        USERNAME=p1.c("ROOT",red)
    else:
        ccd=blue
        USERNAME=p1.c("!USERNAME!",green)
        
    s1=p1.c("!s1!",ccd)
    s2=p1.c("!s2!",ccd)
    s3=p1.c("!s3!",ccd)
    a=p1.c("!a!",ccd)
    
    at=p1.c("@",ccd)
    
    xx=f"""echo {s1+USERNAME+at+COMPUTERNAME+s2+CD+s3}\nset /p input_c={a} """
    print(xx)
    
#help_list:
elif sys.argv[1]=="-h":
    help_t="""Help:
═════
# In order to modify the settings and comprehensive control, please modify the file 'config.ini'.

         Command                 Description
         -------                 -----------
[OPTIONS]
         help                    |   # Help menu.
         
[ACTIONS]
         sudo                    |   # Run as administrator.

         python                  |   # Running default python3.
         python3<N>              |   # Running python3 specified with <N> is the version number.
         pip                     |   # Running pip on default python3.
         pip3<N>                 |   # Running pip on python3 specified with <N> is the version number.
[DEBUG]
         install/uninstall       |   # Add/Delete right click to/from menu.
         restart                 |   # Restart command line interface.
         clear                   |   # Delete cache files and folders.
[USAGE]
    For run a Python script:                                     Examples:
    ------------------------                                     ---------
    <Console-Launcher.bat> <python> <python_script_path>    |    Console-Launcher.bat python E:\ws\python_test.py
                                                            |    Console-Launcher.bat python388 E:\ws\python_test.py
    
    To run this program in a specified path:                     Example:
    ----------------------------------------                     --------
    <Console-Launcher.bat> run <your_path>                  |    Console-Launcher.bat run E:\ws\
"""

    print(help_t)

#clear:
elif sys.argv[1]=="clear":
    print(sys.argv[1])
    ss=os.path.realpath(sys.argv[2]).split(os.sep)
    path_to_clear=""
    for i in range(len(ss)-1):
        path_to_clear=path_to_clear+os.sep+ss[i]
    #__pycache__:
    folders_list=[x[0] for x in os.walk(path_to_clear[1:])]
    for i in range(len(folders_list)):
        folder_name=folders_list[i].split(os.sep)
        if folder_name[len(folder_name)-1]=="__pycache__":
            print(folders_list[i])
            shutil.rmtree(folders_list[i])
    #.pyc .pyo
    arr=[".pyc",".pyo"]
    for i in range(len(arr)):
        for root, dirs, files in os.walk(path_to_clear[1:]):
            for file in files:
                if file.endswith(arr[i]):
                    os.remove(os.path.join(root,file))
                    print(os.path.join(root,file))
    #print("clear done!")
    
    
#ls:
elif sys.argv[1]=="ls":
    p1=hexor(True,"hex")
    arr=os.listdir()
    
    table=[]
    folders=[]
    python=[]
    bash=[]
    others=[]
    
    for i in range(len(arr)):
        if os.path.isdir(arr[i]):
            folders.append(p1.c("/"+arr[i],"#ff0000"))
        elif os.path.isfile(arr[i]):
            ss=arr[i].split(".")
            if ss[1]=="py":
                python.append(p1.c(arr[i],"#1a73e8"))
            elif ss[1]=="sh":
                bash.append(p1.c(arr[i],"#34a853"))
            else:
                others.append(p1.c(arr[i],"#fbbc05"))
    
    if len(folders)!=0:
        table.append(folders)
    if len(python)!=0:
        table.append(python)
    if len(bash)!=0:
        table.append(bash)
    if len(others)!=0:
        table.append(others)

    all_table=[]

    for i in range(len(table)):
        for j in range(len(table[i])):
            all_table.append(table[i][j])
    
    print(lists.ls_the_list(all_table," "*5))
    
#install:
elif sys.argv[1]=="install":
    full_path=r""+sys.argv[2].replace('\\','\\\\')[0:len(sys.argv[2])]
    fp=sys.argv[2]
    fp=fp[0:len(fp)-1]
    f=open(f"{fp}\\install.reg","w")
    f.write('Windows Registry Editor Version 5.00\n')
    f.write('; code by : Boudjada Yasser (yasserbdj96)\n; email : yasser.bdj96@gmail.com\n; s')

    opts=[
            ['\n[HKEY_CLASSES_ROOT\*\shell\python3]',
             '\n@="Run With Python"',
             f'\n"Icon"="{full_path}\\\\python.ico"',
             '\n[HKEY_CLASSES_ROOT\*\shell\python3\command]',
             f'\n@="\\"{full_path}\\\\Console-Launcher.bat\\" python \\"%1\\""'],
            ['\n[HKEY_CLASSES_ROOT\Directory\Background\shell\python]',
             '\n@="Python Here"',
             f'\n"Icon"="{full_path}\\\\python.ico"',
             '\n[HKEY_CLASSES_ROOT\Directory\Background\shell\python\command]',
             f'\n@="\\"{full_path}\\\\Console-Launcher.bat\\" run \\"%V\\""'],
            ['\n[HKEY_CLASSES_ROOT\Directory\shell\python]',
             '\n@="Python Here"',
             f'\n"Icon"="{full_path}\\\\python.ico"',
             '\n[HKEY_CLASSES_ROOT\Directory\shell\python\command]',
             f'\n@="\\"{full_path}\\\\Console-Launcher.bat\\" run \\"%1\\""']]

    for k in range(len(opts)):
        for m in range(len(opts[k])):
            f.write(opts[k][m])
            
    f.write('\n; e')
    f.close()
    b=open(f"{fp}\\install.bat","w")
    b.write(f'@echo off\nREGEDIT.EXE /S "{full_path}\\install.reg"')
    b.close()
    subprocess.call([f'{fp}\\'+r'install.bat'])
    os.remove(f"{fp}\\install.bat")
    os.remove(f"{fp}\\install.reg")
    print("Installed successfully!")
    
#uninstall:
elif sys.argv[1]=="uninstall":
    full_path=r""+sys.argv[2].replace('\\','\\\\')[0:len(sys.argv[2])]
    fp=sys.argv[2]
    fp=fp[0:len(fp)-1]
    f=open(f"{fp}\\uninstall.reg", "w")
    f.write('Windows Registry Editor Version 5.00\n')
    f.write('\n[-HKEY_CLASSES_ROOT\Directory\shell\python]\n')
    f.write('[-HKEY_CLASSES_ROOT\*\shell\python3]\n')
    f.write('[-HKEY_CLASSES_ROOT\Directory\Background\shell\python]\n')
    f.close()
    b=open(f"{fp}\\uninstall.bat","w")
    b.write(f'@echo off\nREGEDIT.EXE /S "{full_path}\\uninstall.reg"')
    b.close()
    subprocess.call([f'{fp}\\'+r'uninstall.bat'])
    os.remove(f"{fp}\\uninstall.bat")
    os.remove(f"{fp}\\uninstall.reg")
    print("Uninstalled successfully!")