/*
  ===============================================================================
Stored Procure:Load Bronze Layer (Source - > Bronze)
===================================================================================
Scrpit Purpose: 
              This loads data into bronze schema from external csv
              IT: Truncates dronze data before loading data
                  Uses BULK insert to load all data
===================================================================================              
*/

--EXEC bronze.load_bronze

USE IRIDataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time DATETIME;

    BEGIN TRY

        SET @batch_start_time = GETDATE();

        PRINT '====================================================================================================';
        PRINT 'Loading The Bronze Layer';
        PRINT '====================================================================================================';


        PRINT '--------------------------------------------------------------------------------------------------';
        PRINT 'Loading Primary Nyanza Data';
        PRINT '--------------------------------------------------------------------------------------------------';

        SET @start_time = GETDATE();

        PRINT '>> Truncating the Table: bronze.primary_nyanza_data';

        TRUNCATE TABLE bronze.primary_nyanza_data;

        PRINT '>> Inserting data into: bronze.primary_nyanza_data';

        BULK INSERT bronze.primary_nyanza_data
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

        PRINT '>> Truncating the Table: bronze.secondary_kenya_data';

        TRUNCATE TABLE bronze.secondary_kenya_data;

        PRINT '>> Inserting data into: bronze.secondary_kenya_data';

        BULK INSERT bronze.secondary_kenya_data
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
        PRINT 'Loading Bronze Layer Is Completed';
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

