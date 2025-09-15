-- Day 9 – RIGHT JOIN: Product Catalog vs sold items
WITH product_catalog AS (
  -- A tiny catalog sample (some items never sold)
  SELECT 'OFF-PA-10000100' AS PRODUCT_ID, 'Paper'      AS SUB_CATEGORY UNION ALL
  SELECT 'TEC-PH-10002000' AS PRODUCT_ID, 'Phones'     AS SUB_CATEGORY UNION ALL
  SELECT 'FUR-TA-10003000' AS PRODUCT_ID, 'Tables'     AS SUB_CATEGORY UNION ALL
  SELECT 'OFF-ST-10004000' AS PRODUCT_ID, 'Storage'    AS SUB_CATEGORY
),
sold AS (
  SELECT
    "PRODUCT_ID",
    ROUND(SUM("SALES"),2)  AS sales_sum,
    COUNT(*)               AS order_lines
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "PRODUCT_ID"
)
SELECT
  c.PRODUCT_ID,
  c.SUB_CATEGORY,
  s.sales_sum,
  s.order_lines,
  CASE WHEN s.PRODUCT_ID IS NULL THEN 'NEVER SOLD' ELSE 'SOLD' END AS sale_status
FROM sold s
RIGHT JOIN product_catalog c
  ON s.PRODUCT_ID = c.PRODUCT_ID
ORDER BY sale_status DESC, c.SUB_CATEGORY;

-- Focus on NEVER SOLD items (exist in catalog, absent in sales)
SELECT *
FROM (
  SELECT c.PRODUCT_ID, c.SUB_CATEGORY, s.sales_sum, s.order_lines
  FROM sold s
  RIGHT JOIN product_catalog c
    ON s.PRODUCT_ID = c.PRODUCT_ID
)
WHERE sales_sum IS NULL;
