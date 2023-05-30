$Name = "Aluno"
$FullName = "Aluno"
$Password = "terra23" | ConvertTo-SecureString -AsPlainText -Force
$Description = "Aluno standard user account."

New-LocalUser -Name $Name -FullName $FullName -Password $Password -Description $Description