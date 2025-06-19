Exchange Online PowerShell Scripts

This folder contains PowerShell scripts for managing Microsoft 365 Exchange Online tasks. These scripts are designed to automate repetitive tasks such as managing distribution groups and updating mailbox aliases using structured CSV files.

    ✅ Make sure you have the necessary admin permissions and the Exchange Online PowerShell module installed before running these scripts.

📁 Available Scripts
1. Add Users to Distribution Group

Bulk adds users to a specified distribution group using a CSV file.

    Script: Add-DistributionGroupMembers.ps1

    CSV File: EmployeeList.csv

    Required Column: Email

    Main Cmdlet Used: Add-DistributionGroupMember

    📄 See detailed README

2. Email Alias List Update Script

Adds alias email addresses to user mailboxes based on CSV input.

    Script: Update-MailboxAlias.ps1

    CSV File: EmailAliasList.csv

    Required Columns: Email, AliasEmail

    Main Cmdlets Used: Get-Mailbox, Set-Mailbox

    Automatically checks if alias already exists before updating.

    📄 See detailed README (optional if you separate them later)

✅ Prerequisites

Before running any scripts:

    Install and import the Exchange Online PowerShell module:

Install-Module ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement

Connect using:

    Connect-ExchangeOnline -UserPrincipalName "<admin@domain.com>"

🛠 How to Use

    Clone or download this repo.

    Prepare the required CSV input as described for each script.

    Open PowerShell as Administrator.

    Navigate to the script folder and run the script.

    Follow on-screen prompts and logs for status updates.

🔐 Security Note

    Your scripts may contain email addresses or sensitive operations. Avoid sharing or committing actual credentials or production data.

    Always test scripts in a development environment before deploying them live.

📤 Coming Soon

    Shared mailbox automation

    Distribution list cleanup

    Email forwarding setup

    Out-of-office automation

👨‍💻 Author

Scripts maintained by Muhammad Rizwan Ahma
📜 License

MIT License