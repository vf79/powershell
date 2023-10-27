$computer_name = Get-WMIObject Win32_ComputerSystem | Select-Object -ExpandProperty name
Write-Host $computer_name
$confirmation = Read-Host "Do you want to rename computer?"
if ($confirmation.ToUpper() -eq 'Y') {
    $new_name = Read-Host "New computer name: "
    Write-Host "Rename and restart computer."
    Rename-Computer -NewName "$new_name" -Restart
}


$curDir = Get-Location
$fileDir = ("$curDir\info\info.txt")
$wskDir = ("$curDir\info\infowsk.txt")
$mshPath = ("$curDir\metashape_2_0_3_x64.msi")
$count = 1

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

function InstallFile {
    Param($Source, $id)
        Write-Host "$id -> Instalando: $Source"  -ForegroundColor Green
        Start-Process "$Source" -wait
}


InstallFile -Source $mshPath -id $count

$ip = Get-NetIPAddress -AddressFamily IPv4 | Format-Table
$fip = $ip | Out-String
Add-Content -Path $fileDir -Value $fip

$confirmation = Read-Host "WSK save?"
if ($confirmation.ToUpper() -eq 'Y') {
    $wsk = Read-Host "Digite o wsk: "
    $value = $computer_name ": " $wsk
    Add-Content -Path $wskDir -Value $value
}
