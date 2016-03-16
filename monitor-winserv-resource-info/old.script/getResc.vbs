' Show name and IP here
WScript.Echo"====================================================="
WScript.Echo"====================================================="
Set m=CreateObject("WScript.Network")
WScript.Echo "Computer Name: " & m.ComputerName
Wscript.echo ""

'===========================================================================================================================================
'Show CPU usage info here
'===========================================================================================================================================
'Set objProc  = GetObject("winmgmts:\\.\root\cimv2:win32_processor='cpu0'")
'WScript.Echo  "CPU Usage Ratio: " & Round(objProc.LoadPercentage,2) & "%"
'WScript.echo ""
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")  
Set colItems = objWMIService.ExecQuery("Select * From Win32_Processor")  
i=0
load=0
For Each colItem In colItems  
	'WScript.echo "CPU"& i & " usage: " & colItem.LoadPercentage & "%"
	load=load+colItem.LoadPercentage
	i=i+1
Next  
WScript.echo "CPU usage: " & load/i & "%"
'WScript.echo "CPU usage: " & Round(load/i,2) & "%"
'WScript.echo "CPU usage: " & Round(load/i,1) & "%"

'===========================================================================================================================================
'Show memory usage info here
'===========================================================================================================================================
WScript.Echo ""

strComputer = "." 
set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\cimv2") 
set colOS = objWMI.InstancesOf("Win32_OperatingSystem") 
for each objOS in colOS
	Wscript.echo "Total Physical Memory: " & round(objOS.TotalVisibleMemorySize / 1024/1024) & " GB"
	Wscript.echo "Memory Usage Ratio: " & Round(((objOS.TotalVisibleMemorySize-objOS.FreePhysicalMemory)/objOS.TotalVisibleMemorySize)*100) & "%" 
	'strReturn = "内存总数: " & round(objOS.TotalVisibleMemorySize / 1024/1024) & " GB" &vbCrLf &"内存可用数: " & round(objOS.FreePhysicalMemory / 1024/1024) & " GB" 			& vbCrLf &"内存使用率 :" & Round(((objOS.TotalVisibleMemorySize-objOS.FreePhysicalMemory)/objOS.TotalVisibleMemorySize)*100) & "%" 
	'Wscript.Echo strReturn 
next


Wscript.Echo ""
'===========================================================================================================================================
'Show hard disk info here
'===========================================================================================================================================
Wscript.echo "Hard Disk Usage Ratio:"
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Const HARD_DISK = 3
Set colDisks = objWMIService.ExecQuery _
("Select * from Win32_LogicalDisk Where DriveType = " & HARD_DISK & "")
For Each objDisk in colDisks
' Disk label size
'Wscript.Echo objDisk.DeviceID & " Total: " & CLng(objDisk.Size/1024/1024/1024) & "G，Available: " & Clng(objDisk.FreeSpace/1024/1024/1024) & "G"
Wscript.Echo objDisk.DeviceID & " " & CLng(objDisk.Size/1024/1024/1024) & "G,Usage Ratio: " & FormatPercent(1-objDisk.freespace/objDisk.size)
'Wscript.Echo objDisk.DeviceID & " Hard Disk Usage Ratio: " & FormatPercent(objDisk.freespace/objDisk.size)
Next
Wscript.Echo ""