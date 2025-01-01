Option Compare Database
Option Explicit

' Global Variables
Dim recordCount As Long
Dim currentRecord As Long
Dim formData As Variant

Sub AutomateDataEntry()
    ' Initialize the record count and current record index
    recordCount = 0
    currentRecord = 0
    
    ' Load data from a source (e.g., Excel, CSV, etc.)
    formData = LoadDataSource()
    
    ' Check if data was loaded successfully
    If Not IsEmpty(formData) Then
        recordCount = UBound(formData, 1) ' Get the total number of records
        
        ' Loop through each record and enter data into the form
        For currentRecord = LBound(formData, 1) To recordCount
            EnterDataIntoForm formData(currentRecord, 0), formData(currentRecord, 1), formData(currentRecord, 2)
        Next currentRecord
        
        MsgBox "Data entry completed successfully!", vbInformation
    Else
        MsgBox "No data found to enter.", vbExclamation
    End If
End Sub

Function LoadDataSource() As Variant
    ' This function simulates loading data from an external source.
    ' Replace this with actual code to load data from your source.

    Dim data(1 To 3, 1 To 3) As Variant
    
    ' Sample data: Replace with actual data loading logic
    data(1, 1) = "John Doe"
    data(1, 2) = "john.doe@example.com"
    data(1, 3) = "123 Main St"
    
    data(2, 1) = "Jane Smith"
    data(2, 2) = "jane.smith@example.com"
    data(2, 3) = "456 Elm St"
    
    data(3, 1) = "Mike Johnson"
    data(3, 2) = "mike.johnson@example.com"
    data(3, 3) = "789 Oak St"
    
    LoadDataSource = data
End Function

Sub EnterDataIntoForm(name As String, email As String, address As String)
    ' This subroutine enters the provided data into the Access form.
    
    Dim frm As Form
    
    ' Open the form in Data Entry mode
    DoCmd.OpenForm "YourFormName", acNormal
    
    Set frm = Forms("YourFormName")
    
    ' Ensure the form is in edit mode before entering data
    If Not frm.NewRecord Then frm.Recordset.AddNew
    
    ' Assign values to form controls (replace with your actual control names)
    frm.Controls("txtName").Value = name
    frm.Controls("txtEmail").Value = email
    frm.Controls("txtAddress").Value = address
    
    ' Save the new record to the database
    frm.Recordset.Update
    
    ' Close the form after entering each record (optional)
    DoCmd.Close acForm, "YourFormName", acSaveNo
    
End Sub

