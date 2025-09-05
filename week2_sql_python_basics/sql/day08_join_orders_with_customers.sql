-- Day 8: Join orders with customer_info (loyalty tiers)
WITH customer_sales AS (
  SELECT
    "CUSTOMER_ID","CUSTOMER_NAME",
    SUM("SALES") AS total_sales,
    SUM("PROFIT") AS total_profit,
    COUNT(*) AS order_count
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "CUSTOMER_ID","CUSTOMER_NAME"
),
customer_info AS (
  SELECT
    "CUSTOMER_ID","CUSTOMER_NAME",
    total_sales,total_profit,order_count,
    CASE
      WHEN total_sales >= 10000 THEN 'Gold'
      WHEN total_sales >= 5000  THEN 'Silver'
      ELSE 'Bronze'
    END AS loyalty_tier
  FROM customer_sales
)
SELECT
  o."ORDER_ID",
  o."ORDER_DATE",
  o."CUSTOMER_ID",
  c."CUSTOMER_NAME",
  c.loyalty_tier,
  o."REGION",
  o."CATEGORY",
  o."SALES",
  o."PROFIT"
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES" o
INNER JOIN customer_info c
  ON o."CUSTOMER_ID" = c."CUSTOMER_ID"
ORDER BY o."ORDER_DATE"
LIMIT 20;
