-- Day 8: Loss rate analysis by loyalty tier
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
  COUNT(*) AS orders,
  SUM(CASE WHEN o."PROFIT" < 0 THEN 1 ELSE 0 END) AS loss_orders,
  ROUND(100.0 * SUM(CASE WHEN o."PROFIT" < 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS loss_rate_pct
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES" o
INNER JOIN customer_info c
  ON o."CUSTOMER_ID" = c."CUSTOMER_ID"
GROUP BY c.loyalty_tier
ORDER BY loss_rate_pct DESC;
