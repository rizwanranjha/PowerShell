# Primary SMTP Address Update Script
# Added by Muhammad Rizwan Ahmad
# https://www.rizwanranjha.com
# Entra ID (Azure AD) - Update UserPrincipalName Script
# Requires Microsoft Graph SDK
# Ensure the Microsoft.Graph.Users module is installed and imported
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Users)) {
    Install-Module Microsoft.Graph.Users -Scope CurrentUser -Force -AllowClobber
}
Import-Module Microsoft.Graph.Users

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# UPN Update
$oldUPN = "admin@rizwanranjha.com"
$newUPN = "admin@expertsols.com"

try {
    Update-MgUser -UserId $oldUPN -UserPrincipalName $newUPN
    Write-Host "UserPrincipalName updated to: $newUPN" -ForegroundColor Green
} catch {
    Write-Host "Failed to update UPN. Reason: $($_.Exception.Message)" -ForegroundColor Red
}

# Disconnect
Disconnect-MgGraph