# CodeJudge Data Integrity Audit, Debugging & Repair Plan

## Objective

This project audits the imported CodeJudge relational database for data integrity issues and proposes safe repair solutions.

The project includes:

- Import validation
- Row count verification
- Primary key audit
- Duplicate detection
- Foreign key integrity checks
- Domain and business rule validation
- Repair planning
- Safe staging-table repair scripts
- Before and after repair evidence

---

# Repository Files

| File | Purpose |
|------|----------|
| README.md | Project overview |
| import_validation.sql | Import and row-count validation |
| integrity_audit.sql | PK, FK, duplicate and relationship audit |
| domain_rule_checks.sql | Domain and business rule validation |
| repair_plan.md | Repair strategy and explanations |
| staging_repair_scripts.sql | Safe repair operations on staging tables |
| before_after_evidence.md | Before and after repair outputs |

---

# Database Tables Used

- Students
- Batches
- Courses
- Enrollments
- Problems
- TestCases
- Contests
- Contest_Problems
- Submissions
- Test_Results
- Sessions
- Attendance
- Regrade_Requests
- Plagiarism_Flags

---

# Audit Goals

- Detect missing relationships
- Detect duplicates
- Detect invalid domain values
- Detect orphan records
- Detect timestamp inconsistencies
- Ensure safe repair without modifying original tables

---

# Tools Used

- MySQL Workbench
- PostgreSQL
- SQLite
- VS Code SQL Extension

---

# Author

Abhishek Kumar Choudhary
