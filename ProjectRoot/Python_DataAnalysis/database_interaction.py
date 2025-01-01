import pyodbc

# Database connection parameters
db_file = r'C:\path\to\your\database.accdb'  # Update with your Access database path
connectionString = f'DRIVER={{Microsoft Access Driver (*.mdb, *.accdb)}};DBQ={db_file};'

# Connect to the Access database
def connect_to_database():
    try:
        conn = pyodbc.connect(connectionString)
        print("Connection to the database was successful.")
        return conn
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return None

# Create a new student record
def create_student(conn, first_name, last_name, email):
    query = "INSERT INTO Students (FirstName, LastName, Email) VALUES (?, ?, ?)"
    try:
        cursor = conn.cursor()
        cursor.execute(query, (first_name, last_name, email))
        conn.commit()
        print(f"Student {first_name} {last_name} added successfully.")
    except Exception as e:
        print(f"Error adding student: {e}")

# Read student records
def read_students(conn):
    query = "SELECT * FROM Students"
    try:
        cursor = conn.cursor()
        cursor.execute(query)
        resultSet = cursor.fetchall()
        
        print("Students:")
        for row in resultSet:
            print(row)
    except Exception as e:
        print(f"Error reading students: {e}")

# Update a student's email by StudentID
def update_student_email(conn, student_id, new_email):
    query = "UPDATE Students SET Email = ? WHERE StudentID = ?"
    try:
        cursor = conn.cursor()
        cursor.execute(query, (new_email, student_id))
        conn.commit()
        
        if cursor.rowcount > 0:
            print(f"Student ID {student_id}'s email updated to {new_email}.")
        else:
            print(f"No student found with ID {student_id}.")
    except Exception as e:
        print(f"Error updating student email: {e}")

# Delete a student record by StudentID
def delete_student(conn, student_id):
    query = "DELETE FROM Students WHERE StudentID = ?"
    try:
        cursor = conn.cursor()
        cursor.execute(query, (student_id,))
        conn.commit()
        
        if cursor.rowcount > 0:
            print(f"Student ID {student_id} deleted successfully.")
        else:
            print(f"No student found with ID {student_id}.")
    except Exception as e:
        print(f"Error deleting student: {e}")

# Main function to demonstrate CRUD operations
if __name__ == "__main__":
    connection = connect_to_database()
    
    if connection:
        # Create a new student
        create_student(connection, 'Alice', 'Johnson', 'alice.johnson@example.com')
        
        # Read all students
        read_students(connection)
        
        # Update a student's email (replace with an existing StudentID)
        update_student_email(connection, 1, 'alice.newemail@example.com')
        
        # Delete a student by StudentID (replace with an existing StudentID)
        delete_student(connection, 2)
        
        # Close the database connection
        connection.close()
