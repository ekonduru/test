Enable-PSRemoting -Force

$Computername = "Test_VM1"
$Username = "COELAB\jubera" 
$Password = "August@9797" 
$Credential = New-Object -TypeName System.Management.Automation.PSCredential $Username, ($Password | ConvertTo-SecureString -AsPlainText -Force)

$cred = Get-Credential -Credential $Credential 



$file = "D:\index.html"
$content = Get-Content -Path $file

Invoke-command –computername $Computername -credential $cred –scriptblock {New-Item -Path "C:\web" -Type Directory -force}
Invoke-command –computername $Computername -credential $cred –scriptblock {Param($Content,$Path);$content | out-file -FilePath $path -Encoding ascii;} -ArgumentList @($content,"c:\web\index.html")
