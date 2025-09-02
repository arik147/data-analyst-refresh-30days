-- Orders between $500 and $1000 in Sales
-- SELECT
--   "ORDER_ID",
--   "CUSTOMER_NAME",
--   "SALES"
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "SALES" BETWEEN 500 AND 1000
-- ORDER BY
--   "SALES" DESC;

-- Customers with name starting with 'A'
-- SELECT
--   "CUSTOMER_NAME",
--   "SALES"
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "CUSTOMER_NAME" LIKE 'A%';

-- Products containing 'Chair'
-- SELECT
--   "PRODUCT_NAME",
--   "SALES"
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "PRODUCT_NAME" LIKE '%Chair%';

-- Sales in specific regions
-- SELECT
--   "REGION",
--   SUM("SALES") AS TOTAL_SALES
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "REGION" IN ('West', 'East')
-- GROUP BY
--   "REGION";

-- Categories with total sales above 700,000
-- SELECT
--   "CATEGORY",
--   SUM("SALES") AS TOTAL_SALES
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- GROUP BY
--   "CATEGORY"
-- HAVING
--   SUM("SALES") > 700000
-- ORDER BY
--   TOTAL_SALES DESC;

-- Orders between $500 and $1000 (summary)
-- SELECT
--   COUNT(*) AS order_count,
--   ROUND(AVG("SALES"),2) AS avg_sales,
--   ROUND(SUM("SALES"),2) AS total_sales
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "SALES" BETWEEN 500 AND 1000;

-- Products containing 'Chair'
-- SELECT
--   COUNT(DISTINCT "ORDER_ID") AS orders_with_chair,
--   ROUND(SUM("SALES"),2) AS total_sales_chair
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "PRODUCT_NAME" LIKE '%Chair%';

-- Sales only in East & West
-- SELECT
--   "REGION",
--   ROUND(SUM("SALES"),2) AS total_sales,
--   COUNT(DISTINCT "ORDER_ID") AS order_count
-- FROM
--   "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
-- WHERE
--   "REGION" IN ('West','East')
-- GROUP BY
--   "REGION"
-- ORDER BY
--   total_sales DESC;

-- Only categories with total sales above 700,000
SELECT
  "CATEGORY",
  ROUND(SUM("SALES"),2) AS total_sales,
  ROUND(AVG("SALES"),2) AS avg_order_sales
FROM
  "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY
  "CATEGORY"
HAVING
  SUM("SALES") > 700000
ORDER BY
  total_sales DESC;

