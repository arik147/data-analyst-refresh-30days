WITH base AS (
  SELECT EXTRACT(YEAR FROM "ORDER_DATE")::INT AS yr, "SALES" AS x
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  WHERE "SALES" IS NOT NULL AND "ORDER_DATE" IS NOT NULL
    AND EXTRACT(YEAR FROM "ORDER_DATE") IN (2015, 2016)
),
grp AS (  -- group stats
  SELECT
    yr,
    COUNT(*)::FLOAT AS n,
    AVG(x)          AS mean_x,
    VAR_SAMP(x)     AS var_x  -- unbiased sample variance
  FROM base
  GROUP BY yr
),
pivot AS (  -- separate rows into columns
  SELECT
    MAX(CASE WHEN yr=2015 THEN n END)      AS n1,
    MAX(CASE WHEN yr=2015 THEN mean_x END) AS m1,
    MAX(CASE WHEN yr=2015 THEN var_x END)  AS v1,
    MAX(CASE WHEN yr=2016 THEN n END)      AS n2,
    MAX(CASE WHEN yr=2016 THEN mean_x END) AS m2,
    MAX(CASE WHEN yr=2016 THEN var_x END)  AS v2
  FROM grp
)
SELECT
  m1, m2, n1, n2, v1, v2,
  /* Welch t-statistic */
  (m1 - m2) / SQRT( (v1/n1) + (v2/n2) )                       AS t_stat,
  /* Welch–Satterthwaite degrees of freedom */
  POWER( (v1/n1) + (v2/n2), 2 ) /
  ( POWER(v1/n1,2)/(n1-1) + POWER(v2/n2,2)/(n2-1) )           AS df
FROM pivot;
