' Show name and IP here
WScript.Echo"====================================================="
WScript.Echo"====================================================="
Set m=CreateObject("WScript.Network")
WScript.Echo "Computer Name: " & m.ComputerName
WScript.Echo ""

'===========================================================================================================================================
'Show CPU usage info here
'===========================================================================================================================================
Set objProc  = GetObject("winmgmts:\\.\root\cimv2:win32_processor='cpu0'")
WScript.Echo  "CPU Usage Ratio: " & Round(objProc.LoadPercentage,2) & "%"
WScript.echo ""
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")  
Set colItems = objWMIService.ExecQuery("Select * From Win32_Processor")  
'Set objSWbemObjectSet = objWMIService.InstancesOf("Win32_Processor")  
i=0
For Each colItem In colItems  
	WScript.echo "CPU"& i & " usage: " & colItem.LoadPercentage & "%"
	i=i+1
Next  

'===========================================================================================================================================
'Show memory usage info here
'===========================================================================================================================================
WScript.Echo ""

' to remove this part --begin
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery("Select * from Win32_PhysicalMemory",,48)
For Each objItem in colItems
	memory = CSng(memory) + CSng(objItem.capacity)
Next

Wscript.Echo "Total Physical Memory：" & memory/1024/1024/1024 & "G"

set objRefresher = CreateObject("WbemScripting.SWbemRefresher")
Set objMemory = objRefresher.AddEnum _
(objWMIService, "Win32_PerfFormattedData_PerfOS_Memory").objectSet
objRefresher.Refresh
objRefresher.Refresh
objRefresher.Refresh

For each myMemory in objMemory
'Wscript.Echo "Available Memory：" & myMemory.AvailableBytes/1024/1024/1024  & "G"
'Wscript.Echo "Used Memory：" & myMemory.CommittedBytes/1024/1024/1024 & "G"
	Wscript.Echo "Memory Usage Ratio: " & FormatPercent(myMemory.CommittedBytes/memory)
Next
' to remove --end


strComputer = "." 
set objWMI = GetObject("winmgmts:\\" & strComputer & "\root\cimv2") 
set colOS = objWMI.InstancesOf("Win32_OperatingSystem") 
for each objOS in colOS
	Wscript.echo "Total Physical Memory: " & round(objOS.TotalVisibleMemorySize / 1024/1024) & " GB"
	Wscript.echo ""
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