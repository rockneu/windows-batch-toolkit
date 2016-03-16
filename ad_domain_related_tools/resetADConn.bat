:: this batch is used to reset the secure connenction between the computer and AD

@echo off

netdom reset %computername% /domain: szgdjt.local

pause