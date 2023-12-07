$computer_name = Get-WMIObject Win32_ComputerSystem | Select-Object -ExpandProperty name
Write-Host $computer_name
$confirmation = Read-Host "Do you want to rename computer?"
if ($confirmation.ToUpper() -eq 'Y') {
    $new_name = Read-Host "New computer name: "
    Write-Host "Rename and restart computer."
    Rename-Computer -NewName "$new_name" -Restart
}
