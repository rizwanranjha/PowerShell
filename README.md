PowerShell Automation Scripts for Microsoft 365

Welcome to the PowerShell Automation repository! This collection of scripts is designed to help IT administrators automate common tasks across the Microsoft 365 ecosystem, including Exchange Online, Microsoft Entra ID (Azure AD), and more.
📁 Repository Structure

PowerShell/
│
├── ExchangeOnline/
│   └── README.md           # Scripts & docs related to Exchange Online
│
├── EntraID/                # (Coming soon) Scripts for Microsoft Entra ID / Azure AD
│
└── README.md               # You're here!

🔧 Current Modules
📬 Exchange Online

    Bulk Add Users to Distribution Group

    Connects to Exchange Online via Connect-ExchangeOnline

    Imports users from CSV and adds them to a group

    View Details →

🔜 Upcoming Modules
🧾 Microsoft Entra ID (Azure AD)

    Automate user provisioning

    Bulk assign roles and group memberships

    Report on inactive accounts and MFA status

    (Coming soon...)

💡 Goals

    Simplify repetitive Microsoft 365 admin tasks

    Make scripts modular, readable, and reusable

    Support bulk operations using structured CSV input

    Provide helpful console output and error handling

🛠️ Requirements

    PowerShell 7+ or Windows PowerShell 5.1+

    Admin permissions to connect to Microsoft 365 services

    Required modules:

        ExchangeOnlineManagement

        Microsoft.Graph (for Entra ID, coming soon)

🤝 Contributing

Want to improve or add a script? Pull requests and suggestions are welcome! Please follow PowerShell best practices and include sample CSV templates when needed.
📜 License

MIT License