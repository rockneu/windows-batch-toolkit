::===============================================================================================================================
::This script calls getInfo.bat to get system resource usage info.
::
::Author:	liuwei
::Date:	2012-09-11
::===============================================================================================================================

@echo off
::set basePath=D:\tech\source\batch\get_sys_resource\PSTools\
set basePath=%cd%\
psexec @%basePath%svrlist.txt getInfo.bat
::start  psexec @%basePath%svrlist1.txt getInfo.bat
::start  psexec @%basePath%svrlist2.txt getInfo.bat

pause