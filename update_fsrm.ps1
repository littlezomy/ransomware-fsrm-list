#This script updates the FSRM files group using content from this github repository.

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$list = (Invoke-WebRequest "https://raw.githubusercontent.com/littlezomy/ransomware-fsrm-list/main/ransomware-fsrm-list.txt").Content

$filesgroup = @()

foreach($line in $list.Split("`r`n")){ if ($line -ne "") {$filesgroup += $line} }

Get-FsrmFileGroup "name_group" | Set-FsrmFileGroup -IncludePattern $filesgroup