Option Compare Database
Option Explicit

' Global Variables
Dim reportData As DAO.Recordset
Dim reportFormat As String
Dim outputPath As String

Sub GenerateReports()
    ' Set the output path for the reports
    outputPath = "C:\Reports\" ' Change this to your desired output directory
    
    ' Generate sales report
    reportFormat = "PDF" ' Specify the desired format (PDF, Excel, etc.)
    Set reportData = GetReportData("SalesQuery") ' Replace with your actual query name
    CreateReport "SalesReport", reportData, reportFormat, outputPath
    
    ' Generate inventory report
    reportFormat = "Excel" ' Specify the desired format (PDF, Excel, etc.)
    Set reportData = GetReportData("InventoryQuery") ' Replace with your actual query name
    CreateReport "InventoryReport", reportData, reportFormat, outputPath
    
    MsgBox "Reports generated successfully!", vbInformation
End Sub

Function GetReportData(queryName As String) As DAO.Recordset
    ' This function retrieves data from a specified query and returns it as a Recordset.
    
    Dim db As DAO.Database
    
    On Error GoTo ErrorHandler
    
    Set db = CurrentDb()
    Set GetReportData = db.OpenRecordset(queryName)
    
    Exit Function

ErrorHandler:
    MsgBox "Error retrieving data from query: " & queryName & vbCrLf & Err.Description, vbCritical
    Set GetReportData = Nothing
End Function

Sub CreateReport(reportName As String, rs As DAO.Recordset, format As String, path As String)
    ' This subroutine generates a report based on the provided Recordset and saves it in the specified format.
    
    Dim rpt As Report
    
    On Error GoTo ErrorHandler
    
    ' Open the report in design view to set its data source
    DoCmd.OpenReport reportName, acViewDesign
    
    Set rpt = Reports(reportName)
    
    ' Set the record source of the report to the Recordset
    rpt.RecordSource = rs.Name
    
    ' Close the design view to save changes
    DoCmd.Close acReport, reportName, acSaveYes
    
    ' Export the report in the specified format
    Select Case UCase(format)
        Case "PDF"
            DoCmd.OutputTo acOutputReport, reportName, acFormatPDF, path & reportName & ".pdf"
        Case "EXCEL"
            DoCmd.OutputTo acOutputReport, reportName, acFormatXLSX, path & reportName & ".xlsx"
        Case Else
            MsgBox "Unsupported format: " & format, vbExclamation
            Exit Sub
    End Select
    
Exit Sub

ErrorHandler:
    MsgBox "Error generating report: " & reportName & vbCrLf & Err.Description, vbCritical
End Sub

