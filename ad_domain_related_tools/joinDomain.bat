@echo off
color 1e
::����˵����ʹ��˵��ע������
ECHO ����ʹ�ñ��ű�ǰ�޸���Ӧ�Ĳ���Ϊʵ��ֵ
set dns1=192.168.1.111
set dns2=192.168.1.222
set domainname=test
set domainadminname=lizhiqiang
set domainadminpassword=system
::�ж��Ƿ��Ѿ������������������ֱ����ת
::wmic ntdomain get domainname | findstr /i "%domainname%
::if %errorlevel% equ 0 echo �ü�����Ѿ������� && goto moveuser
ipconfig /all | findstr /i "%domainname%" >nul && echo �ü�����Ѿ�������,׼��ת�������ļ� && goto moveuser
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�жϵ�ǰ��½�û��Ƿ��й���ԱȨ�ޣ����û����ע���������Թ���Ա��½
:admin
ECHO ************************�жϵ�ǰ�û�Ȩ��******************
net user %username% | findstr "*Administrators" 
if %errorlevel% equ 1 (echo ��ǰ�û����Ǳ��ع���Ա����ע����ʹ���б��ع���ԱȨ�޵��û���¼) else (goto DNS)
set /p logoff=����Ҫע����
if /i "%logoff%"=="y" logoff 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�жϵ�ǰDNS�����Ƿ�Ϊָ����ַ��������ǣ�����յ�ǰ���ú���������DNS
:DNS
ECHO *************************����DNS****************************
netsh interface ip show dns | findstr "%dns1%" 1>nul && echo DNS�Ѿ�����Ϊ%dns1% && goto renamecomputername
echo �����������DNS...
for /f "skip=2 tokens=2,* " %%i in ('netsh interface show interface') do ( 
set netname=%%j
if "%%j"=="����" goto back
if "%%j"=="�ڲ�" goto back
netsh interface ip delete dns name="%%j" addr=all >nul
netsh interface ip add dns name="%%j" addr=%dns1% index=1 >nul
   netsh interface ip add dns name="%%j" addr=%dns2% index=2 >nul
)
:back
echo DNS�������
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�жϼ�������Ƿ��Ѿ����ģ�������������һ���֣���δ�����Ƿ���Ҫ���ļ��������������ɺ�Ҫ���������������
:renamecomputername
ECHO *********************���ļ������****************************
set a=%computername%
echo ��ǰ�������Ϊ��%a%
set /p b=������Ҫ�޸ĵļ��������(����������s)��
if /i "%b%"=="s" goto joindomain
if /i "%b%"=="" echo �����������Ϊ�� && goto renamecomputername
wmic computersystem Where name="%a%" call rename "%b%" >nul
if %errorlevel% equ 1 (echo ���ļ������ʧ��,���ֹ����� && pause && exit) else (echo ��������Ѹ���Ϊ%b%)
set /p reboot=���ļ��������ɣ�����Ҫ������?y/n:
if /i "%reboot%"=="y" shutdown /r /t 0 else (exit)
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�жϼ�����Ƿ��Ѽ�������������������һ���֣���������Ӧ�����Ƿ��������Զ��������û������벿�ֲ�����Ҫ���и��ģ�
:joindomain
ECHO ***********************�����������*************************
if /i "%userdomain%"=="TEST" goto moveuser 
rem �жϷ���TCP/IP NetBIOS HELPER�����Ƿ���û�δ������������������Ϊ�Զ���δ�������Զ�������������ʾ����������
sc query state= inactive | findstr /c:"TCP/IP NetBIOS" && (echo ����δ������������������... && sc config lmhosts start= auto && sc start lmhosts) || echo ����������
if /i "%userdomain%"=="%domainname%" do (echo ������Ѽ����� && goto moveuser)
.\netdom join %computername% /Domain:%domainname%.com /UserD:%domainadminname% /PasswordD:%domainadminpassword% || echo ������ʧ�ܣ��������绷��������������Ƿ���ȷ && goto end
set /p shutdown=��������ɣ�����Ҫ������?y/n:
if /i "%shutdown%"=="y" shutdown /r /t 0
goto end
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::ʹ��moveuser���߶��û������ļ�����Ǩ�ƣ���ʾ�û�����ҪǨ�Ƶ��û���ҪǨ�Ƶ����û���
:moveuser
ECHO *********************�û������ļ�Ǩ��*************************
if not exist moveuser.exe echo �뽫MOVEUSER���߷ŵ�ͬ�ļ������ٳ������� && goto end
net user
:retry
set /p user=��������ҪǨ�Ƶı����û��˻�����:
if /i "%user%"=="%username%" echo ת�Ƶ��û������ļ�Ϊ��ǰ��½�û���������������ʹ�������Ա��½�ٽ���ת�� && goto end
net user %user% 2>nul 1>nul || echo ������ı����˻�������,���������� && goto retry
set /p domainuser=��������ҪǨ�Ƶ������˺����ƣ�
net user %domainuser% /domain 2>nul 1>nul
if %errorlevel% neq 0 (echo ��Ҫת�Ƶ������˻���δ�������뽨�������³���Ǩ��) && goto end
moveuser %user% %domainname%.com\%domainuser% | findstr /i "failed" 2>nul 1>nul && echo �û������ļ�Ǩ��ʧ�ܣ��������� && goto end
::if %errorlevel% neq 0 echo �û������ļ�Ǩ��ʧ�ܣ��������� && goto end
echo �����ļ�Ǩ�Ƴɹ�����ע����ʹ���������˺ŵ�½
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::�����˳�
:end
pause>nul
exit