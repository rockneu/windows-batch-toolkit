@echo off
:: try adding to target domain
::get pc name
set pcName=%computername%
::echo %pcName%
echo ���ڽ�����������... ...
echo ..
netdom join %pcName% /Domain:szgdjt.local /UserD:liuwei@szgdjt.com /PasswordD:666666  /SecurePasswordPrompt
::if %errorlevel% gtr 0 (
::	echo ������ʧ�ܣ�
::	) else (
::				echo �ɹ�������SZGDJT��
::				)
pause


