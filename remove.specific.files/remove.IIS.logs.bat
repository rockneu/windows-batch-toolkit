
set mydir=%SystemDrive%\inetpub\logs\LogFiles

FORFILES /P %mydir% /d -14 /s /c ¡°cmd /c echo deleting @file ¡­ && del /q /f @path¡±


rem pause