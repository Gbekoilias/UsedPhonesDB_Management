using System;
using System.Collections.Generic;
using Microsoft.Office.Interop.Excel;

namespace OfficeAutomationApp
{
    public class DataProcessor
    {
        // Variables
        private List<string> dataList; // Holds raw data
        private List<string> processedData; // Holds processed data
        private string report; // Holds the generated report

        // Constructor
        public DataProcessor(List<string> initialData)
        {
            dataList = initialData;
            processedData = new List<string>();
            report = string.Empty;
        }

        // Method to process the data
        public void ProcessData()
        {
            foreach (var item in dataList)
            {
                // Example processing: Convert to uppercase and trim whitespace
                var processedItem = item.Trim().ToUpper();
                processedData.Add(processedItem);
            }
            GenerateReport();
        }

        // Method to generate a report from processed data
        private void GenerateReport()
        {
            report = "Processed Data Report:\n";
            report += new string('-', 30) + "\n";

            foreach (var item in processedData)
            {
                report += item + "\n";
            }
        }

        // Method to export processed data to Excel
        public void ExportToExcel(string filePath)
        {
            Application excelApp = new Application();
            Workbook workbook = excelApp.Workbooks.Add();
            Worksheet worksheet = (Worksheet)workbook.Worksheets[1];

            // Write headers
            worksheet.Cells[1, 1] = "Processed Data";

            // Write processed data to Excel
            for (int i = 0; i < processedData.Count; i++)
            {
                worksheet.Cells[i + 2, 1] = processedData[i];
            }

            // Save the workbook
            workbook.SaveAs(filePath);
            workbook.Close();
            excelApp.Quit();

            Console.WriteLine($"Data exported to Excel at {filePath}");
        }

        // Method to display the generated report
        public void DisplayReport()
        {
            Console.WriteLine(report);
        }
    }
}
