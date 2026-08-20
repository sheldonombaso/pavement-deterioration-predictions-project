/*

					---STEP 4---- DATA CLEANING (PART A)
--===========================================================================

--Part 1:BUILD BRONZE LAYER....copy bronze and replace silver
--Part 2: WE CHECK FOR DATA QUALITY HERE

---=====================================================================================================

1

===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
-- ============================================================
USE IRIDataWarehouse;
GO


IF OBJECT_ID('silver.primary_nyanza_data', 'U') IS NOT NULL
    DROP TABLE silver.primary_nyanza_data;
GO
CREATE TABLE silver.primary_nyanza_data (
    [year] VARCHAR(MAX),
    [road_code] VARCHAR(MAX),
    [road_name] VARCHAR(MAX),
    [road_type] VARCHAR(MAX),
    [distance] VARCHAR(MAX),
    [IRI] VARCHAR(MAX),
    [latitude] VARCHAR(MAX),
    [longitude] VARCHAR(MAX),
    [IRI_classification] VARCHAR(MAX),
    [good] VARCHAR(MAX),
    [fair] VARCHAR(MAX),
    [poor] VARCHAR(MAX),
    [construction_year] VARCHAR(MAX),
    [pavement_age] VARCHAR(MAX),
    [intervention_undertaken] VARCHAR(MAX),
    [intervention_required] VARCHAR(MAX),
    [surface_type] VARCHAR(MAX),
    [base_type] VARCHAR(MAX),
    [thickness_mm] VARCHAR(MAX),
    dwh_create_date DATETIME2 DEFAULT GETDATE().....--you can create extra column for your metadata eg pavement_
);

GO


-- ============================================================
-- SECONDARY KENYA DATA
-- ============================================================

IF OBJECT_ID('silver.secondary_kenya_data', 'U') IS NOT NULL
    DROP TABLE silver.secondary_kenya_data;
GO
CREATE TABLE silver.secondary_kenya_data (
    [year] VARCHAR(MAX),
    [road_code] VARCHAR(MAX),
    [road_name] VARCHAR(MAX),
    [road_type] VARCHAR(MAX),
    [distance] VARCHAR(MAX),
    [IRI] VARCHAR(MAX),
    [latitude] VARCHAR(MAX),
    [longitude] VARCHAR(MAX),
    [IRI_classification] VARCHAR(MAX),
    [good] VARCHAR(MAX),
    [fair] VARCHAR(MAX),
    [poor] VARCHAR(MAX),
    [construction_year] VARCHAR(MAX),
    [pavement_age] VARCHAR(MAX),
    [intervention_undertaken] VARCHAR(MAX),
    [intervention_required] VARCHAR(MAX),
    [surface_type] VARCHAR(MAX),
    [base_type] VARCHAR(MAX),
    [thickness_mm] VARCHAR(MAX),
    dwh_create_date DATETIME2 DEFAULT GETDATE()

);
GO
