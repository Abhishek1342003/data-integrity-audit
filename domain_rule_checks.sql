-- =====================================================
-- TASK 4: DOMAIN AND RULE VALIDATION
-- =====================================================

-- Negative scores

SELECT *
FROM Submissions
WHERE score < 0;


-- Scores greater than 100

SELECT *
FROM Submissions
WHERE score > 100;


-- Invalid difficulty values

SELECT *
FROM Problems
WHERE difficulty NOT IN ('Easy', 'Medium', 'Hard');


-- Invalid submission statuses

SELECT *
FROM Submissions
WHERE status NOT IN ('Successful', 'Failed', 'Pending');


-- Invalid programming languages

SELECT *
FROM Submissions
WHERE language NOT IN ('Python', 'Java', 'C++', 'JavaScript');


-- Invalid test-result statuses

SELECT *
FROM Test_Results
WHERE result_status NOT IN ('Passed', 'Failed');


-- Invalid attendance statuses

SELECT *
FROM Attendance
WHERE status NOT IN ('Present', 'Absent');


-- Invalid contest statuses

SELECT *
FROM Contests
WHERE contest_status NOT IN ('Upcoming', 'Running', 'Completed');


-- End time before start time

SELECT *
FROM Contests
WHERE end_time < start_time;


-- Resolved time before request time

SELECT *
FROM Regrade_Requests
WHERE resolved_time < request_time;


-- Submission before admission date

SELECT s.submission_id
FROM Submissions s
JOIN Students st
ON s.student_id = st.student_id
WHERE s.submission_time < st.admission_date;


-- NULL mandatory values

SELECT *
FROM Students
WHERE name IS NULL
OR email IS NULL;
