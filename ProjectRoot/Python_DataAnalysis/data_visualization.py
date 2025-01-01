import pandas as pd
import pyodbc
import matplotlib.pyplot as plt

# Database connection parameters
db_file = r'C:\path\to\your\database.accdb'  # Update with your Access database path
connection_string = f'DRIVER={{Microsoft Access Driver (*.mdb, *.accdb)}};DBQ={db_file};'

# Connect to the Access database
conn = pyodbc.connect(connection_string)

# Load data into a DataFrame
def load_data(query):
    return pd.read_sql(query, conn)

# Queries to load data
enrollments_query = "SELECT * FROM Enrollments;"
courses_query = "SELECT * FROM Courses;"

# Load data into DataFrames
enrollments_df = load_data(enrollments_query)
courses_df = load_data(courses_query)

# Analyze enrollments: Count of enrollments per course
enrollment_counts = enrollments_df['CourseID'].value_counts().reset_index()
enrollment_counts.columns = ['CourseID', 'EnrollmentCount']

# Merge with courses to get course names
enrollment_summary = pd.merge(enrollment_counts, courses_df[['CourseID', 'CourseName']], on='CourseID')

# Visualization Variables
plotData = enrollment_summary
chartType = 'bar'  # Change this to 'pie' or 'line' for different chart types
outputFile = 'enrollment_summary.png'  # Output file name

# Create a visualization based on the chart type
def create_visualization(data, chart_type, output_file):
    plt.figure(figsize=(10, 6))
    
    if chart_type == 'bar':
        plt.bar(data['CourseName'], data['EnrollmentCount'], color='skyblue')
        plt.title('Enrollment Counts per Course')
        plt.xlabel('Courses')
        plt.ylabel('Number of Enrollments')
        plt.xticks(rotation=45)
        
    elif chart_type == 'pie':
        plt.pie(data['EnrollmentCount'], labels=data['CourseName'], autopct='%1.1f%%', startangle=140)
        plt.title('Enrollment Distribution by Course')

    elif chart_type == 'line':
        plt.plot(data['CourseName'], data['EnrollmentCount'], marker='o', linestyle='-', color='orange')
        plt.title('Enrollment Trend per Course')
        plt.xlabel('Courses')
        plt.ylabel('Number of Enrollments')
        plt.xticks(rotation=45)

    else:
        print("Unsupported chart type. Please choose 'bar', 'pie', or 'line'.")
        return

    # Save the plot to a file
    plt.tight_layout()
    plt.savefig(output_file)
    plt.close()
    print(f"Visualization saved as {output_file}")

# Create the visualization
create_visualization(plotData, chartType, outputFile)

# Close the database connection
conn.close()
