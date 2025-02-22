CREATE EXTERNAL TABLE REVENUE_CETAS
WITH
    (
        LOCATION='revenue_cetas',
        DATA_SOURCE=raw_ext_source,
        FILE_FORMAT=parquet_format
    )
AS
SELECT * FROM
OPENROWSET(
    BULK 'bronze',
    DATA_SOURCE='raw_ext_source',
    FORMAT='CSV',
    HEADER_ROW=TRUE,
    PARSER_VERSION='2.0'
) as query1

---------------------------------
-----CREATE VIEW-----------------
---------------------------------

CREATE VIEW REVENUE_VW
AS
SELECT * FROM 
OPENROWSET(
    BULK 'revenue_cetas',
    DATA_SOURCE='raw_ext_source',
    FORMAT='PARQUET'
) AS QUERY1
