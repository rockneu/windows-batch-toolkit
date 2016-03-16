@echo 开始更改DNS
@echo ...
@echo ...
@echo off

set dns1=10.10.10.4
::set dns1=61.177.7.1
set dns2=10.10.10.5
set domain=szgdjt.local

netsh interface ip set dns name="本地连接" source=static addr=%dns1% register=PRIMARY
::@echo %errorlevel%
::if %errorlevel% equ 1 (echo 
::修改DNS出错！
::pause) else (goto domainPart)

:domainPart
@echo ...
@echo ...
::@echo 开始将计算机加入域
::netsh interface ip set dns name="本地连接" source=static addr=%dns1% register=PRIMARY 
netsh interface ip add dns name="本地连接" %dns2% index=2
@echo ...
@echo ...
@echo 修改结束，请检查修改是否成功！
pause

