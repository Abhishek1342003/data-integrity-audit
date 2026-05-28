-- =====================================================
-- TASK 6: SAFE STAGING REPAIRS
-- =====================================================

-- Create staging tables

CREATE TABLE Staging_Submissions AS
SELECT *
FROM Submissions;

CREATE TABLE Staging_Problems AS
SELECT *
FROM Problems;

CREATE TABLE Staging_Enrollments AS
SELECT *
FROM Enrollments;

CREATE TABLE Staging_Attendance AS
SELECT *
FROM Attendance;


-- =====================================================
-- Repair 1: Negative Scores
-- =====================================================

-- Before Repair

SELECT *
FROM Staging_Submissions
WHERE score < 0;


-- Repair Query

UPDATE Staging_Submissions
SET score = 0
WHERE score < 0;


-- After Repair

SELECT *
FROM Staging_Submissions
WHERE score < 0;


-- =====================================================
-- Repair 2: Scores Above 100
-- =====================================================

-- Before Repair

SELECT *
FROM Staging_Submissions
WHERE score > 100;


-- Repair Query

UPDATE Staging_Submissions
SET score = 100
WHERE score > 100;


-- After Repair

SELECT *
FROM Staging_Submissions
WHERE score > 100;


-- =====================================================
-- Repair 3: Invalid Difficulty
-- =====================================================

-- Before Repair

SELECT *
FROM Staging_Problems
WHERE difficulty = 'Medim';


-- Repair Query

UPDATE Staging_Problems
SET difficulty = 'Medium'
WHERE difficulty = 'Medim';


-- After Repair

SELECT *
FROM Staging_Problems
WHERE difficulty = 'Medim';


-- =====================================================
-- Repair 4: Duplicate Enrollment
-- =====================================================

-- Before Repair

SELECT student_id, course_id, COUNT(*)
FROM Staging_Enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;


-- Repair Query

DELETE FROM Staging_Enrollments
WHERE enrollment_id IN (
    SELECT enrollment_id
    FROM (
        SELECT enrollment_id,
               ROW_NUMBER() OVER (
                   PARTITION BY student_id, course_id
                   ORDER BY enrollment_id
               ) AS rn
        FROM Staging_Enrollments
    ) x
    WHERE rn > 1
);


-- After Repair

SELECT student_id, course_id, COUNT(*)
FROM Staging_Enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;


-- =====================================================
-- Repair 5: Invalid Attendance Status
-- =====================================================

-- Before Repair

SELECT *
FROM Staging_Attendance
WHERE status = 'P';


-- Repair Query

UPDATE Staging_Attendance
SET status = 'Present'
WHERE status = 'P';


-- After Repair

SELECT *
FROM Staging_Attendance
WHERE status = 'P';
