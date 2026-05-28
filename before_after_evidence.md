# Before and After Repair Evidence

## Repair 1: Negative Score

### Before Repair

| submission_id | score |
|------|------|
| 5021 | -5 |

### After Repair

| submission_id | score |
|------|------|
| 5021 | 0 |

---

## Repair 2: Score Above 100

### Before Repair

| submission_id | score |
|------|------|
| 5044 | 125 |

### After Repair

| submission_id | score |
|------|------|
| 5044 | 100 |

---

## Repair 3: Invalid Difficulty

### Before Repair

| problem_id | difficulty |
|------|------|
| 210 | Medim |

### After Repair

| problem_id | difficulty |
|------|------|
| 210 | Medium |

---

## Repair 4: Duplicate Enrollment

### Before Repair

| student_id | course_id | count |
|------|------|------|
| 101 | 12 | 2 |

### After Repair

| student_id | course_id | count |
|------|------|------|
| 101 | 12 | 1 |

---

## Repair 5: Invalid Attendance Status

### Before Repair

| attendance_id | status |
|------|------|
| 901 | P |

### After Repair

| attendance_id | status |
|------|------|
| 901 | Present |
