# 📘 Microsoft Entra ID (Azure AD) PowerShell Scripts

Welcome to the **Entra ID** script collection! These PowerShell automation tools are designed to streamline identity management tasks in Microsoft Entra ID (formerly Azure Active Directory). Use them to manage user accounts, update UPNs, and monitor MFA status efficiently.

## 📂 Scripts Included

### 1. **BulkUserPrincipalNameUpdate**
- 📌 Bulk updates User Principal Names (UPNs) for users.
- 📥 Accepts a CSV input with old and new UPNs.
- ✅ Validates users and reports status of each update.

### 2. **GetAllUserPrincipalName**
- 📄 Retrieves a list of all users and their current UPNs.
- Useful for audits, migrations, or as input for the bulk UPN update script.

### 3. **SingleUserPrincipalNameUpdate**
- 👤 Allows targeted update of a single user's UPN.
- Useful for handling exceptions or small-scale updates.

### 4. **UsersMFARegistrationStatus**
- 🔐 Generates a report on users' MFA registration status.
- Helps identify users not yet registered for MFA.
- Ideal for compliance and security reviews.

## 🧾 Goals

- Simplify Entra ID administrative workflows
- Ensure support for bulk and individual user operations
- Provide meaningful logging and feedback in the console
- Use standardized CSV input formats for scalability

## 🛠️ Requirements

- PowerShell 7+ or Windows PowerShell 5.1+
- Admin permissions for Microsoft Entra ID
- Required module:  
  - [`Microsoft.Graph`](https://learn.microsoft.com/powershell/microsoftgraph/overview)  

> 💡 Make sure to authenticate with the correct Microsoft Graph permissions depending on the script.

## 📁 Example CSV Formats

Each script that accepts a CSV input includes a sample format in its own directory or inline in the script header. Always validate data before executing bulk operations.

## 🤝 Contributing

We welcome contributions! Please ensure your scripts:
- Follow PowerShell best practices
- Include error handling and user feedback
- Provide example CSVs if applicable

## 📜 License

MIT License