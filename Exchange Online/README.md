Add Users to Microsoft 365 Distribution Group via PowerShell

This PowerShell script allows administrators to bulk add users to a Microsoft 365 (Exchange Online) distribution group using a CSV file. It connects securely to Exchange Online and processes each user email from the CSV, adding them to the specified distribution group.
🔧 Features

    ✅ Automatically connects to Exchange Online using Connect-ExchangeOnline.

    📥 Imports a CSV list of user emails.

    👥 Adds each user to the specified distribution group.

    ⚠️ Handles errors gracefully and logs meaningful messages.

    🖥️ Color-coded console output for clear status updates.

📁 Prerequisites

    Microsoft 365 Exchange Online PowerShell module

    Admin account with rights to manage distribution groups

    Internet connection to authenticate with Microsoft 365

📄 CSV Format

Place your employee email addresses in a CSV file named EmployeeList.csv with the following format:

EmployeeList.csv

Email
john.doe@example.com
jane.smith@example.com
michael.lee@example.com

    ✅ Ensure there are no extra columns or headers. The column name must be Email.

🧑‍💻 Script Usage

    Edit the following variables in the script:

$groupEmail = "itsupport@rizwanranjha.com"
$csvPath = "D:\Workspace\PowerShellScripts\EmployeeList.csv"

Run the script in PowerShell (with admin privileges):

Connect-ExchangeOnline -UserPrincipalName "admin@rizwanranjha.com"

Then execute the script.

🚨 Notes

    This script does not remove users — it only adds members.

    Ensure the emails are valid and the users exist in your tenant.

    You may need to allow PowerShell execution using:

    Set-ExecutionPolicy RemoteSigned

📬 License

MIT License

Let me know if you'd like a version with automated Connect-ExchangeOnline login prompts or advanced logging to file.