-- Day 9 – LEFT JOIN: Actuals vs Targets by Region (monthly)
WITH monthly_actuals AS (
  SELECT
    "REGION",
    DATE_TRUNC('month', "ORDER_DATE") AS month,
    ROUND(SUM("SALES"), 2)            AS actual_sales
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "REGION", DATE_TRUNC('month', "ORDER_DATE")
),
region_targets AS (  -- toy targets for demo
  SELECT 'West'   AS REGION, TO_DATE('2016-01-01') AS month, 650000.00 AS target_sales UNION ALL
  SELECT 'East'   AS REGION, TO_DATE('2016-01-01') AS month, 620000.00 UNION ALL
  SELECT 'Central'AS REGION, TO_DATE('2016-01-01') AS month, 480000.00 UNION ALL
  SELECT 'South'  AS REGION, TO_DATE('2016-01-01') AS month, 420000.00
)
SELECT
  a.REGION,
  a.month,
  a.actual_sales,
  t.target_sales,
  (a.actual_sales - t.target_sales) AS variance_to_target
FROM monthly_actuals a
LEFT JOIN region_targets t
  ON a.REGION = t.REGION
 AND a.month  = t.month
ORDER BY a.month, a.REGION;

-- Investigate unmatched (no target defined)
-- These are rows kept by LEFT JOIN where target is NULL
SELECT *
FROM (
  SELECT
    a.REGION, a.month, a.actual_sales, t.target_sales
  FROM monthly_actuals a
  LEFT JOIN region_targets t
    ON a.REGION = t.REGION AND a.month = t.month
)
WHERE target_sales IS NULL
ORDER BY month, REGION;
