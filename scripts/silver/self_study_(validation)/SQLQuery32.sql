--remove '-' from cid for joing with cst_key (mathing)
SELECT
	REPLACE(cid,'-', '') as cid,
	cntry
FROM bronze.erp_loc_a101
--WHERE REPLACE(cid,'-', '') NOT IN (SELECT cst_key FROM silver.crm_cust_info)



--Country cleaning
SELECT DISTINCT
CASE 
	WHEN TRIM(cntry) = 'DE' THEN 'GERMANY'
	WHEN TRIM(cntry) IN ('US','USA') THEN 'United State'
	WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	ELSE TRIM(cntry)
END AS cntry
FROM bronze.erp_loc_a101