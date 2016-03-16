@echo off
set str=str
set "str=%str:str=>nul & dir/b%"
set "str=%str:str=>nul & for /f %%i in ('netstat -an | find ":80" /c') do set cnt=%%i%"
echo %str%
pause>nul