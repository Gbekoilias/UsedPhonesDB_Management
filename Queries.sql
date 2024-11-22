SELECT Manufacturers.Manufacturers, 
       Device.DeviceDescription,
       Inventory.Model, 
       Inventory.PurchaseDate, 
       Inventory.AskingPrice, 
       Inventory.SellingPrice,  
       Inventory.SellDate
FROM Manufacturers INNER JOIN (Device INNER JOIN Inventory ON Device.TypeOfDevice = Inventory.TypeOfDevice) ON Manufacturers.ID = Inventory.ManufacturerID
WHERE (((Inventory.SellDate) Is Not Null)) OR (((Inventory.AskingPrice)<50))
ORDER BY Inventory.AskingPrice;

SELECT Inventory.SellDate, 
       Inventory.Model, 
       Inventory.SellerLastName, 
       Inventory.SellerFirstName
FROM Inventory
WHERE (((Inventory.SellDate) Is Null))
ORDER BY Inventory.SellerLastName;


SELECT Manufacturers.Manufacturers, 
       Device.DeviceDescription, 
       Inventory.Model, 
       Inventory.PurchaseDate, 
       Inventory.AskingPrice, 
       Inventory.SellingPrice, 
       Inventory.SellDate
FROM Manufacturers INNER JOIN (Device INNER JOIN Inventory ON Device.TypeOfDevice = Inventory.TypeOfDevice) ON Manufacturers.ID = Inventory.ManufacturerID
WHERE (((Inventory.PurchaseDate)<#1/4/2012#) AND ((Inventory.SellDate) Is Null))
ORDER BY Inventory.PurchaseDate;


SELECT Manufacturers.Manufacturers, 
       Device.DeviceDescription, 
       Inventory.Model, 
       Inventory.PurchaseDate, 
       Inventory.AskingPrice, 
       Inventory.SellingPrice, 
       Inventory.SellDate
FROM Manufacturers INNER JOIN (Device INNER JOIN Inventory ON Device.TypeOfDevice = Inventory.TypeOfDevice) ON Manufacturers.ID = Inventory.ManufacturerID
WHERE (((Inventory.SellDate) Is Not Null)) OR (((Inventory.AskingPrice)<50))
ORDER BY Inventory.AskingPrice;
