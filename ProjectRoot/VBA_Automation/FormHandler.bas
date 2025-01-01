Option Compare Database
Option Explicit

' Global Variables
Dim formName As String
Dim controlName As String
Dim inputValue As Variant

Sub HandleButtonClick()
    ' Set the form and control names
    formName = "YourFormName" ' Replace with your actual form name
    controlName = "txtInput"   ' Replace with your actual control name (e.g., TextBox)
    
    ' Get the input value from the control
    inputValue = GetControlValue(formName, controlName)
    
    ' Perform an action based on the input value
    If Not IsEmpty(inputValue) Then
        MsgBox "You entered: " & inputValue, vbInformation, "Input Confirmation"
        ' Additional actions can be added here (e.g., saving data, updating records)
        SaveInputData formName, controlName, inputValue
    Else
        MsgBox "Please enter a value.", vbExclamation, "Input Error"
    End If
End Sub

Function GetControlValue(frmName As String, ctrlName As String) As Variant
    ' This function retrieves the value from a specified control on a given form.
    
    Dim frm As Form
    
    On Error GoTo ErrorHandler
    
    Set frm = Forms(frmName)
    GetControlValue = frm.Controls(ctrlName).Value
    
    Exit Function

ErrorHandler:
    MsgBox "Error retrieving value from control: " & ctrlName & vbCrLf & Err.Description, vbCritical
    GetControlValue = Null
End Function

Sub SaveInputData(frmName As String, ctrlName As String, value As Variant)
    ' This subroutine performs actions to save the input data (e.g., to a database table).
    
    Dim db As DAO.Database
    Dim rs As DAO.Recordset
    
    On Error GoTo ErrorHandler
    
    Set db = CurrentDb()
    
    ' Open a recordset for a specific table (replace "YourTable" with your actual table name)
    Set rs = db.OpenRecordset("YourTable", dbOpenDynaset)
    
    ' Add a new record to the table
    rs.AddNew
    rs.Fields("YourField") = value ' Replace "YourField" with the actual field name in your table
    rs.Update
    
    MsgBox "Data saved successfully!", vbInformation, "Save Confirmation"
    
Exit Sub

ErrorHandler:
    MsgBox "Error saving data: " & Err.Description, vbCritical
End Sub

