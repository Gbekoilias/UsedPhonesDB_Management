-- Insert Sample Data into Students Table
INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, PhoneNumber, EnrollmentDate) VALUES
('John', 'Doe', #1995-05-15#, 'john.doe@example.com', '123-456-7890', #2023-09-01#),
('Jane', 'Smith', #1994-03-22#, 'jane.smith@example.com', '234-567-8901', #2023-09-01#),
('Michael', 'Johnson', #1996-07-30#, 'michael.johnson@example.com', '345-678-9012', #2023-09-01#),
('Emily', 'Davis', #1995-11-05#, 'emily.davis@example.com', '456-789-0123', #2023-09-01#),
('Sarah', 'Wilson', #1997-02-18#, 'sarah.wilson@example.com', '567-890-1234', #2023-09-01#);

-- Insert Sample Data into Courses Table
INSERT INTO Courses (CourseName, CourseDescription, Credits, Department) VALUES
('Data Science Fundamentals', 'Introduction to data science concepts and techniques.', 3, 'Computer Science'),
('Advanced Database Systems', 'In-depth study of database design and management.', 4, 'Information Technology'),
('Machine Learning Techniques', 'Exploration of machine learning algorithms and applications.', 3, 'Computer Science'),
('Web Development Essentials', 'Basics of web development using HTML, CSS, and JavaScript.', 3, 'Information Technology'),
('Cloud Computing Basics', 'Introduction to cloud computing technologies and services.', 3, 'Computer Science'),
('Artificial Intelligence Principles', 'Fundamentals of AI and its applications.', 4, 'Computer Science'),
('Big Data Analytics', 'Techniques for analyzing large datasets.', 3, 'Information Technology'),
('Cybersecurity Fundamentals', 'Introduction to cybersecurity principles and practices.', 3, 'Information Technology'),
('Mobile Application Development', 'Creating applications for mobile platforms.', 4, 'Computer Science'),
('Software Engineering Principles', 'Overview of software development methodologies.', 4, 'Computer Science'),
('Human Computer Interaction', 'Study of user interface design and usability.', 3, 'Information Technology'),
('Project Management Essentials', 'Basic principles of project management in IT.', 3, 'Business');

-- Insert Sample Data into Instructors Table (Optional)
INSERT INTO Instructors (FirstName, LastName, Email, PhoneNumber, Department) VALUES
('Dr. Alice Brown', 'Brown', 'alice.brown@university.edu', '678-901-2345', 'Computer Science'),
('Prof. David Green', 'Green', 'david.green@university.edu', '789-012-3456', 'Information Technology'),
('Dr. Lisa White', 'White', 'lisa.white@university.edu', '890-123-4567', 'Business');

-- Insert Sample Data into Enrollments Table
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, #2023-09-01#, NULL), -- John Doe enrolled in Data Science Fundamentals
(1, 2, #2023-09-01#, NULL), -- John Doe enrolled in Advanced Database Systems
(2, 1, #2023-09-01#, NULL), -- Jane Smith enrolled in Data Science Fundamentals
(2, 3, #2023-09-01#, NULL), -- Jane Smith enrolled in Machine Learning Techniques
(3, 4, #2023-09-01#, NULL), -- Michael Johnson enrolled in Web Development Essentials
(4, 5, #2023-09-01#, NULL), -- Emily Davis enrolled in Cloud Computing Basics
(5, 6, #2023-09-01#, NULL), -- Sarah Wilson enrolled in Artificial Intelligence Principles
(1, 7, #2023-09-01#, NULL); -- John Doe also enrolled in Big Data Analytics

