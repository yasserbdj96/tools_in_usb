try:
    exec('print "this is python2"')
except:
    exec('print("this is python3")')
    
    
import sys
print(sys.version)