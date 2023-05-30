$Usuarios = Get-LocalUser
Write-Host "$Usuarios"
$Password = (Read-Host -Prompt "New Password" -AsSecureString)
$User = (Read-Host -Prompt "Username")
$UserAccount = Get-LocalUser -Name $User
$UserAccount | Set-LocalUser -Password $Password
