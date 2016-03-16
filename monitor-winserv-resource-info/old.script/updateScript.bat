::===============================================================================================================================
::This script calls copyScript.bat to do script updating(copy getInfo.bat and getResc.vbs to server's system32 directory)
::
::Author:	liuwei
::Date:	2012-09-11

:: net session /delete may be the solution for "无效驱动器规格"
::===============================================================================================================================
@echo off
@echo Updating scripts ... ...

set user=szgdjt\administrator
set pass=Root@XXZX3b303
::set basePath=D:\tech\source\batch\get_sys_resource\PSTools\
set basePath=%cd%\
echo basePath: %basePath%

psexec @%basePath%svrlist.txt -c -f  %basePath%copyScript.bat -u %user% -p %pass%
@echo Finished updating.

pause