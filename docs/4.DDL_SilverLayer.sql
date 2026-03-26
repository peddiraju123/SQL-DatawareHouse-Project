USE datawarehouse;

DROP TABLE IF EXISTS silver_crm_cust_info;

CREATE TABLE silver_crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(20),
    cst_create_date DATE,
    dwh_create_date datetime default current_timestamp
);

DROP TABLE IF EXISTS silver_crm_prd_info;

CREATE TABLE silver_crm_prd_info(
    prd_id INT,
    cat_id varchar(50),
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    dwh_create_date datetime default current_timestamp
);

DROP TABLE IF EXISTS silver_crm_sales_details;

CREATE TABLE silver_crm_sales_details(
    sls_order_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt date,
    sls_ship_dt date,
    sls_due_dt date,
    sls_quantity INT,
    sls_price INT,
    sls_sales INT,
    dwh_create_date datetime default current_timestamp
);

DROP TABLE IF EXISTS silver_erp_loc_a101;

CREATE TABLE silver_erp_loc_a101(
    cid VARCHAR(50),
    cntry VARCHAR(50),
    dwh_create_date datetime default current_timestamp
);

DROP TABLE IF EXISTS silver_erp_cust_az12;

CREATE TABLE silver_erp_cust_az12(
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50),
    dwh_create_date datetime default current_timestamp
);

DROP TABLE IF EXISTS silver_erp_px_cat_g1v2;

CREATE TABLE silver_erp_px_cat_g1v2(
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50),
    dwh_create_date datetime default current_timestamp
);