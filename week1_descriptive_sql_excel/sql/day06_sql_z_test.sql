WITH flags AS (
  SELECT
    "SEGMENT",
    CASE WHEN "PROFIT" < 0 THEN 1 ELSE 0 END AS is_loss
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  WHERE "SEGMENT" IN ('Consumer','Corporate')
),
agg AS (
  SELECT
    "SEGMENT",
    COUNT(*)::FLOAT AS n,                 -- total orders
    SUM(is_loss)::FLOAT AS x,             -- loss orders
    SUM(is_loss)::FLOAT / COUNT(*) AS p   -- loss proportion
  FROM flags
  GROUP BY "SEGMENT"
),
pivot AS (
  SELECT
    MAX(CASE WHEN "SEGMENT"='Consumer' THEN n END) AS n1,
    MAX(CASE WHEN "SEGMENT"='Consumer' THEN x END) AS x1,
    MAX(CASE WHEN "SEGMENT"='Consumer' THEN p END) AS p1,
    MAX(CASE WHEN "SEGMENT"='Corporate' THEN n END) AS n2,
    MAX(CASE WHEN "SEGMENT"='Corporate' THEN x END) AS x2,
    MAX(CASE WHEN "SEGMENT"='Corporate' THEN p END) AS p2
  FROM agg
),
calc AS (
  SELECT
    n1, x1, p1, n2, x2, p2,
    (x1 + x2) / (n1 + n2) AS p_pool,
    (p1 - p2) / SQRT( ((x1 + x2)/(n1 + n2)) * (1 - (x1 + x2)/(n1 + n2)) * (1/n1 + 1/n2) ) AS z_stat
  FROM pivot
)
SELECT *,
  CASE
    WHEN ABS(z_stat) >= 1.96 THEN 'Significant at α=0.05'
    ELSE 'Not significant at α=0.05'
  END AS decision
FROM calc;
