:: show time diff between local host and remote server
:: w32tm /stripchart /computer:210.72.145.44 /samples:30 /dataonly

:: show current time sync server
:: w32tm /query /source

:: w32tm /config /manualpeerlist:"210.72.145.44" /syncfromflags:manual /reliable:yes /update

w32tm /config /manualpeerlist:"10.10.11.21" /syncfromflags:manual /reliable:yes /update