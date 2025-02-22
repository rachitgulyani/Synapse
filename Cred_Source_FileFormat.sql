 
-------------------------------
--------CREDENTIALS------------
-------------------------------

CREATE DATABASE SCOPED CREDENTIAL rachitcreds
WITH 
    IDENTITY = 'managed identity';


------------------------------
-----CREATE EXTERNAL SOURCE
------------------------------

CREATE EXTERNAL DATA SOURCE raw_ext_source
WITH 
    (
        LOCATION = 'abfss://synapse@mystorageaccountrachit.dfs.core.windows.net/',
        CREDENTIAL= rachitcreds
    )


------------------------------
-----CREATE FILE FORMAT
------------------------------

CREATE EXTERNAL FILE FORMAT csv_format
WITH 
    (
        FORMAT_TYPE=DELIMITEDTEXT,
        FORMAT_OPTIONS(
                       FIELD_TERMINATOR = ''
        )

    )

-------------------------------
----- OPENROWSET FUNCTION------
-------------------------------

SELECT * FROM 
OPENROWSET(
    BULK 'bronze',
    DATA_SOURCE= 'raw_ext_source',
    FORMAT='CSV',
    PARSER_VERSION='2.0',
    HEADER_ROW = TRUE
) as [result];



---------------------------------
--CREATE PARQUET FILE FORMAT-----
---------------------------------

CREATE EXTERNAL FILE FORMAT parquet_format
WITH
    (
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
    )


