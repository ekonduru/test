Enable-PSRemoting -Force

$Computername = "COELAB-HV6"
$Username = "COELAB\jubera" 
$Password = "August@9797" 
$Credential = New-Object -TypeName System.Management.Automation.PSCredential $Username, ($Password | ConvertTo-SecureString -AsPlainText -Force)

$cred = Get-Credential -Credential $Credential 



Invoke-command –computername $Computername -credential $cred –scriptblock {Export-VM -Name Base_2012_Server -Path J:\export}

Invoke-command –computername $Computername -credential $cred –scriptblock {Copy-Item -Path "J:\export\Base_2012_Server\Virtual Hard Disks\Base_2012_Server.vhdx" -destination "J:\Backup_export"}



 