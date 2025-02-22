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
    LOCATION='bronze',
    DATA_SOURCE=raw_ext_source,
    FILE_FORMAT=csv_ff
)

SELECT * FROM REVENUE;
