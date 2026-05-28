-- =====================================================
-- TASK 2: PRIMARY KEY AND UNIQUENESS AUDIT
-- =====================================================

-- Duplicate primary keys

SELECT student_id, COUNT(*)
FROM Students
GROUP BY student_id
HAVING COUNT(*) > 1;


-- Duplicate candidate keys

SELECT email, COUNT(*)
FROM Students
GROUP BY email
HAVING COUNT(*) > 1;


-- Duplicate enrollment records

SELECT student_id, course_id, COUNT(*)
FROM Enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;


-- Duplicate contest-problem mappings

SELECT contest_id, problem_id, COUNT(*)
FROM Contest_Problems
GROUP BY contest_id, problem_id
HAVING COUNT(*) > 1;


-- Duplicate test results

SELECT submission_id, testcase_id, COUNT(*)
FROM Test_Results
GROUP BY submission_id, testcase_id
HAVING COUNT(*) > 1;


-- Duplicate attendance records

SELECT session_id, student_id, COUNT(*)
FROM Attendance
GROUP BY session_id, student_id
HAVING COUNT(*) > 1;


-- =====================================================
-- TASK 3: FOREIGN KEY AND RELATIONSHIP AUDIT
-- =====================================================

-- Students linked to missing batches

SELECT s.student_id
FROM Students s
LEFT JOIN Batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;


-- Enrollments linked to missing students

SELECT e.enrollment_id
FROM Enrollments e
LEFT JOIN Students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;


-- Enrollments linked to missing courses

SELECT e.enrollment_id
FROM Enrollments e
LEFT JOIN Courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;


-- Problems linked to missing courses

SELECT p.problem_id
FROM Problems p
LEFT JOIN Courses c
ON p.course_id = c.course_id
WHERE c.course_id IS NULL;


-- Test cases linked to missing problems

SELECT t.testcase_id
FROM TestCases t
LEFT JOIN Problems p
ON t.problem_id = p.problem_id
WHERE p.problem_id IS NULL;


-- Contest mappings linked to missing contests

SELECT cp.contest_id
FROM Contest_Problems cp
LEFT JOIN Contests c
ON cp.contest_id = c.contest_id
WHERE c.contest_id IS NULL;


-- Contest mappings linked to missing problems

SELECT cp.problem_id
FROM Contest_Problems cp
LEFT JOIN Problems p
ON cp.problem_id = p.problem_id
WHERE p.problem_id IS NULL;


-- Submissions linked to missing students

SELECT s.submission_id
FROM Submissions s
LEFT JOIN Students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;


-- Submissions linked to missing problems

SELECT s.submission_id
FROM Submissions s
LEFT JOIN Problems p
ON s.problem_id = p.problem_id
WHERE p.problem_id IS NULL;


-- Test results linked to missing submissions

SELECT tr.result_id
FROM Test_Results tr
LEFT JOIN Submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;


-- Attendance linked to missing students

SELECT a.attendance_id
FROM Attendance a
LEFT JOIN Students s
ON a.student_id = s.student_id
WHERE s.student_id IS NULL;


-- Plagiarism flags linked to missing submissions

SELECT pf.flag_id
FROM Plagiarism_Flags pf
LEFT JOIN Submissions s
ON pf.submission_id = s.submission_id
WHERE s.submission_id IS NULL;
