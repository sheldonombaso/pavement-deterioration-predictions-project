/*
======================================================
SILVER  LAYER
==========================

===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL process to populate the Silver
    schema tables from the Bronze schema.

Actions:
    - Truncates Silver tables.
    - Cleans and transforms Bronze data.
    - Inserts transformed data into Silver tables.
===============================================================================
SELECT * FROM silver.primary_nyanza_data
--The above sql is for displaying rows

--SELECT COUNT (*)FROM bronze.crm_cust_info


*/

USE IRIDataWarehouse;
GO

CREATE OR ALTER PROCEDURE silver.load_silver
AS
BEGIN

    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time DATETIME;

    BEGIN TRY

        SET @batch_start_time = GETDATE();

        PRINT '====================================================================================================';
        PRINT 'Loading The silver Layer';
        PRINT '====================================================================================================';


        PRINT '--------------------------------------------------------------------------------------------------';
        PRINT 'Loading Primary Nyanza Data';
        PRINT '--------------------------------------------------------------------------------------------------';

        SET @start_time = GETDATE();

        PRINT '>> Truncating the Table: silver.primary_nyanza_data';

        TRUNCATE TABLE silver.primary_nyanza_data;

        PRINT '>> Inserting data into: silver.primary_nyanza_data';

        BULK INSERT silver.primary_nyanza_data
        FROM 'C:\Users\SHELDON\Desktop\IRIDatawareHouse\IRI_sql-data-warehouse-project\datasets\source_primary\nyanza_data.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
              + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR)
              + ' seconds';

        PRINT '>> -------------------------------';


        PRINT '--------------------------------------------------------------------------------------------------';
        PRINT 'Loading Secondary Kenya Data';
        PRINT '--------------------------------------------------------------------------------------------------';

        SET @start_time = GETDATE();

        PRINT '>> Truncating the Table: silver.secondary_kenya_data';

        TRUNCATE TABLE silver.secondary_kenya_data;

        PRINT '>> Inserting data into: silver.secondary_kenya_data';

        BULK INSERT silver.secondary_kenya_data
        FROM 'C:\Users\SHELDON\Desktop\IRIDatawareHouse\IRI_sql-data-warehouse-project\datasets\source_secondary\kenya_data.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
              + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR)
              + ' seconds';

        PRINT '>> -------------------------------';


        SET @batch_end_time = GETDATE();

        PRINT '======================================================================================';
        PRINT 'Loading silver Layer Is Completed';
        PRINT ' - Total Load Duration: '
              + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR)
              + ' seconds';
        PRINT '======================================================================================';

    END TRY

    BEGIN CATCH

        PRINT '======================================================================================';
        PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '======================================================================================';

    END CATCH

END;
GO

