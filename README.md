# Azure Infrastructure Lab

[![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![ARM](https://img.shields.io/badge/Infrastructure-ARM_Templates-blue)](https://learn.microsoft.com/azure/azure-resource-manager/)
[![Bicep](https://img.shields.io/badge/Bicep-Coming_Soon-lightgrey)]()

---

## Project Overview

This project demonstrates the deployment of a basic Azure infrastructure environment using **Azure Resource Manager (ARM) templates**.

The lab was built after earning the **Microsoft Certified: Azure Administrator Associate (AZ-104)** certification to reinforce Azure administration concepts through hands-on experience.

The goal of this project is to showcase practical Azure skills in virtual networking, virtual machines, network security, storage, and Infrastructure as Code (IaC).

This repository serves as a portfolio project highlighting Azure infrastructure deployment and administration skills relevant to cloud engineering, cloud administration, and cloud security roles.

---

# Architecture

```
                     Azure Resource Group
                              │
        ┌─────────────────────┴─────────────────────┐
        │                                           │
        │              Virtual Network              │
        │               10.0.0.0/16                 │
        │                                           │
        ├──────────────────┬────────────────────────┤
        │                  │                        │
        │                  │                        │
 Management Subnet     Workload Subnet        Storage Account
   10.0.1.0/24          10.0.2.0/24
        │                  │
        │                  │
   Windows VM          Linux VM
        │                  │
        └────── Protected by NSGs ──────┘
```

---

# Azure Services Used

- Azure Resource Groups
- Azure Virtual Network (VNet)
- Azure Subnets
- Azure Network Security Groups
- Azure Virtual Machines
  - Windows Server
  - Linux
- Azure Storage Account
- Azure Resource Manager (ARM)

---

# Skills Demonstrated

- Infrastructure as Code (IaC)
- Azure ARM Templates
- Azure Networking
- Virtual Network Design
- Subnet Configuration
- Network Security Groups
- Windows VM Deployment
- Linux VM Deployment
- Azure Storage Configuration
- Azure Resource Group Management
- Remote Administration (RDP / SSH)
- Azure Portal Administration

---

# Project Structure

```
azure-infrastructure-lab/
│
├── ARM/
│   ├── Windows-VM/
│   ├── Linux-VM/
│   ├── VNet/
│   ├── Storage/
│   ├── NSG-Management/
│   └── NSG-Workload/
│
├── Bicep/
│
├── Screenshots/
│   ├── resource-group.png
│   ├── virtual-network.png
│   ├── windows-vm.png
│   ├── linux-vm.png
│   ├── storage-account.png
│   ├── nsg-management.png
│   └── nsg-workload.png
│
├── LICENSE
└── README.md
```

---

# Environment

| Component | Configuration |
|-----------|---------------|
| Cloud | Microsoft Azure |
| Region | East US 2 |
| IaC | ARM Templates |
| Windows VM | Windows Server |
| Linux VM | Ubuntu Linux |
| Networking | Virtual Network + Subnets |
| Security | Network Security Groups |
| Storage | Azure Storage Account |

---

# Validation Performed

The following functionality was verified after deployment:

- Successful ARM template deployment
- Resource Group creation
- Virtual Network deployment
- Subnet creation
- Windows VM deployment
- Linux VM deployment
- RDP connectivity to Windows VM
- SSH connectivity to Linux VM
- Network Security Group configuration
- Storage Account deployment
- Resource dependencies
- Azure Portal resource management

---

# Screenshots

## Resource Group

*Insert screenshot here*

---

## Virtual Network

*Insert screenshot here*

---

## Windows Virtual Machine

*Insert screenshot here*

---

## Linux Virtual Machine

*Insert screenshot here*

---

## Network Security Groups

### Management NSG

*Insert screenshot here*

### Workload NSG

*Insert screenshot here*

---

## Storage Account

*Insert screenshot here*

---

# Future Improvements

This repository will continue to evolve as additional Azure services are explored.

Planned enhancements include:

- Rebuild the environment using **Bicep**
- Azure Bastion
- Azure Firewall
- Azure Monitor
- Log Analytics Workspace
- Diagnostic Settings
- Azure Backup
- Role-Based Access Control (RBAC)
- Private Endpoints
- Azure Key Vault

---

# Learning Objectives

This project was created to gain hands-on experience with:

- Azure infrastructure deployment
- Infrastructure as Code
- Azure networking concepts
- Resource management
- Secure cloud administration
- Cloud deployment best practices

---

# Getting Started

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/azure-infrastructure-lab.git
```

Deploy the ARM templates using:

- Azure Portal
- Azure CLI
- PowerShell

> **Note:** Environment-specific values (such as subscription IDs, usernames, and other sensitive information) have been sanitized before publication.

---

# Education

**Bachelor of Science in Cybersecurity and Information Assurance**  
Western Governors University (WGU)

---

# Certifications

- Microsoft Certified: Azure Administrator Associate (AZ-104)
- CompTIA CySA+
- CompTIA Security+
- CompTIA PenTest+
- ITIL 4 Foundation
- CompTIA Project+
- CompTIA Network+
- CompTIA A+

---

# Author

**David Boal**

Cybersecurity | Cloud Security | Cloud Administration

GitHub: https://github.com/YOUR-USERNAME

---

## License

This project is licensed under the MIT License.
