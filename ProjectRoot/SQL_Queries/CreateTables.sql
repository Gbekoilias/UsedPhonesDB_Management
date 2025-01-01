-- Create Customers Table
CREATE TABLE tblCustomers (
    CustomerID AUTOINCREMENT PRIMARY KEY,
    [Last Name] TEXT(50) NOT NULL,
    [First Name] TEXT(50) NOT NULL,
    Phone TEXT(15),
    Email TEXT(100)
);

-- Create Products Table
CREATE TABLE tblProducts (
    ProductID AUTOINCREMENT PRIMARY KEY,
    ProductName TEXT(100) NOT NULL,
    Description TEXT(255),
    Price CURRENCY NOT NULL,
    StockQuantity INTEGER NOT NULL
);

-- Create Orders Table
CREATE TABLE tblOrders (
    OrderID AUTOINCREMENT PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalAmount CURRENCY NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES tblCustomers(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE tblOrderDetails (
    OrderDetailID AUTOINCREMENT PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    UnitPrice CURRENCY NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES tblOrders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
);

-- Create Inventory Table
CREATE TABLE tblInventory (
    InventoryID AUTOINCREMENT PRIMARY KEY,
    ProductID INTEGER NOT NULL,
    QuantityInStock INTEGER NOT NULL,
    ReorderLevel INTEGER NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES tblProducts(ProductID)
);
-- Create Students Table
CREATE TABLE Students (
    StudentID AUTOINCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    EnrollmentDate DATE DEFAULT NOW()
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID AUTOINCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseDescription TEXT,
    Credits INT CHECK (Credits > 0),
    Department VARCHAR(50)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID AUTOINCREMENT PRIMARY KEY,
    StudentID LONG NOT NULL,
    CourseID LONG NOT NULL,
    EnrollmentDate DATE DEFAULT NOW(),
    Grade VARCHAR(2),
    
    -- Foreign Key Constraints
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Create Instructors Table (Optional)
CREATE TABLE Instructors (
    InstructorID AUTOINCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Department VARCHAR(50)
);

-- Create Course Instructors Table (Optional)
CREATE TABLE CourseInstructors (
    CourseInstructorID AUTOINCREMENT PRIMARY KEY,
    CourseID LONG NOT NULL,
    InstructorID LONG NOT NULL,

    -- Foreign Key Constraints
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE CASCADE
);
