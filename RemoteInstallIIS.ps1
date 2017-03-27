Enable-PSRemoting -Force

$Computername = "Test_VM1"
$Username = "COELAB\jubera" 
$Password = "August@9797" 
$Credential = New-Object -TypeName System.Management.Automation.PSCredential $Username, ($Password | ConvertTo-SecureString -AsPlainText -Force)

$cred = Get-Credential -Credential $Credential



Invoke-command –computername $Computername -credential $cred –scriptblock {Install-WindowsFeature -Name "Web-Server" -IncludeAllsubFeature -IncludeManagementTools}
