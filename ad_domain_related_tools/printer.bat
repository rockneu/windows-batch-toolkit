net stop spooler
del c:\windows\system32\spool\printers\*.* /Q /F
net start spooler