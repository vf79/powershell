$rule = "Rule Name"
$newips = @(
    "192.168.55.0/24",
    "192.168.82.0/24",
    "192.168.102.0/24"
)

$program = (Get-NetFirewallRule -DisplayName $rule | Get-NetFirewallApplicationFilter).Program
$ips = (Get-NetFirewallRule -DisplayName $rule | Get-NetFirewallAddressFilter ).RemoteAddress

$ipsenews = $ips + $newips
$ipconcat = $ipsenews | Select-Object -Unique | Sort-Object
Remove-NetFirewallRule -DisplayName $rule
New-NetFirewallRule -DisplayName $rule -Protocol "TCP"
New-NetFirewallRule -DisplayName $rule -Protocol "UDP"
Set-NetFirewallRule -DisplayName $rule -Program $program
Set-NetFirewallRule -DisplayName $rule -RemoteAddress $ipconcat
