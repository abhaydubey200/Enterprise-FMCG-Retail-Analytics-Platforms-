CREATE DATABASE Software_Retail_Analytics;


Select * from dbo.Events;
Select * from dbo.Products;
Select * from dbo.Customers;
Select * from dbo.DataDictionary;


SELECT name 
FROM sys.databases;


USE Retail_Enterprise_Analytics;
GO

SELECT 
    t.name AS TableName,
    c.name AS ColumnName,
    ty.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable,
    c.is_identity
FROM sys.tables t
JOIN sys.columns c ON t.object_id = c.object_id
JOIN sys.types ty ON c.user_type_id = ty.user_type_id
WHERE t.name IN (
    'Events',
    'Products',
    'Customers',
    'DataDictionary'
)
ORDER BY t.name, c.column_id;

	
