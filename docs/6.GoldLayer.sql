
#creating dimension customers
create view dim_customers as 
	select 
     row_number() over(order by cst_id) as customer_key,
	 ci.cst_id as customer_id,
	 ci.cst_key as customer_number,
	 ci.cst_firstname as first_name,
	 ci.cst_lastname as last_name,
	 ci.cst_marital_status as marital_status,
	 ci.cst_gndr as gender,
	 ca.bdate as birth_date,
	 l.cntry as country,
	 cst_create_date as create_date
	from silver_crm_cust_info ci
	left join silver_erp_cust_az12 ca
	on ci.cst_key = ca.cid
	left join silver_erp_loc_a101 l 
	on  ci.cst_key = l.cid;
    
#creating dimension products
create view  dim_products as
	select 
		p.prd_id as product_id,
        p.prd_key as product_key,
        p.prd_nm as product_name,
		p.cat_id as category_id,
        pc.cat as category,
		pc.subcat as sub_category,
		p.prd_cost as cost,
		p.prd_line as product_line
		from silver_crm_prd_info p
		left join silver_erp_px_cat_g1v2 pc
		on p.cat_id = pc.id;


#creating fact sales

create view fact_sales as 
	select 
		sls_order_num as order_number,
		pr.product_key as product_key,
		c.customer_id as customer_id,
		sls_order_dt as order_date,
		sls_ship_dt as shipping_date,
		sls_due_dt as due_date,
		sls_quantity as quantity,
		sls_price as price,
		sls_sales as sales
	from silver_crm_sales_details s
    left join dim_products pr
    on s.sls_prd_key=pr.product_key
    left join dim_customers c 
    on s.sls_cust_id = c.customer_id
































