--Identify out of range dates

SELECT
	bdate,
	CASE WHEN bdate > GETDATE() THEN NULL
	ELSE bdate
	END AS bdate
FROM silver.erp_cust_az12
WHERE bdate > GETDATE()

--Data Standardization & Consistency
SELECT DISTINCT 
	gen,
	CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
	WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
	ELSE 'n/a'
	END AS gen
FROM silver.erp_cust_az12

--Check the insertation
SELECT DISTINCT * FROM silver.erp_cust_az12