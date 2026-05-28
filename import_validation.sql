-- =====================================================
-- TASK 1: IMPORT VALIDATION
-- =====================================================

-- Row count validation

SELECT COUNT(*) AS total_students
FROM Students;

SELECT COUNT(*) AS total_courses
FROM Courses;

SELECT COUNT(*) AS total_problems
FROM Problems;

SELECT COUNT(*) AS total_submissions
FROM Submissions;

SELECT COUNT(*) AS total_attendance
FROM Attendance;


-- Distinct primary key validation

SELECT COUNT(DISTINCT student_id) AS distinct_students
FROM Students;

SELECT COUNT(DISTINCT course_id) AS distinct_courses
FROM Courses;

SELECT COUNT(DISTINCT submission_id) AS distinct_submissions
FROM Submissions;


-- NULL and blank value checks

SELECT COUNT(*) AS missing_emails
FROM Students
WHERE email IS NULL
OR email = '';

SELECT COUNT(*) AS missing_student_names
FROM Students
WHERE name IS NULL
OR name = '';

SELECT COUNT(*) AS missing_course_names
FROM Courses
WHERE course_name IS NULL
OR course_name = '';


-- Empty table checks

SELECT 'Students' AS table_name, COUNT(*) AS total_rows
FROM Students

UNION

SELECT 'Courses', COUNT(*)
FROM Courses

UNION

SELECT 'Submissions', COUNT(*)
FROM Submissions

UNION

SELECT 'Attendance', COUNT(*)
FROM Attendance;


-- Imported rows vs expected CSV rows

SELECT COUNT(*) AS imported_student_rows
FROM Students;
