SELECT
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted Spaces
-- Expectation: no result
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLs or Nnegative Numbers
-- Expectation: NO results
SELECT
ISNULL(prd_cost,0) AS prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL


-- Data Standardizarion & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info


-- Check for Invalid Date Orderes
-- Expectations: NO result
SELECT *
FROM silver.crm_prd_info
WHERE prd_start_dt > prd_end_dt

-- Solution using LEAD
SELECT 
prd_id,
prd_key,
prd_nm,
CAST(prd_start_dt AS DATE) AS prd_start_dt,
--ISNULL(prd_end_dt,0) AS prd_end_dt,
CAST(LEAD (prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS DATE) AS prd_end_dt_test
FROM bronze.crm_prd_info
WHERE prd_key IN ('AC-HE-HL-U509-R', 'AC-HE-HL-U509')
