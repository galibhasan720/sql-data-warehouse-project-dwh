INSERT INTO silver.erp_loc_a101 (cid, cntry)

SELECT 
	REPLACE(cid,'-', '') as cid,
	CASE 
		WHEN TRIM(cntry) = 'DE' THEN 'GERMANY'
		WHEN TRIM(cntry) IN ('US','USA') THEN 'United State'
		WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
		ELSE TRIM(cntry)
	END AS cntry
FROM bronze.erp_loc_a101

