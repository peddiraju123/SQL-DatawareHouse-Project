-- Bronze Layer Load Script

-- Start Time
SET @start_time = NOW();
SELECT 'Bronze Load Started' AS Status, @start_time AS Start_Time;

-- CRM TABLES

TRUNCATE TABLE bronze_crm_cust_info;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_info.csv'
IGNORE
INTO TABLE bronze_crm_cust_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_crm_cust_info loaded' AS Status;


TRUNCATE TABLE bronze_crm_prd_info;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/prd_info.csv'
IGNORE
INTO TABLE bronze_crm_prd_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_crm_prd_info loaded' AS Status;

TRUNCATE TABLE bronze_crm_sales_details;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_details.csv'
IGNORE
INTO TABLE bronze_crm_sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_crm_sales_details loaded' AS Status;


-- ERP TABLES

TRUNCATE TABLE bronze_erp_cust_az12;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CUST_AZ12.csv'
IGNORE
INTO TABLE bronze_erp_cust_az12
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_erp_cust_az12 loaded' AS Status;

TRUNCATE TABLE bronze_erp_loc_a101;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/LOC_A101.csv'
IGNORE
INTO TABLE bronze_erp_loc_a101
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_erp_loc_a101 loaded' AS Status;

TRUNCATE TABLE bronze_erp_px_cat_g1v2;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PX_CAT_G1V2.csv'
IGNORE
INTO TABLE bronze_erp_px_cat_g1v2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 'bronze_erp_px_cat_g1v2 loaded' AS Status;


SET @end_time = NOW();

SELECT 
    'Bronze Load Completed' AS Status,
    @start_time AS Start_Time,
    @end_time AS End_Time,
    TIMESTAMPDIFF(SECOND,@start_time,@end_time) AS Duration_Seconds;