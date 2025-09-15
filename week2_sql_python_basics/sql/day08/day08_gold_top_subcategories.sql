-- Day 8: Top sub-categories for Gold customers
WITH customer_sales AS (
  SELECT "CUSTOMER_ID","CUSTOMER_NAME",
         SUM("SALES") total_sales
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "CUSTOMER_ID","CUSTOMER_NAME"
),
customer_info AS (
  SELECT "CUSTOMER_ID","CUSTOMER_NAME", total_sales,
         CASE WHEN total_sales >= 10000 THEN 'Gold'
              WHEN total_sales >= 5000  THEN 'Silver'
              ELSE 'Bronze' END AS loyalty_tier
  FROM customer_sales
)
SELECT
  o."SUB_CATEGORY",
  ROUND(SUM(o."SALES"),2) AS sales_gold,
  COUNT(*) AS orders_gold
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES" o
INNER JOIN customer_info c
  ON o."CUSTOMER_ID" = c."CUSTOMER_ID"
WHERE c.loyalty_tier = 'Gold'
GROUP BY o."SUB_CATEGORY"
ORDER BY sales_gold DESC
LIMIT 10;
