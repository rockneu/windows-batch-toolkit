@echo off
echo off
set svrIP=10.10.123.12
set svrPath=\\10.10.123.12\PSTools\
set user=szgdjt\administrator
set pass=Root@XXZX3b303

::net use %svrPath% /user:%user% %pass%
::net use \\10.10.123.12  /user:szgdjt\administrator Root@123
::net use \\%svrIP%  /user:%user% %pass% 
net use \\%svrIP%  /user:%user% %pass%  /persistent:y
xcopy /y /z "%svrPath%getInfo.bat"  "%windir%\system32\"
xcopy /y /z "%svrPath%getResc.vbs" "%windir%\system32\"
::net use \\%svrIP% /delete