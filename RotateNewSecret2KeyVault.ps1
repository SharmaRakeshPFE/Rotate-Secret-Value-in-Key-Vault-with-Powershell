##AUTHOR - RAKESH SHARMA##
##MODULE 2#
##DESC - Initiate once AD password\SQL login Password is Changed
##Please test this script thouroughly on Dev\Test before hitting produciton##
Install-Module Azure
Install-Module Microsoft.PowerShell.SecretManagement
Install-Module Microsoft.PowerShell.SecretStore
Install-Module AzureRM.KeyVault
Install-Module Az.KeyVault.


Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Microsoft.PowerShell.SecretStore
Import-Module AzureRM.KeyVault
Import-Module Az.KeyVault

Login-AzureRmAccount        
$VaultName = "rskeyvaulttest"
$SecretName = "SQLsa"
$OldSecret = ConvertTo-SecureString -String 'P@ssword1234' -AsPlainText -Force
$NewSecret = ConvertTo-SecureString -String 'P@ssword0987' -AsPlainText -Force
$ContentType = 'txt'
Set-AzureKeyVaultSecret -VaultName $VaultName -Name $SecretName -SecretValue $OldSecret -Disable
Set-AzureKeyVaultSecret -VaultName $VaultName -Name $SecretName -SecretValue $NewSecret -ContentType $ContentType -Tags $Tags
