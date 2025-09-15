-- Day 10: Loss-making groups at finer grain (Category × Sub-Category × Segment)
SELECT
  "CATEGORY",
  "SUB_CATEGORY",
  "SEGMENT",
  ROUND(SUM("SALES"), 2)  AS total_sales,
  ROUND(SUM("PROFIT"), 2) AS total_profit
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY "CATEGORY","SUB_CATEGORY","SEGMENT"
HAVING SUM("PROFIT") < 0
ORDER BY total_profit ASC;