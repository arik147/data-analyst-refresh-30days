-- Day 10: Category totals (sales, profit, orders)
SELECT
  "CATEGORY",
  ROUND(SUM("SALES"), 2)            AS total_sales,
  ROUND(SUM("PROFIT"), 2)           AS total_profit,
  COUNT(DISTINCT "ORDER_ID")        AS total_orders
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY "CATEGORY"
ORDER BY total_sales DESC;
