-- DBMS LAB-6

-- Aggregate Functions, GROUP BY, HAVING


-- Part A: Basic Aggregate Queries

-- 1. Display total number of students
SELECT COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT;

-- 2. Display total number of faculty members
SELECT COUNT(*) AS TOTAL_FACULTY
FROM FACULTY;

-- 3. Display total number of courses
SELECT COUNT(*) AS TOTAL_COURSES
FROM COURSE;

-- 4. Display maximum credits among all courses
SELECT MAX(CREDITS) AS MAX_CREDITS
FROM COURSE;

-- 5. Display minimum credits offered by any course
SELECT MIN(CREDITS) AS MIN_CREDITS
FROM COURSE;


-- Part B: GROUP BY on Single Tables


-- 6. Number of students in each department
SELECT
DEPT_ID,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM STUDENT
GROUP BY DEPT_ID;

-- 7. Number of faculty members in each department
SELECT
DEPT_ID,
COUNT(FACULTY_ID) AS TOTAL_FACULTY
FROM FACULTY
GROUP BY DEPT_ID;

-- 8. Number of courses offered by each department
SELECT
DEPT_ID,
COUNT(COURSE_ID) AS TOTAL_COURSES
FROM COURSE
GROUP BY DEPT_ID;

-- 9. Number of enrollments in each semester
SELECT
SEMESTER,
COUNT(*) AS TOTAL_ENROLLMENTS
FROM ENROLLMENT
GROUP BY SEMESTER;

-- 10. Number of students for each grade
SELECT
GRADE,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY GRADE;

-- Part C: GROUP BY with HAVING

-- 11. Departments having more than 3 students
SELECT
DEPT_ID,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM STUDENT
GROUP BY DEPT_ID
HAVING COUNT(STUDENT_ID) > 3;

-- 12. Semesters with more than 2 enrollments
SELECT
SEMESTER,
COUNT(*) AS TOTAL_ENROLLMENTS
FROM ENROLLMENT
GROUP BY SEMESTER
HAVING COUNT(*) > 2;

-- 13. Grades assigned to more than one student
SELECT
GRADE,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY GRADE
HAVING COUNT(STUDENT_ID) > 1;

-- 14. DepartmentIDs where more than one course is offered
SELECT
DEPT_ID,
COUNT(COURSE_ID) AS TOTAL_COURSES
FROM COURSE
GROUP BY DEPT_ID
HAVING COUNT(COURSE_ID) > 1;


-- Part D: Aggregation with JOIN

-- 15. Number of students enrolled in each CourseID
SELECT
COURSE_ID,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY COURSE_ID;

-- 16. CourseName and number of students enrolled
SELECT
C.COURSE_NAME,
COUNT(E.STUDENT_ID) AS TOTAL_STUDENTS
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- 17. DepartmentID and number of students belonging to that department
SELECT
D.DEPT_ID,
COUNT(S.STUDENT_ID) AS TOTAL_STUDENTS
FROM DEPARTMENT D
JOIN STUDENT S
ON D.DEPT_ID = S.DEPT_ID
GROUP BY D.DEPT_ID;

-- 18. Faculty name and number of courses taught
SELECT
F.NAME,
COUNT(C.COURSE_ID) AS TOTAL_COURSES
FROM FACULTY F
JOIN COURSE C
ON F.FACULTY_ID = C.FACULTY_ID
GROUP BY F.NAME;


-- Part E: Analytical Queries

-- 19. CourseName and maximum grade obtained in that course
SELECT
C.COURSE_NAME,
MAX(E.GRADE) AS MAX_GRADE
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- 20. DepartmentID and total number of courses offered
SELECT
DEPT_ID,
COUNT(COURSE_ID) AS TOTAL_COURSES
FROM COURSE
GROUP BY DEPT_ID;

-- 21. Semester and total number of students enrolled
SELECT
SEMESTER,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY SEMESTER;

-- 22. Courses having more than 2 students enrolled
SELECT
COURSE_ID,
COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY COURSE_ID
HAVING COUNT(STUDENT_ID) > 2;