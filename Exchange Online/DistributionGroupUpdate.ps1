Connect-ExchangeOnline -UserPrincipalName "admin@rizwanranjha.com"

$groupEmail = "itsupport@rizwanranjha.com"
$csvPath = "D:\Workspace\PowerShellScripts\MacrosoftPakistanEmployeeList.csv"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $userEmail = $user.Email.Trim()
    try {
        Add-DistributionGroupMember -Identity $groupEmail -Member $userEmail -ErrorAction Stop
        Write-Host "Added or Updated " -NoNewline
        Write-Host "$userEmail" -ForegroundColor Cyan -NoNewline
        Write-Host " to $groupEmail Email Group"
    } catch {
        $reason = $_.Exception.Message.Trim()
        Write-Host "No Update to " -NoNewline
        Write-Host "$userEmail" -ForegroundColor Red -NoNewline
        Write-Host " Email Address, Reason: $reason" -ForegroundColor DarkYellow
    }
}