﻿
rem for /l %i in (1,1,5) do ping 192.168.8.%i -n 1
for /l %%i in (1,1,5) do ping 192.168.8.%%i -n 1
echo "Ping is finished"
