# UsedCellPhones-InventoryManagement  
![Logo](https://files.oaiusercontent.com/file-IFHKIZc2u2UuEufRtGQnnGjw?se=2024-11-21T16%3A21%3A33Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D61d2264f-d0e7-4f29-a32a-e9800bb29a28.webp&sig=GUk9782HQUQD8mJWQwZEwNLeHNARqhdZlYqcV5buxIk%3D)

## Project Overview  
This project involves creating an inventory management system for a used cell phone business using Microsoft Access, Excel, and Word. The database tracks phones sold to the company, devices available for resale, and buyers' details. The system also supports data import/export, advanced queries, forms, and reports for analysis and management.

---

## Features  
- **Data Import/Export**: Seamlessly import data from Excel into Access and export reports or tables to Word for documentation.  
- **Inventory Tracking**: Keep track of available and sold phones with detailed records.  
- **Custom Queries**: Generate insightful queries for data analysis, such as phones for sale or obsolete devices.  
- **Forms and Reports**: Create interactive forms and visually appealing reports for streamlined operations.  
- **Mail Merge**: Personalize buyer promotions using Word's Mail Merge feature.  
- **Relational Database Management**: Build and enforce one-to-many relationships between tables.

---

## Table of Contents  
1. [Installation](#installation)  
2. [Database Structure](#database-structure)  
3. [Project Tasks](#project-tasks)  
4. [Usage Instructions](#usage-instructions)  
5. [Sample Outputs](#sample-outputs)  
6. [Visuals](#visuals)  
7. [Contributors](#contributors)

---

## Installation  
1. Download the repository as a ZIP file and extract it.  
2. Open the `Phones_LastNameFirstName.accdb` Access file.  
3. Ensure Microsoft Office (Access, Excel, and Word) is installed on your computer.  
4. Place all Excel files in the same directory as the Access database.

---

## Database Structure  
### Primary Tables  
- **Inventory**: Main table for device tracking (fields include Model, Type, Purchase Date, Selling Price).  
- **Carriers**: Lists all carriers associated with devices.  
- **Manufacturers**: Contains unique manufacturers.  
- **Colours**: Stores device color information.  
- **Sellers/Buyers**: Tracks sellers and buyers.

### Relationships  
- **Inventory → Carriers** (One-to-Many via `CarrierID`)  
- **Inventory → Manufacturers** (One-to-Many via `ManufacturerID`)  
- **Inventory → Colours** (One-to-Many via `ColourID`)  
- **Inventory → Sellers/Buyers** (One-to-Many via `SellerID`/`BuyerID`)  

![Relationships Diagram](images/relationships-diagram.png)
![Navigation Panes](https://github.com/Gbekoilias/UsedPhonesDB_Management/blob/main/Navigation%20Pane.png?raw=true)
---

## Project Tasks  
### Part 1  
1. **Database Initialization**:  
   - Save and rename the database file. Update metadata fields.  
   - Import and configure Excel tables for Carriers, Manufacturers, and Colours.  

2. **Relationships Setup**:  
   - Establish and enforce referential integrity between tables.  

3. **Query Creation**:  
   - `Phones4Sale`: Display unsold phones sorted by `SellerLastName`.  
   - `NotApplePhones`: Exclude Apple devices from the results.  

### Part 2  
1. **Inventory Enhancements**:  
   - Add image attachments for phone models.  
   - Create Lookup fields for Buyers and Sellers.  

2. **Advanced Queries**:  
   - `PhonesSoldOR<50`: Display sold phones or those under $50.  
   - `ObsoletePhones`: Display unsold phones purchased before 4/1/2012.  

3. **Forms and Reports**:  
   - Add new buyers using an interactive form with the company logo.  
   - Generate mailing labels for buyers.  

4. **Mail Merge**:  
   - Use the Buyers table to personalize promotions.  

---

## Usage Instructions  
1. **Import Data**: Use Access to import Excel files (`Carriers`, `Manufacturers`, `Colours`).  
2. **Run Queries**: Execute saved queries for analysis.  
3. **Add Records**: Use interactive forms to input new buyer and seller data.  
4. **Generate Reports**: Create mailing labels or export tables to Word.  
5. **Perform Mail Merge**: Customize buyer communications with placeholders.

---

## Sample Outputs  
### Queries  
- **Phones4Sale Query**  
  ![Phones4Sale Query](images/phones4sale-query.png)

- **ObsoletePhones Query**  
  ![ObsoletePhones Query](images/obsoletephones-query.png)

### Reports  
- **Mailing Labels**  
  ![Mailing Labels](images/mailing-labels.png)

### Mail Merge  
- **Customized Buyer Letter**  
  ![Buyer Letter](images/buyer-letter.png)

---

## Visuals  
### Database Schema  
![Schema](images/database-schema.png)

### Process Flow  
![Process Flow](images/process-flow.png)

---

## Contributors  
- **Project Lead**: Ilias Olakunle Shittu-Gbeko  
- **Developed By**: Microsoft Office Users Group  

---

## License  
This project is open-source and available under the [MIT License](LICENSE).  

---

## Acknowledgments  
- Microsoft Access Documentation  
- Community forums for support and troubleshooting  
