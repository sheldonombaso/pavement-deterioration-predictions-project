USE IRIDataWarehouse;
GO
/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
-- ============================================================
-- PRIMARY NYANZA DATA
-- ============================================================

IF OBJECT_ID('bronze.primary_nyanza_data', 'U') IS NOT NULL
    DROP TABLE bronze.primary_nyanza_data;
GO
CREATE TABLE bronze.primary_nyanza_data (
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
    [thickness_mm] VARCHAR(MAX)
);

GO


-- ============================================================
-- SECONDARY KENYA DATA
-- ============================================================

IF OBJECT_ID('bronze.secondary_kenya_data', 'U') IS NOT NULL
    DROP TABLE bronze.secondary_kenya_data;
GO
CREATE TABLE bronze.secondary_kenya_data (
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
    [thickness_mm] VARCHAR(MAX)
);
GO
