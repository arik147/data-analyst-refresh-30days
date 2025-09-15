-- Day 10: Region totals with a sales threshold (tune as needed)
-- Sanity check (all regions)
SELECT "REGION", ROUND(SUM("SALES"),2) AS total_sales
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY "REGION"
ORDER BY total_sales DESC;

-- Regions with sales above threshold (adjust 600000 as needed)
SELECT
  "REGION",
  ROUND(SUM("SALES"), 2)  AS total_sales,
  ROUND(SUM("PROFIT"), 2) AS total_profit
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY "REGION"
HAVING SUM("SALES") > 600000
ORDER BY total_sales DESC;
