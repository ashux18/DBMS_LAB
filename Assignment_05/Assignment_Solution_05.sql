-- 1. StudentID, Name, CourseID
SELECT S.Student_ID, S.Name, E.Course_ID
FROM Student S
INNER JOIN Enrollment E
ON S.Student_ID = E.Student_ID;

-- 2. Student Name and Semester
SELECT S.Name, E.Semester
FROM Student S
INNER JOIN Enrollment E
ON S.Student_ID = E.Student_ID;

-- 3. Student Name and Grade
SELECT S.Name, E.Grade
FROM Student S
INNER JOIN Enrollment E
ON S.Student_ID = E.Student_ID;

-- 4. CourseName, Credits, Faculty Name
SELECT C.Course_Name, C.Credits, F.Name
FROM Course C
INNER JOIN Faculty F
ON C.Faculty_ID = F.Faculty_ID;

-- 5. Courses taught by FacultyID = 501
SELECT C.Course_Name
FROM Course C
INNER JOIN Faculty F
ON C.Faculty_ID = F.Faculty_ID
WHERE F.Faculty_ID = 501;

-- 6. Faculty Name, Designation, CourseName
SELECT F.Name, F.Designation, C.Course_Name
FROM Faculty F
INNER JOIN Course C
ON F.Faculty_ID = C.Faculty_ID;