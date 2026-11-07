cat << 'EOF' > README.md
# 🛡️ Production-Grade Bash Backup & Audit System (`bash-backup-tool`)

[![Bash](https://img.shields.io/badge/Language-Bash%20%2F%20Shell-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Linux](https://img.shields.io/badge/OS-Linux%20%2F%20POSIX-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.kernel.org/)
[![Git](https://img.shields.io/badge/Version%20Control-Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

An enterprise-ready, defensive shell automation script built to validate local filesystem structures, generate ISO-compliant compressed archives (`.tar.gz`), and maintain immutable execution log metrics for system auditing.

---

## 📐 System Architecture Workflow

```text
┌─────────────────────────┐
│     User Input          │
│  (Target Directory)     │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐      NO      ┌───────────────────────────────────┐
│ Directory Existence     ├─────────────►│ - Log Error to stderr             │
│ Check `[ -d "$target" ]`│              │ - Append Fail state to backup.log │
└───────────┬─────────────┘              └───────────────────────────────────┘
            │ YES
            ▼
┌─────────────────────────┐
│  Generate ISO Timestamp │
│    (`YYYY-MM-DD`)       │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ Execute `tar -czf`      │
│ Compression Process     │
└───────────┬─────────────┘
            │
            ▼
┌─────────────────────────┐
│ Write Audit Entry to    │
│      `backup.log`       │
└─────────────────────────┘
