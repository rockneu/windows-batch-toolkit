function Addmailbox { 
  Enable-Mailbox ($_.split(","))[1] -Alias ($_.split(","))[2] 
  Set-CasMailbox -MAPIEnabled $false -Identity ($_.split(","))[1]  //ȡ��Ĭ�ϵ�Exchange MAPI ���ܡ������Ҫ������ɾ����䡣
}
gc E:\L2-account.csv | foreach {Addmailbox}

echo .
echo .

function Addprint {
echo ��ע����ʻ�����: ($_.split(","))[0] 
echo ��ע����ʼ���ַ��: ($_.split(","))[1]
}
