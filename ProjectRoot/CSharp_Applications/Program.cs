using System;
using Microsoft.Office.Interop.Excel;
using Microsoft.Office.Interop.Word;
using Microsoft.Office.Interop.PowerPoint;

namespace OfficeAutomationApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Initialize the application context
            var applicationContext = new ApplicationContext();
            try
            {
                // Execute automation tasks
                Console.WriteLine("Choose an option:");
                Console.WriteLine("1. Automate Excel");
                Console.WriteLine("2. Automate Word");
                Console.WriteLine("3. Automate PowerPoint");
                Console.Write("Enter your choice (1-3): ");
                
                // Get user input
                string userInput = Console.ReadLine();
                
                switch (userInput)
                {
                    case "1":
                        result = AutomateExcel(applicationContext);
                        break;
                    case "2":
                        result = AutomateWord(applicationContext);
                        break;
                    case "3":
                        result = AutomatePowerPoint(applicationContext);
                        break;
                    default:
                        Console.WriteLine("Invalid choice. Please select 1, 2, or 3.");
                        return;
                }

                // Display the result of the automation task
                Console.WriteLine(result);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
            finally
            {
                // Clean up and close the application context
                applicationContext.Cleanup();
            }
        }

        private static string AutomateExcel(ApplicationContext context)
        {
            var excelApp = new Application();
            excelApp.Visible = true;

            // Create a new workbook and add some data
            Workbook workbook = excelApp.Workbooks.Add();
            Worksheet worksheet = (Worksheet)workbook.Worksheets[1];
            worksheet.Cells[1, 1] = "Hello, Excel!";
            
            // Save the workbook (optional)
            string filePath = @"C:\path\to\your\file.xlsx"; // Update with your path
            workbook.SaveAs(filePath);
            
            return $"Excel automation completed. File saved at {filePath}.";
        }

        private static string AutomateWord(ApplicationContext context)
        {
            var wordApp = new Application();
            wordApp.Visible = true;

            // Create a new document and add some text
            Document document = wordApp.Documents.Add();
            document.Content.Text = "Hello, Word!";
            
            // Save the document (optional)
            string filePath = @"C:\path\to\your\file.docx"; // Update with your path
            document.SaveAs2(filePath);
            
            return $"Word automation completed. File saved at {filePath}.";
        }

        private static string AutomatePowerPoint(ApplicationContext context)
        {
            var pptApp = new Application();
            pptApp.Visible = MsoTriState.msoTrue;

            // Create a new presentation and add a slide with text
            Presentation presentation = pptApp.Presentations.Add();
            Slide slide = presentation.Slides.Add(1, PpSlideLayout.ppLayoutText);
            slide.Shapes[1].TextFrame.TextRange.Text = "Hello, PowerPoint!";
            
            // Save the presentation (optional)
            string filePath = @"C:\path\to\your\presentation.pptx"; // Update with your path
            presentation.SaveAs(filePath);
            
            return $"PowerPoint automation completed. File saved at {filePath}.";
        }
    }

    public class ApplicationContext
    {
        public void Cleanup()
        {
            // Implement cleanup logic if needed (e.g., releasing COM objects)
        }
    }
}
