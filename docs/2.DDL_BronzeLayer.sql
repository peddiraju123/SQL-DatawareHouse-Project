/*
===============================================================================
Script: Bronze Layer Table Creation
Project: Data Warehouse Analytics
Layer: Bronze
===============================================================================

Description:
This script creates the Bronze layer tables in the Data Warehouse. 
The Bronze layer stores raw data ingested from different source systems 
such as CRM and ERP without any transformations.

If tables already exist, they will be dropped and recreated to ensure 
a clean structure before loading raw data.

Source Systems:
1. CRM System
2. ERP System
===============================================================================
*/

-- ---------------------------------------------------------------------------
-- Select Database
-- ---------------------------------------------------------------------------
USE datawarehouse;


-- ---------------------------------------------------------------------------
-- CRM TABLES
-- Raw customer information from CRM system
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_crm_cust_info;

CREATE TABLE bronze_crm_cust_info(
    cst_id INT NULL,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(20),
    cst_create_date DATE
);


-- ---------------------------------------------------------------------------
-- CRM PRODUCT INFORMATION
-- Stores product details from CRM
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_crm_prd_info;

CREATE TABLE bronze_crm_prd_info(
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);


-- ---------------------------------------------------------------------------
-- CRM SALES DETAILS
-- Stores transactional sales data
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_crm_sales_details;

CREATE TABLE bronze_crm_sales_details(
    sls_order_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);


-- ---------------------------------------------------------------------------
-- ERP TABLES
-- Location data from ERP system
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_erp_loc_a101;

CREATE TABLE bronze_erp_loc_a101(
    cid VARCHAR(50),
    cntry VARCHAR(50)
);


-- ---------------------------------------------------------------------------
-- ERP CUSTOMER DATA
-- Stores customer demographic information
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_erp_cust_az12;

CREATE TABLE bronze_erp_cust_az12(
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);


-- ---------------------------------------------------------------------------
-- ERP PRODUCT CATEGORY DATA
-- Contains product category and maintenance information
-- ---------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze_erp_px_cat_g1v2;

CREATE TABLE bronze_erp_px_cat_g1v2(
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);
