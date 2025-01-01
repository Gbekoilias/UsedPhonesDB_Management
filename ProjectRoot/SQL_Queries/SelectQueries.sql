-- 1. Retrieve all student information
SELECT *
FROM Students;

-- 2. Retrieve specific fields (first name, last name, and email) for all students
SELECT FirstName, LastName, Email
FROM Students;

-- 3. Retrieve students enrolled in a specific course (e.g., CourseID = 1)
SELECT s.FirstName, s.LastName, e.EnrollmentDate
FROM Students AS s
INNER JOIN Enrollments AS e ON s.StudentID = e.StudentID
WHERE e.CourseID = 1;

-- 4. Retrieve all courses along with their credit values
SELECT CourseName, Credits
FROM Courses;

-- 5. Retrieve the average grade for each course
SELECT c.CourseName, AVG(CAST(e.Grade AS FLOAT)) AS AverageGrade
FROM Courses AS c
LEFT JOIN Enrollments AS e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

-- 6. Retrieve students who have not provided a phone number
SELECT FirstName, LastName
FROM Students
WHERE PhoneNumber IS NULL;

-- 7. Retrieve all enrollments for a specific student (e.g., StudentID = 2)
SELECT c.CourseName, e.EnrollmentDate, e.Grade
FROM Enrollments AS e
INNER JOIN Courses AS c ON e.CourseID = c.CourseID
WHERE e.StudentID = 2;

-- 8. Retrieve instructors from a specific department (e.g., Computer Science)
SELECT FirstName, LastName, Email
FROM Instructors
WHERE Department = 'Computer Science';

-- 9. Retrieve courses with more than three credits
SELECT CourseName, Credits
FROM Courses
WHERE Credits > 3;

-- 10. Retrieve the total number of students enrolled in each course
SELECT c.CourseName, COUNT(e.StudentID) AS TotalStudents
FROM Courses AS c
LEFT JOIN Enrollments AS e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
