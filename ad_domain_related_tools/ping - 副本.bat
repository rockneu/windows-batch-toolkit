@rem for /l %%i in (1,1,255) do @echo %%i  --Êä³ö1 2 3 4 5  
@rem del /f pingResult.txt
rem "1"> pingResult.txt
@rem @for /L %%i in (1,1,15) do ping 192.168.8.%%i |find "TTL">>pingResult.txt
rem @for /L %%i in (1,1,15) do ping 192.168.8.%%i > pingResult.txt

rem for /l %%i in (1, 1, 15) do ping -a -n 1 192.168.8.%%i | find /i "reply" >> pingResult.txt
for /l %%i in (1, 1, 15) do ping -a -n 1 192.168.8.%%i 
echo "Ping is finished"

pause