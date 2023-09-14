-- Active: 1694625567604@@127.0.0.1@3306@kalbe
#Membuat tabel Inventory
CREATE TABLE Inventory (
    Item_code VARCHAR(10) PRIMARY KEY,
    Item_name VARCHAR(50),
    Item_price INT(10),
    Item_total INT(10));

#Menginput data ke dalam tabel Inventory
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES ("2341", "Promag Tablet", 3000, 100),
       ("2342", "Hydro Coco 250ML", 7000, 20),
       ("2343", "Nutrive Benecol 100ML", 20000, 30),
       ("2344", "Blackmores Vit C 500Mg", 95000, 45),
       ("2345", "Entrasol Gold 370G", 90000, 120);

#Menampilkan nama item yang memiliki total item tertinggi
SELECT Item_name
FROM inventory
WHERE Item_total = (SELECT MAX(Item_total) FROM Inventory);

#Meng-update harga item dari item yang dimaksud pada soal sebelumnya
WITH Max_total_item AS (
    SELECT MAX(Item_total) AS Total_Max
    FROM Inventory)
UPDATE Inventory
SET Item_price = 80000
WHERE Item_total = (SELECT * FROM Max_total_item);

#Menginput nama item lain yang memiliki kode item = 2343
INSERT INTO Inventory (Item_code, Item_name, Item_price, Item_total)
VALUES ("2343", "Komix Herbal Sachet", 10000, 100);

#Menghapus nama item yang memiliki total item terendah
WITH Min_total_item AS (
    SELECT MIN(Item_total) AS Total_Min
    FROM Inventory)
DELETE FROM inventory
WHERE Item_total = (SELECT * FROM Min_total_item);