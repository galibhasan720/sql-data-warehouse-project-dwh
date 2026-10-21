SELECT
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


-- Check for unwanted spaces
-- Expectation: no results
SELECT
	cst_lastname,
	cst_key
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname) OR cst_key != TRIM(cst_key)

-- Data Standardization & Consistency
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

SELECT TOP 100 
* 
FROM silver.crm_cust_info