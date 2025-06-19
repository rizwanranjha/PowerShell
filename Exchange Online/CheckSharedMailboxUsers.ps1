# Email Alias List Update Script
# Added by Muhammad Rizwan Ahmad
# https://www.rizwanranjha.com
# Connect to Exchange Online
Connect-ExchangeOnline

# Get all shared mailboxes
$sharedMailboxes = Get-Mailbox -RecipientTypeDetails SharedMailbox

foreach ($mailbox in $sharedMailboxes) {
    Write-Output "Shared Mailbox: $($mailbox.DisplayName) <$($mailbox.PrimarySmtpAddress)>"
    Write-Output "--------------------------------------------------------------"

    # Full Access permissions
    $fullAccess = Get-MailboxPermission -Identity $mailbox.Identity | Where-Object {
        $_.User.ToString() -ne "NT AUTHORITY\SELF" -and
        $_.AccessRights -contains "FullAccess"
    }

    if ($fullAccess) {
        Write-Output "Full Access:"
        $fullAccess | ForEach-Object {
            Write-Output "  - $($_.User)"
        }
    } else {
        Write-Output "Full Access: None"
    }

    # Send As permissions
    $sendAs = Get-RecipientPermission -Identity $mailbox.Identity -ErrorAction SilentlyContinue | Where-Object {
        $_.Trustee -ne "NT AUTHORITY\SELF"
    }

    if ($sendAs) {
        Write-Output "Send As:"
        $sendAs | ForEach-Object {
            Write-Output "  - $($_.Trustee)"
        }
    } else {
        Write-Output "Send As: None"
    }

    # Send on Behalf permissions
    $sendOnBehalf = Get-Mailbox -Identity $mailbox.Identity | Select-Object -ExpandProperty GrantSendOnBehalfTo
    if ($sendOnBehalf) {
        Write-Output "Send on Behalf:"
        $sendOnBehalf | ForEach-Object {
            Write-Output "  - $($_.Name)"
        }
    } else {
        Write-Output "Send on Behalf: None"
    }

    Write-Output "`n"
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false