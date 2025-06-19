# Email Alias List Update Script
# Added by Muhammad Rizwan Ahma
# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName "mrizwan@rizwanranjha.com"

# Path to CSV file
$csvPath = "D:\Workspace\PowerShellScripts\EmailAliasList.csv"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $primaryEmail = $user.Email.Trim()
    $newAlias = $user.AliasEmail.Trim()
    try {
        $mailbox = Get-Mailbox -Identity $primaryEmail -ErrorAction Stop

        # Check if alias already exists
        if ($mailbox.EmailAddresses -notcontains "smtp:$newAlias") {
            $newEmails = $mailbox.EmailAddresses + "smtp:$newAlias"

            # Update mailbox with new alias
            Set-Mailbox -Identity $primaryEmail -EmailAddresses $newEmails
            Write-Host "Alias " -NoNewline
            Write-Host "$newAlias" -ForegroundColor Cyan -NoNewline
            Write-Host " added to $primaryEmail"
        } else {
            Write-Host "Alias " -NoNewline
            Write-Host "$newAlias" -ForegroundColor Yellow -NoNewline
            Write-Host " already exists for $primaryEmail"
        }
    } catch {
        $reason = $_.Exception.Message.Trim()
        Write-Host "Failed to update " -NoNewline
        Write-Host "$primaryEmail" -ForegroundColor Red -NoNewline
        Write-Host ", Reason: $reason" -ForegroundColor DarkYellow
    }
}

# Disconnect session
Disconnect-ExchangeOnline -Confirm:$false