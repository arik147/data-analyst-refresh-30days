-- Day 14: Rename a category label for presentation
SELECT 
  CATEGORY,
  REPLACE(CATEGORY, 'Office Supplies', 'Office & Supplies') AS CATEGORY_RENAMED
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
GROUP BY CATEGORY;