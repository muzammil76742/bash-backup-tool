# Linux Automated Backup System

**A Bash-based automated backup utility designed to securely archive directories, maintain backup logs, and automatically remove outdated backup files.**

![Bash](https://img.shields.io/badge/Shell-Bash-121011?style=for-the-badge&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Platform-Linux-orange?style=for-the-badge&logo=linux&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

---

## Overview

The **Linux Automated Backup System** is a command-line backup utility developed using Bash scripting.

It automates the process of creating compressed backups of directories, maintaining execution logs, and managing backup retention.

The script is designed to simplify routine Linux backup operations while reducing manual administrative work.

## Key Features

- **Automated Directory Backup:** Creates compressed `.tar.gz` archives of specified directories.
- **Timestamp-Based Naming:** Generates uniquely named backup files using dates and timestamps.
- **Backup Logging:** Records successful and failed backup operations in a log file.
- **Retention Management:** Automatically removes backup archives older than the configured retention period.
- **Directory Validation:** Checks whether the specified source directory exists.
- **Error Handling:** Detects backup failures and returns appropriate exit codes.
- **Automatic Directory Creation:** Creates the backup destination if it does not already exist.

## Project Architecture

```text
Linux-Automated-Backup/
│
├── backup.sh
│
├── backups/
│   ├── project-2026-11-09-183000.tar.gz
│   └── website-2026-11-09-184500.tar.gz
│
├── backup.log
│
└── README.md
```

*Note: The `backups/` directory and `backup.log` are generated automatically at runtime in the user's home directory.*

## Requirements

Before running this script, make sure your Linux system has:

- Linux-based operating system
- Bash Shell
- `tar` utility
- `find` utility
- Standard Linux commands (`date`, `mkdir`, `basename`)

## Installation

**1. Clone the repository**

```bash
git clone <YOUR-REPOSITORY-URL>
```

**2. Navigate into the project directory**

```bash
cd Linux-Automated-Backup
```

**3. Give execution permission**

```bash
chmod +x backup.sh
```

## Usage

Run the script by providing the directory you want to back up:

```bash
./backup.sh /path/to/your/folder
```

**Example:**

```bash
./backup.sh ~/Documents
```

**Expected Output:**

```text
Backup is ready: /home/user/backups/Documents-2026-11-09-183000.tar.gz
```

If the specified directory does not exist:

```text
Folder not found: /path/to/folder
```

## Configuration

The script includes configurable variables that control its backup behavior.

| Variable | Description | Default |
|---|---|---|
| `BACKUP_DIR` | Backup storage location | `$HOME/backups` |
| `LOG_FILE` | Backup activity log | `$HOME/backup.log` |
| `RETENTION_DAYS` | Backup retention period | `7` |
| `folder` | Source directory | User supplied |

To change the backup retention period, modify:

```bash
RETENTION_DAYS=7
```

For example, setting it to `30` will configure the cleanup policy to target archives older than 30 days.

## Backup Process

The script follows this execution workflow:

1. Accepts a directory path as a command-line argument.
2. Validates the provided argument.
3. Checks whether the source directory exists.
4. Creates the backup destination directory if necessary.
5. Generates a timestamp-based backup filename.
6. Compresses the source directory using `tar`.
7. Records the backup status in the log file.
8. Removes outdated backup archives according to the retention policy.

## Logging

All backup activities are recorded in:

```bash
$HOME/backup.log
```

**Example Log Entries:**

```text
2026-11-09 18:30:00 - /home/user/Documents - successful
2026-11-09 18:45:00 - /home/user/Projects - successful
2026-11-09 18:45:05 - Retention purge executed (files >7 days: removed)
```

This provides a basic history of backup operations and cleanup activities.

## Retention Policy

The project implements an automatic backup retention mechanism using the Linux `find` command.

```bash
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete
```

This prevents outdated backup archives from accumulating indefinitely.

## Error Handling

The script handles several common situations:

- Missing command-line arguments.
- Non-existent source directories.
- Failed archive creation.
- Non-zero exit status when backup creation fails.

## Learning Outcomes

This project demonstrates practical knowledge of:

- Linux command-line operations.
- Bash scripting and variables.
- Conditional statements.
- Command-line arguments.
- Exit statuses and basic error handling.
- File and directory management.
- Archive compression using `tar`.
- Automated cleanup using `find`.
- Logging and backup retention policies.

## Future Improvements

Potential enhancements for future versions:

- Schedule automatic backups using Cron jobs.
- Support multiple directories.
- Add backup restoration functionality.
- Implement backup integrity verification.
- Add email notifications for backup failures.
- Introduce configurable backup destinations.
- Add encrypted backup support.

## Author

**Muzammil Abbas Ali**

Linux | Bash Scripting | Python | Docker | DevOps

---

**If you find this project useful, consider giving the repository a star!**

*Built as a hands-on Linux and Bash scripting project.*
