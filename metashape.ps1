$name = Read-Host "Computer name: "
$curDir = Get-Location
$fileDir = ("$curDir\info\$name.txt")
$mshPath = ("$curDir\metashape-pro_2_0_1_x64.msi")
$count = 1

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
#Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

function InstallFile {
    Param($Source, $id)
        Write-Host "$id -> Instalando: $Source"  -ForegroundColor Green
        Start-Process "$Source" -wait
}

#InstallFile -Source $mshPath -id $count

$ip = Get-NetIPAddress -AddressFamily IPv4 | Format-Table
$fip = $ip | Out-String
Add-Content -Path $fileDir -Value $fip

$confirmation = Read-Host "Do you want to rename computer?"
if ($confirmation -eq 'y') {
    Write-Host "Rename and restart computer."
    Rename-Computer -NewName "$name" -Restart
}
