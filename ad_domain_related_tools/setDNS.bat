@echo ��ʼ����DNS
@echo ...
@echo ...
@echo off

set dns1=10.10.10.4
::set dns1=61.177.7.1
set dns2=10.10.10.5
set domain=szgdjt.local

netsh interface ip set dns name="��������" source=static addr=%dns1% register=PRIMARY
::@echo %errorlevel%
::if %errorlevel% equ 1 (echo 
::�޸�DNS����
::pause) else (goto domainPart)

:domainPart
@echo ...
@echo ...
::@echo ��ʼ�������������
::netsh interface ip set dns name="��������" source=static addr=%dns1% register=PRIMARY 
netsh interface ip add dns name="��������" %dns2% index=2
@echo ...
@echo ...
@echo �޸Ľ����������޸��Ƿ�ɹ���
pause

