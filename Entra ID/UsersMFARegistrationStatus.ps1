# Check MFA Registration Status for All Users using Microsoft Graph
# Author: Muhammad Rizwan Ahmad
# Website: https://www.rizwanranjha.com

# Ensure Microsoft.Graph.Reports module is installed
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.Reports)) {
    Install-Module Microsoft.Graph.Reports -Scope CurrentUser -Force -AllowClobber
}
Import-Module Microsoft.Graph.Reports

# Connect to Microsoft Graph with required scopes
Connect-MgGraph -Scopes "Reports.Read.All", "User.Read.All"

try {
    Write-Host "`nFetching MFA registration data for all users..." -ForegroundColor Cyan

    # Fetch all raw data
    $rawData = Get-MgReportAuthenticationMethodUserRegistrationDetail -All

    # Process and flatten data
    $cleanedData = $rawData | ForEach-Object {
        [PSCustomObject]@{
            Id                                     = $_.Id
            IsAdmin                                = $_.IsAdmin
            IsMfaCapable                           = $_.IsMfaCapable
            IsMfaRegistered                        = $_.IsMfaRegistered
            IsPasswordlessCapable                  = $_.IsPasswordlessCapable
            IsSsprCapable                          = $_.IsSsprCapable
            IsSsprEnabled                          = $_.IsSsprEnabled
            IsSsprRegistered                       = $_.IsSsprRegistered
            IsSystemPreferredAuthenticationMethodEnabled = $_.IsSystemPreferredAuthenticationMethodEnabled
            LastUpdatedDateTime                    = $_.LastUpdatedDateTime

            MethodsRegistered                      = ($_.MethodsRegistered -join ", ")
            SystemPreferredAuthenticationMethods   = ($_.SystemPreferredAuthenticationMethods -join ", ")
            UserPreferredMethodForSecondaryAuthentication = $_.UserPreferredMethodForSecondaryAuthentication

            UserDisplayName                        = $_.UserDisplayName
            UserPrincipalName                      = $_.UserPrincipalName
            UserType                               = $_.UserType

            # Flatten AdditionalProperties dictionary (if any)
            AdditionalProperties = if ($_.AdditionalProperties) {
                ($_.AdditionalProperties.GetEnumerator() | ForEach-Object {
                    "$($_.Key)=$($_.Value)"
                }) -join "; "
            } else {
                ""
            }
        }
    }

    # Display to console
    $cleanedData | Format-Table -AutoSize

    # Export to CSV
    $filePath = "MFA_Registration_Report.csv"
    $cleanedData | Export-Csv -Path $filePath -NoTypeInformation -Encoding UTF8

    Write-Host "`n Human-readable MFA registration report saved to $filePath" -ForegroundColor Green

} catch {
    Write-Host "`n Error occurred: $($_.Exception.Message)" -ForegroundColor Red
}

# Disconnect
Disconnect-MgGraph