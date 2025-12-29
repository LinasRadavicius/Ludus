Import-Module GroupPolicy

$GpoName = "WEF-Cribl-PowerShell"
$DomainDN = "DC=sra,DC=dev"
$TargetOU = "$DomainDN"
$WecUrl = "Server=http://wef.sra.dev:5986/wsman/SubscriptionManager/WEC,Refresh=60"


$gpo = Get-GPO -Name $GpoName -ErrorAction SilentlyContinue
if (-not $gpo) {
    $gpo = New-GPO -Name $GpoName
} else {
	exit 1
}

$subMgrKey = "HKLM\Software\Policies\Microsoft\Windows\EventLog\EventForwarding\SubscriptionManager"

Set-GPRegistryValue `
    -Name $GpoName `
    -Key $subMgrKey `
    -ValueName "1" `
    -Type String `
    -Value $WecUrl


New-GPLink `
    -Name $GpoName `
    -Target "DC=sra,DC=dev" `
