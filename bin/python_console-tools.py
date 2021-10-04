#!/usr/bin/env python
# coding:utf-8

import sys
from hexor import hexor

p1=hexor(True,"hex")

red="#ea4335"
blue="#4285f4"
yallew="#fbbc05"
green="#34a853"

#ls:
def ls():
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
    try:
        on=p1.c('==> ',yallew)+p1.c(f'python{sys.argv[2]}, pip{sys.argv[2]}',green)
    except:
        on=p1.c('==> ',yallew)+p1.c('python, pip ',green)+p1.c(' ==> ',yallew)+p1.c('[Default]',blue)
        
    hashx=p1.c('[#] ',yallew)
    version=f'Python {sys.version.split("(")[0]}'

    ve=" "*int(sps-len(version))
    
    print(hashx+p1.c(version,red)+ve+on)
    
##
elif sys.argv[1]=="-opt_3":
    #print(sys.argv[2])
    #print("hiiiiiiiii")
    
    USERNAME=p1.c("!USERNAME!",green)
    COMPUTERNAME=p1.c("!COMPUTERNAME!",green)
    CD=p1.c("!CD!",yallew)
    
    if sys.argv[2]=="true":
        ccd=red
    else:
        ccd=blue
        
    s1=p1.c("!s1!",ccd)
    s2=p1.c("!s2!",ccd)
    s3=p1.c("!s3!",ccd)
    a=p1.c("!a!",ccd)
    
    at=p1.c("@",ccd)
    
    xx=f"""echo {s1+USERNAME+at+COMPUTERNAME+s2+CD+s3}\nset /p input_c={a} """
    print(xx)
    #print("echo ┌──(%USERNAME%@%COMPUTERNAME%)──[%CD%]\nset /p input_c=!a!")