
--Create calendar view
CREATE VIEW gold.Calendar AS
SELECT 
    * 
FROM 
OPENROWSET(
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/calendar/',
    FORMAT='parquet'
) AS Calendar;



--Create customer view
CREATE VIEW gold.customers AS
SELECT * FROM 
OPENROWSET(
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/customers',
    FORMAT='parquet'
) as  customers;


CREATE VIEW gold.product_categories AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/procat',
    FORMAT='parquet'
) as procat;


CREATE VIEW gold.product AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/product',
    FORMAT='parquet'
) as product;


CREATE VIEW gold.product_subcategories AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/prosubcat',
    FORMAT='parquet'
) as prosubcat;


CREATE VIEW gold.returns AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/returns',
    FORMAT='parquet'
) as returns1;


CREATE VIEW gold.sales AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/sales',
    FORMAT='parquet'
) as sales;


CREATE VIEW gold.territory AS
SELECT *
FROM 
OPENROWSET (
    BULK 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/territory',
    FORMAT='parquet'
) as territory;