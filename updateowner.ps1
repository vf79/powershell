$folder = "<directory>"
$ACL = Get-Acl -Path $folder
$User = New-Object System.Security.Principal.Ntaccount ("<user>") 
$ACL.SetOwner($User)
$ACL | Set-Acl -Path $folder
Get-ACL -Path $folder