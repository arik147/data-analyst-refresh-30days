-- Day 8: Build customer_info table with loyalty tiers
WITH customer_sales AS (
  SELECT
    "CUSTOMER_ID",
    "CUSTOMER_NAME",
    SUM("SALES")  AS total_sales,
    SUM("PROFIT") AS total_profit,
    COUNT(*)      AS order_count
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "CUSTOMER_ID","CUSTOMER_NAME"
),
customer_info AS (
  SELECT
    "CUSTOMER_ID",
    "CUSTOMER_NAME",
    total_sales,
    total_profit,
    order_count,
    CASE
      WHEN total_sales >= 10000 THEN 'Gold'
      WHEN total_sales >= 5000  THEN 'Silver'
      ELSE 'Bronze'
    END AS loyalty_tier
  FROM customer_sales
)
SELECT * FROM customer_info
ORDER BY total_sales DESC
LIMIT 20;
