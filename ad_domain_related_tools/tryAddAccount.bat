:: This script is designed to add domain accounts to local administrators group
:: Rock Liu
:: 2012-04-05

@echo off
:: this is a valid cmd
::net group "domain admins" yinxiaoyong /add /domain
::net localgroup administrators szgdjt\yinxiaoyong /add
::net localgroup administrators yin /add

set /p domainUser=������ʹ�ñ��������˺�:
::@echo %domainUser%
@echo ��%domainUser%���뱾������Ա... ...
echo ..
::echo szgdjt\%domainUser%
net localgroup administrators szgdjt\%domainUser% /add
if %errorlevel% equ 0 (
									echo �ɹ����뱾�ع���Ա�飡
									)
pause


