# Repair Plan

| Issue | Example ID | Repair Action | Reason |
|------|------|------|------|
| Duplicate email | student_id 104 and 118 | Manual verification | Same email used twice |
| Negative score | submission_id 5021 | Correct to 0 | Negative marks impossible |
| Score > 100 | submission_id 5044 | Correct to 100 | Exceeds maximum marks |
| Invalid difficulty | problem_id 210 | Correct typo | Invalid spelling |
| Missing batch | student_id 121 | Move to staging table | Broken foreign key |
| Duplicate enrollment | enrollment_id 4011 | Delete duplicate | Redundant record |
| Invalid attendance | attendance_id 901 | Correct value | Standardization |
| Missing problem reference | testcase_id 803 | Delete orphan record | Invalid relationship |

---

# Repair Strategy

## Correct the Value
Used when:
- Typo exists
- Standard value known
- Small formatting issue

Example:
- 'Medim' → 'Medium'

---

## Delete Record
Used when:
- Duplicate exists
- Orphan record exists
- Invalid record has no business meaning

---

## Move to Staging Table
Used when:
- Relationship broken
- Data uncertain
- Needs investigation

---

## Manual Verification
Used when:
- Human confirmation required
- Conflicting business information exists

---

## Leave Unchanged
Used when:
- Historical anomaly acceptable
- Business rule intentionally flexible
