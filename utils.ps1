<# Commandos uteis em powershell #>
<# Mapear unidade de rede #>
New-PSDrive -Name "DRIVER-LETTER" -PSProvider "FileSystem" -Root "\\DEVICE-NAME-OR-IP\SHARED-FOLDER" -Persist
