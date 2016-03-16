

rem FORFILES /P E:\living\english  /d -10 /s
rem FORFILES /P E:\living\english  /d -10 /s /c "cmd /c echo @file ..."

set mydir=C:\inetpub\logs\LogFiles\FTPSVC1
 FORFILES /P %mydir%  /d -200 /s /c "cmd /c echo deleting @file ... && del /q /f @path"
rem FORFILES /P %mydir%  /d -300 /s /c "cmd /c echo deleting @file ... "
pause


data
From:76126128@qq.com
To:liuwei@sz-mtr.com
Subject:test
 
test
 
.



telnet 10.10.10.40 25
HELO
MAIL FROM:abc@server.com
RCPT TO:liuwei@sz-mtr.com
subject:this is subject

this is body

.


telnet xxx.domainname.com 25
    helo sz-mtr.com
mail from: abc@domain.com
rcpt to:liuwei@sz-mtr.com
data 

to: liuwei@sz-mtr.com
from: abc@domain.com
Subject:This is a test

Testing

.
