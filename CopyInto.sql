
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
                       FIELD_TERMINATOR = ','
        )

    )


---------------------------------
--CREATE PARQUET FILE FORMAT-----
---------------------------------

CREATE EXTERNAL FILE FORMAT parquet_format
WITH
    (
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
    )

------------------
--create sql table
------------------


CREATE TABLE COPY_INTO_TABLE
(
    Dealer_ID VARCHAR(4000),
    Model_ID VARCHAR (4000),
    Branch_ID VARCHAR(4000),
    Date_ID VARCHAR(4000),
    Units_Sold BIGINT,
    Revenue BIGINT
)
WITH
    (
    DISTRIBUTION=ROUND_ROBIN
    )


COPY INTO COPY_INTO_TABLE
(
    Dealer_ID 1,
    Model_ID 2,
    Branch_ID 3, 
    Date_ID 4,
    Units_Sold 5,
    Revenue 6
)
FROM 'https://mystorageaccountrachit.dfs.core.windows.net/synapse/revenue_cetas/'
WITH 
    (
        FILE_TYPE='PARQUET',
        CREDENTIAL= (IDENTITY='managed identity')
    );


SELECT * FROM COPY_INTO_TABLE;


