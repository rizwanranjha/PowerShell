# Check MFA Registration Status for All Users using Microsoft Graph
# Added by Muhammad Rizwan Ahmad
# MFA Registration Status Report using Microsoft Graph SDK (Supported)
# Added by Muhammad Rizwan Ahmad
# https://www.rizwanranjha.com

# Ensure Microsoft.Graph.Reports module is installed
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Reports)) {
    Install-Module Microsoft.Graph.Reports -Scope CurrentUser -Force -AllowClobber
}
Import-Module Microsoft.Graph.Reports

# Connect to Microsoft Graph with required scopes
Connect-MgGraph -Scopes "Reports.Read.All", "User.Read.All"

try {
    # Fetch MFA registration data for all users
    $mfaData = Get-MgReportAuthenticationMethodsUserRegistrationDetail -All

    # Extract relevant fields
    $mfaResults = $mfaData | Select-Object `
        UserDisplayName, `
        UserPrincipalName, `
        IsMfaRegistered, `
        IsPasswordlessCapable, `
        IsSsprRegistered, `
        DefaultMethod

    # Display as table
    Write-Host "`nMFA Registration Status Table:`n" -ForegroundColor Cyan
    $mfaResults | Format-Table -AutoSize

    # Export to CSV
    $csvPath = "MFA_Registration_Report.csv"
    $mfaResults | Export-Csv -Path $csvPath -NoTypeInformation
    Write-Host "`n MFA registration report saved to $csvPath" -ForegroundColor Green

} catch {
    Write-Host "`n Error occurred: $($_.Exception.Message)" -ForegroundColor Red
}

# Disconnect Graph session
Disconnect-MgGraph