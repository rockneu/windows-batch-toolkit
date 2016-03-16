@echo off
echo 正在将本机脱离出域... ...
echo ..
netdom remove Rock-Desktop.szgdjt.local  /Domain:szgdjt.local /UserD:szgdjt\liuwei /PasswordD:666666	/SecurePasswordPrompt /Force

@echo %errorlevel%
if %errorlevel% gtr 0 (
	echo Failed to exit domain
	) else (
				echo Succeeded to exit domain SZGDJT!
				)
pause


