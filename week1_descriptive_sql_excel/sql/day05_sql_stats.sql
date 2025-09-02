-- SELECT
--   MIN("SALES")                              AS min_sales,
--   MAX("SALES")                              AS max_sales,
--   ROUND(AVG("SALES"), 2)                    AS avg_sales,
--   ROUND(STDDEV_SAMP("SALES"), 2)            AS stdev_sales
-- FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES";


-- SELECT
--   MIN("PROFIT")                             AS min_profit,
--   MAX("PROFIT")                             AS max_profit,
--   ROUND(AVG("PROFIT"), 2)                   AS avg_profit,
--   ROUND(STDDEV_SAMP("PROFIT"), 2)           AS stdev_profit
-- FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES";


-- SELECT CORR("SALES","PROFIT") AS corr_sales_profit
-- FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE "SALES" IS NOT NULL AND "PROFIT" IS NOT NULL;


WITH stats AS (
  SELECT AVG("SALES") AS mean_sales,
         STDDEV_SAMP("SALES") AS sd_sales
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
)
SELECT
  s."ORDER_ID",
  s."CUSTOMER_NAME",
  s."SALES"
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES" s, stats
WHERE s."SALES" > stats.mean_sales + 3 * stats.sd_sales
ORDER BY s."SALES" DESC;