DROP EXTERNAL TABLE REVENUE;
CREATE EXTERNAL TABLE REVENUE(
    Dealer_ID   varchar(4000) ,  -- Foreign Key to Dealer Dimension
    Model_ID    varchar(4000),  -- Foreign Key to Model Dimension
    Branch_ID   varchar(4000),  -- Foreign Key to Branch Dimension
    Date_ID     varchar(4000) ,  -- Foreign Key to Date Dimension
    Units_Sold  BIGINT ,  -- Number of units sold
    Revenue     BIGINT
)
WITH 
(
    LOCATION='revenue_cetas',
    DATA_SOURCE=raw_ext_source,
    FILE_FORMAT=PARQUET_FORMAT
)

--------------------
----POLYBASE--------
--------------------

CREATE TABLE POLYBASE_TABLE
WITH    
    (
        DISTRIBUTION= ROUND_ROBIN
    )
AS
SELECT * FROM dbo.REVENUE;

SELECT * FROM POLYBASE_TABLE;