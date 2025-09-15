-- Day 9 – FULL OUTER JOIN: Data quality check (budgets vs actuals)
WITH actuals AS (
  SELECT
    "REGION",
    DATE_TRUNC('year', "ORDER_DATE") AS yr,
    ROUND(SUM("SALES"), 2)           AS actual_sales
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "REGION", DATE_TRUNC('year', "ORDER_DATE")
),
budgets AS (  -- demo budgets include an extra region to show right-only rows
  SELECT 'West'   AS REGION, TO_DATE('2016-01-01') AS yr, 2700000.00 AS budget_sales UNION ALL
  SELECT 'East'   AS REGION, TO_DATE('2016-01-01') AS yr, 2600000.00 UNION ALL
  SELECT 'Central'AS REGION, TO_DATE('2016-01-01') AS yr, 1900000.00 UNION ALL
  SELECT 'South'  AS REGION, TO_DATE('2016-01-01') AS yr, 1600000.00 UNION ALL
  SELECT 'North'  AS REGION, TO_DATE('2016-01-01') AS yr, 1500000.00  -- doesn't exist in actuals
)
SELECT
  COALESCE(a.REGION, b.REGION) AS REGION,
  COALESCE(a.yr,     b.yr)     AS yr,
  a.actual_sales,
  b.budget_sales,
  (a.actual_sales - b.budget_sales) AS variance
FROM actuals a
FULL OUTER JOIN budgets b
  ON a.REGION = b.REGION AND a.yr = b.yr
ORDER BY REGION;

-- Left-only (in actuals but not in budgets)
SELECT *
FROM (
  SELECT COALESCE(a.REGION,b.REGION) REGION, a.actual_sales, b.budget_sales
  FROM actuals a
  FULL OUTER JOIN budgets b ON a.REGION = b.REGION AND a.yr = b.yr
)
WHERE budget_sales IS NULL;

-- Right-only (in budgets but not in actuals)
SELECT *
FROM (
  SELECT COALESCE(a.REGION,b.REGION) REGION, a.actual_sales, b.budget_sales
  FROM actuals a
  FULL OUTER JOIN budgets b ON a.REGION = b.REGION AND a.yr = b.yr
)
WHERE actual_sales IS NULL;