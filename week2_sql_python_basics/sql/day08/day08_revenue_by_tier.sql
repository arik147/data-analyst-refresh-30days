-- Day 8: Revenue summary by loyalty tier
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
  c.loyalty_tier,
  ROUND(SUM(o."SALES"),2)  AS total_sales,
  COUNT(DISTINCT o."ORDER_ID") AS orders
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES" o
INNER JOIN customer_info c
  ON o."CUSTOMER_ID" = c."CUSTOMER_ID"
GROUP BY c.loyalty_tier
ORDER BY total_sales DESC;
