param ([string] $name = 0)
$CertDate = (Get-ChildItem -Path Cert:\LocalMachine\MY\ |Where-Object {$_.FriendlyName -like "$name"} | Select-Object -Unique @{Expression={($_.NotAfter - (Get-Date)).Days}} | ft -hidetableheaders | out-string).split("`n") -match '\S'
Write-Output ($CertDate)