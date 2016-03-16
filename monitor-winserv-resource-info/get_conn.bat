:: This script is used to get connection count on the specified port with the specified state
::
::	parameter1	 ip address as input parameter
::	parameter2	 port
::	parameter3	connection state: listening, establish, close_wait, syn_sent
::	parameter4	warning criteria
::	parameter5	critical criteria
::	example		get-conn.bat 10.10.10.71 80 estab 100 200
::	2013-11-04

@echo off

rem netstat -an | find "10.10.10.57:80"   /c
if {%1}=={} goto noparms
:: print help msg
if "%1"=="-h" echo "get-conn.bat  ip  port  state  warn  crit"
if {%2}=={} goto noparms
if {%3}=={} goto noparms



netstat -an | find "%1:%2" | find "%3" /i /c > conn.txt
for /f "delims=" %%i in (conn.txt) do set cnt=%%i

if {%4}=={} (
	set msg="OK - %3 connection count:%cnt%"
	goto exit0
	)

if %cnt% lss %4 (
	echo OK - %3 connection:%cnt%^|'count'=%cnt%;%4;%5;0;1000
	goto exit0
	)

if %cnt% gtr %5 (
	echo Critical - %3 connection:%cnt%^|'count'=%cnt%;%4;%5;0;1000
	goto exit0) else (
	echo Warning - %3 connection:%cnt%^|'count'=%cnt%;%4;%5;0;1000
	goto exit0
	)


:exit0

::pause

:noparms
exit 0
