Enable-PSRemoting -Force

$Computername = "Test_VM1"
$Username = "COELAB\jubera" 
$Password = "August@9797" 
$Credential = New-Object -TypeName System.Management.Automation.PSCredential $Username, ($Password | ConvertTo-SecureString -AsPlainText -Force)

$cred = Get-Credential -Credential $Credential


Invoke-command –computername $Computername -credential $cred –scriptblock {Import-Module WebAdministration;cd iis:\Sites;Remove-Item 'IIS:\Sites\Default Web Site' -recurse -Force}
Invoke-command –computername $Computername -credential $cred –scriptblock {Import-Module WebAdministration;cd iis:\Sites;New-Item IIS:\sites\index -bindings @{protocol="http";Bindinginformation=":80:"} -physicalpath "C:\web" -Force}
