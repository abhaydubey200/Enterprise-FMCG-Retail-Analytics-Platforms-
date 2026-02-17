
USE Retail_Enterprise_Analytics;
GO


CREATE OR ALTER VIEW dbo.v_retail_analytics AS
SELECT
    fs.order_id,
    fs.order_date,
    fs.customer_id,
    c.customer_name,
    c.segment AS customer_segment,
    c.loyalty_score,
    fs.product_id,
    p.category AS product_category,
    p.base_price,
    p.product_cost,
    fs.store_id,
    s.region AS store_region,
    s.channel AS store_channel,
    fs.employee_id,
    e.employee_name,
    e.role AS employee_role,
    fs.supplier_id,
    sup.supplier_name AS supplier_name,
    sup.avg_delay_days,
    sup.quality_score,
    fs.quantity,
    fs.discount_pct,
    fs.net_sales,
    fs.cost,
    fs.profit,
    fs.refund_flag,
    inv.inventory_date,
    inv.stock_level,
    inv.daily_sales AS daily_inventory_sales
FROM dbo.fact_sales fs
LEFT JOIN dbo.dim_customer c ON fs.customer_id = c.customer_id
LEFT JOIN dbo.dim_product p ON fs.product_id = p.product_id
LEFT JOIN dbo.dim_store s ON fs.store_id = s.store_id
LEFT JOIN dbo.dim_employee e ON fs.employee_id = e.employee_id
LEFT JOIN dbo.dim_supplier sup ON fs.supplier_id = sup.supplier_id
LEFT JOIN dbo.fact_inventory_daily inv
       ON fs.product_id = inv.product_id
       AND inv.inventory_date = fs.order_date;



	   SELECT * FROM dbo.dim_customer;



	   SELECT name AS TableName
FROM sys.tables
ORDER BY name;




USE Retail_Enterprise_Analytics;
GO

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'dim_customer',
    'dim_employee',
    'dim_product',
    'dim_store',
    'dim_supplier',
    'fact_inventory_daily',
    'fact_sales',
    'Missing_data'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;


SELECT * FROM dbo.v_retail_analytics ;
