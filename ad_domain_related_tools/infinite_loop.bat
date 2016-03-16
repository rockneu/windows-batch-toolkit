:loop
time /t >> ping.txt
ping -n 1 10.10.11.21 >>ping.txt
goto loop