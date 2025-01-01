-- Update a student's email address based on their StudentID
UPDATE Students
SET Email = 'john.newemail@example.com'
WHERE StudentID = 1;

-- Update the course description for a specific course
UPDATE Courses
SET CourseDescription = 'An advanced study of database design and management techniques.'
WHERE CourseID = 2;

-- Update multiple fields for a specific student
UPDATE Students
SET PhoneNumber = '555-123-4567', EnrollmentDate = #2023-08-15#
WHERE StudentID = 2;

-- Update the credits for a course based on its name
UPDATE Courses
SET Credits = 4
WHERE CourseName = 'Machine Learning Techniques';

-- Update the grade for a specific enrollment record
UPDATE Enrollments
SET Grade = 'A'
WHERE StudentID = 1 AND CourseID = 1;

-- Update all students' phone numbers to a default value where they are currently NULL
UPDATE Students
SET PhoneNumber = 'Not Provided'
WHERE PhoneNumber IS NULL;

-- Update instructor's email based on their last name
UPDATE Instructors
SET Email = 'david.green@newuniversity.edu'
WHERE LastName = 'Green';

-- Update multiple instructors' departments based on their first names
UPDATE Instructors
SET Department = 'Computer Science'
WHERE FirstName IN ('Alice', 'David');

