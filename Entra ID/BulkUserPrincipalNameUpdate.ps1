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

# Import CSV with UPN mappings
$csvPath = "D:\Workspace\RizwanRanjhaGitHub\UserPrincipalNameList.csv"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $oldUPN = $user.OldUPN
    $newUPN = $user.NewUPN

    try {
        Update-MgUser -UserId $oldUPN -UserPrincipalName $newUPN
        Write-Host "Updated UPN: $oldUPN ➝ $newUPN" -ForegroundColor Green
    } catch {
        Write-Host "Failed to update $oldUPN. Reason: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Disconnect after updates
Disconnect-MgGraph