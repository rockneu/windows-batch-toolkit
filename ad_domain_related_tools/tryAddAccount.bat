:: This script is designed to add domain accounts to local administrators group
:: Rock Liu
:: 2012-04-05

@echo off
:: this is a valid cmd
::net group "domain admins" yinxiaoyong /add /domain
::net localgroup administrators szgdjt\yinxiaoyong /add
::net localgroup administrators yin /add

set /p domainUser=请输入使用本机的域账号:
::@echo %domainUser%
@echo 将%domainUser%加入本机管理员... ...
echo ..
::echo szgdjt\%domainUser%
net localgroup administrators szgdjt\%domainUser% /add
if %errorlevel% equ 0 (
									echo 成功加入本地管理员组！
									)
pause


