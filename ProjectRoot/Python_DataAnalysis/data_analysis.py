import pandas as pd
import pyodbc

# Database connection parameters
db_file = r'C:\path\to\your\database.accdb'  # Update with your Access database path
connection_string = f'DRIVER={{Microsoft Access Driver (*.mdb, *.accdb)}};DBQ={db_file};'

# Connect to the Access database
conn = pyodbc.connect(connection_string)

# Load data into a DataFrame
def load_data(query):
    return pd.read_sql(query, conn)

# Queries to load data
students_query = "SELECT * FROM Students;"
courses_query = "SELECT * FROM Courses;"
enrollments_query = "SELECT * FROM Enrollments;"

# Load data into DataFrames
students_df = load_data(students_query)
courses_df = load_data(courses_query)
enrollments_df = load_data(enrollments_query)

# Summary statistics for students
summaryStats = students_df.describe(include='all')

# Display summary statistics
print("Summary Statistics for Students:")
print(summaryStats)

# Filter data: Get students with no phone number provided
filteredData = students_df[students_df['PhoneNumber'].isnull()]

# Display filtered data
print("\nStudents Without Phone Numbers:")
print(filteredData[['FirstName', 'LastName', 'Email']])

# Analyze enrollments: Count of enrollments per course
enrollment_counts = enrollments_df['CourseID'].value_counts().reset_index()
enrollment_counts.columns = ['CourseID', 'EnrollmentCount']

# Merge with courses to get course names
enrollment_summary = pd.merge(enrollment_counts, courses_df[['CourseID', 'CourseName']], on='CourseID')

# Display enrollment summary
print("\nEnrollment Summary:")
print(enrollment_summary)

# Close the database connection
conn.close()
