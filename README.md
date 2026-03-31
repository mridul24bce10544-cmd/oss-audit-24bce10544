# Open Source Software Audit - Git Version Control

**Author:** Mridul Chandel  
**Registration Number:** 24BCE10544  
**Slot:** F11  
**Course:** Open Source Software (Capstone Project)  

## Project Description
This repository contains a comprehensive system audit focusing on **Git**, the industry standard for distributed version control. The project highlights Git's operational footprint on a Linux ecosystem and its alignment with the GPL v2 open-source license. Included are five custom Bash scripts designed to interrogate system properties, verify FOSS packages, analyze disk/permission states, parse system logs, and dynamically generate an open-source manifesto.

## Repository Layout
```text
oss-audit-24bce10544/
├── README.md                           # Project documentation
├── script1_sys_info.sh                 # Fetches and displays core system/user parameters
├── script2_foss_checker.sh             # Verifies Git installation & FOSS alternatives
├── script3_storage_audit.sh            # Scans vital directories for disk usage & rights
├── script4_log_parser.sh               # Scans a designated log file for specific keywords
├── script5_oss_philosophy.sh           # Interactively builds a custom markdown manifesto
└── report_notes/
    └── report_support_pack.md          # Output logs, notes, and viva preparation
