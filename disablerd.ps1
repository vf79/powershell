Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
#Disable-NetFirewallRule -DisplayGroup "Remote Desktop"