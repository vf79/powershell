$name = $args[0]
$curDir = Get-Location
$fileDir = ("$curDir\info.txt")
$ip = Get-NetIPAddress -AddressFamily IPv4 | Format-Table

Add-Content - Path $fileDir -Value '{"host":"'$name'" , "ip":"'$ip'"}'

Rename-Computer -NewName "$name" -DomainCredential Domain01\Admin01 -Restart



