
#Loading cleaned data into silver_crm_cust_info

truncate table silver_crm_cust_info;
insert into silver_crm_cust_info(
	cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
select 
cst_id,
cst_key,
trim(cst_firstname) as cst_firstname,
trim(cst_lastname) as cst_lastname,
case 
	when upper(trim(cst_marital_status)) = 'S' then 'Single'
    when upper(trim(cst_marital_status)) = 'M' then 'Married'
    else 'NA'
end as cst_marital_status,
case 
	when upper(trim(cst_gndr)) = 'M' then 'Male'
    when upper(trim(cst_gndr)) = 'F' then 'Female'
    else 'NA'
end as cst_gndr,
cst_create_date
from
(
select * ,
row_number() over (partition by cst_id order by cst_create_date desc) as flag_last
from bronze_crm_cust_info ) t
where flag_last =1 and cst_id != 0;


#================================================================================
#Loading cleaned data into silver_prd_info

truncate table silver_crm_prd_info;
insert into silver_crm_prd_info (
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line
)
select
	prd_id,
    replace(substring(prd_key,1,5),'-','_') as cat_id,
	substring(prd_key,7,length(prd_key)) as prd_key,
    prd_nm,
	ifnull(prd_cost,0) as prd_cost,
    case 
		when upper(trim(prd_line))='M' then 'Mountain'
        when upper(trim(prd_line))='R' then 'Road'
        when upper(trim(prd_line))='S' then 'Other Sales'
        when upper(trim(prd_line))='T' then 'Touring'
        else 'NA'
	end as prd_line
from bronze_crm_prd_info;


#================================================================================
#Loading cleaned data into silver_crm_sales_details

truncate table silver_crm_sales_details;
insert into silver_crm_sales_details (
    sls_order_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_quantity,
    sls_price,
    sls_sales
)

select 
    sls_order_num,
    sls_prd_key,
    sls_cust_id,
    case 
        when sls_order_dt = 0 or length(cast(sls_order_dt as char)) != 8 or str_to_date(cast(sls_order_dt as char),'%Y%m%d') is null then null
        else str_to_date(cast(sls_order_dt as char),'%Y%m%d')
    end as sls_order_dt,

    case 
		when sls_ship_dt = 0 or length(cast(sls_ship_dt as char)) != 8
             or str_to_date(cast(sls_ship_dt as char),'%Y%m%d') is null
        then null
        else str_to_date(cast(sls_ship_dt as char),'%Y%m%d')
	end as sls_ship_dt,

    case 
        when sls_due_dt = 0 
             or length(cast(sls_due_dt as char)) != 8
             or str_to_date(cast(sls_due_dt as char),'%Y%m%d') is null
        then null
        else str_to_date(cast(sls_due_dt as char),'%Y%m%d')
    end as sls_due_dt,

    sls_quantity,

    case 
        when sls_price is null or sls_price <= 0  then sls_sales / nullif(sls_quantity,0)
        else sls_price
    end as sls_price,

    case 
		when sls_sales is null 
             or sls_sales <= 0 
             or sls_sales != sls_quantity * abs(sls_price)
        then sls_quantity * abs(sls_price)
        else sls_sales
    end as sls_sales

from bronze_crm_sales_details;


#================================================================================
#Loading cleaned data into silver_erp_cust_az12

truncate table silver_erp_cust_az12;
insert into silver_erp_cust_az12 (
	cid,
    bdate,
    gen
)
select
    case 
		when cid like 'NAS%' then substring(cid,4,length(cid))
        else cid
	end as cid,
    case 
		when bdate<'1924-01-01' or bdate>now() then null
        else bdate
	end as bdate,
    gen
    from bronze_erp_cust_az12;
    
    
#================================================================================
#Loading cleaned data into silver_erp_loc_a101

truncate table silver_erp_loc_a101;
insert into silver_erp_loc_a101 (
	cid,
    cntry
)
select
	replace(cid,'-','') as cid,
    case 
		when trim(cntry) = '' or cntry is null then 'NA'
        else trim(cntry)
	end as cntry
    from bronze_erp_loc_a101;


#================================================================================
#Loading cleaned data into silver_erp_px_cat_g1v2

truncate table silver_erp_px_cat_g1v2;
insert into silver_erp_px_cat_g1v2(
	id,
    cat,
    subcat,
    maintenance
)
select
	id,
    cat,
    subcat,
    maintenance
    from bronze_erp_px_cat_g1v2;












































