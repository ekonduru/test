Enable-PSRemoting -Force

$Computername = "COELAB-HV6"
$Username = "COELAB\jubera" 
$Password = "August@9797" 
$Credential = New-Object -TypeName System.Management.Automation.PSCredential $Username, ($Password | ConvertTo-SecureString -AsPlainText -Force)

$cred = Get-Credential -Credential $Credential 



Invoke-command –computername $Computername -credential $cred –scriptblock {New-VM -name IIS_Image -MemoryStartupBytes 2048MB -Path "J:\Image\IIS" -Switchname "vswitch-hv1"}
Invoke-command –computername $Computername -credential $cred –scriptblock {New-VHD -path "J:\Image\IIS\IIS_Image.vhdx" -SizeBytes 30GB -dynamic}
Invoke-command –computername $Computername -credential $cred –scriptblock {Add-VMHardDiskDrive -VMName IIS_Image -ControllerType IDE -ControllerNumber 1 -ControllerLocation 1 -Path "J:\Backup_export\Base_2012_Server.vhdx"}
Invoke-command –computername $Computername -credential $cred –scriptblock {Start-VM IIS_Image}


