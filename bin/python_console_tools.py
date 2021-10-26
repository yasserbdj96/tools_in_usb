#!/usr/bin/env python
# coding:utf-8

import sys
from hexor import hexor

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
    if sys.argv[3]=="0":
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
"""

    print(help_t)