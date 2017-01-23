param ([string] $name = 0)
$cert = Get-ChildItem -Path Cert:\$name\my  | Where {$_.FriendlyName -notlike ""} | Select -ExpandProperty FriendlyName
$idx = 1
write-host "{"
write-host " `"data`":[`n"
foreach ($currentcert in $cert)
{
    if ($idx -lt $cert.count)
    {
     
        $line= "{ `"{#CERTID}`" : `"" + $currentcert + "`" },"
        write-host $line
    }
    elseif ($idx -ge $cert.count)
    {
    $line= "{ `"{#CERTID}`" : `"" + $currentcert + "`" }"
    write-host $line
    }
    $idx++;
}
write-host
write-host " ]"
write-host "}"