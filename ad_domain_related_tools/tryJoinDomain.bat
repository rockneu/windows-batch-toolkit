@echo off
:: try adding to target domain
::get pc name
set pcName=%computername%
::echo %pcName%
echo 正在将本机加入域... ...
echo ..
netdom join %pcName% /Domain:szgdjt.local /UserD:liuwei@szgdjt.com /PasswordD:666666  /SecurePasswordPrompt
::if %errorlevel% gtr 0 (
::	echo 加入域失败！
::	) else (
::				echo 成功加入域SZGDJT！
::				)
pause


