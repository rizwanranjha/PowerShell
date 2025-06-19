# Bulk Primary SMTP Address Update Script
# Author: Muhammad Rizwan Ahmad
# Updated to support bulk processing from CSV

# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName "mrizwan@rizwanranjha.com"

# Path to CSV file
$csvPath = "D:\Workspace\RizwanRanjhaGitHub\SMTPAddressList.csv"
# Import CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $primaryEmail = $user.oldEmail
    $newPrimary = $user.newEmail

    try {
        $mailbox = Get-Mailbox -Identity $primaryEmail -ErrorAction Stop
        $currentEmails = $mailbox.EmailAddresses
        $newPrimaryLower = $newPrimary.ToLower()

        $updatedEmails = @()
        $newPrimaryExists = $false

        foreach ($email in $currentEmails) {
            $emailStr = $email.ToString()
            $prefix, $addr = $emailStr.Split(":", 2)

            if ($addr.ToLower() -eq $newPrimaryLower) {
                $newPrimaryExists = $true
                continue
            }

            # Demote current primary
            if ($prefix -eq "SMTP") {
                $updatedEmails += "smtp:$addr"
            } else {
                $updatedEmails += $emailStr
            }
        }

        if (-not $newPrimaryExists) {
            $updatedEmails += "smtp:$newPrimaryLower"
            Write-Host "[$primaryEmail] Added new alias: $newPrimaryLower" -ForegroundColor Cyan
        }

        $updatedEmails += "SMTP:$newPrimaryLower"
        $finalEmails = $updatedEmails | Select-Object -Unique

        Set-Mailbox -Identity $primaryEmail -EmailAddresses $finalEmails
        Write-Host "[$primaryEmail] Successfully updated to primary SMTP: $newPrimary" -ForegroundColor Green
    }
    catch {
        Write-Host "[$primaryEmail] Failed to update. Reason: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Disconnect
Disconnect-ExchangeOnline -Confirm:$false
