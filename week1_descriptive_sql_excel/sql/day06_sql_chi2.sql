WITH obs AS (
  SELECT "REGION", "SEGMENT", COUNT(*) AS obs_cnt
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY "REGION","SEGMENT"
),
row_tot AS (
  SELECT "REGION", SUM(obs_cnt) AS row_total
  FROM obs
  GROUP BY "REGION"
),
col_tot AS (
  SELECT "SEGMENT", SUM(obs_cnt) AS col_total
  FROM obs
  GROUP BY "SEGMENT"
),
grand AS (
  SELECT SUM(obs_cnt) AS grand_total FROM obs
),
exp AS (
  SELECT
    o."REGION",
    o."SEGMENT",
    o.obs_cnt,
    (rt.row_total * ct.col_total) / g.grand_total::FLOAT AS exp_cnt
  FROM obs o
  JOIN row_tot rt ON o."REGION" = rt."REGION"
  JOIN col_tot ct ON o."SEGMENT" = ct."SEGMENT"
  CROSS JOIN grand g
)
SELECT
  SUM( POWER(exp.obs_cnt - exp.exp_cnt, 2) / NULLIF(exp.exp_cnt,0) ) AS chi2_stat,
  (
    (SELECT COUNT(DISTINCT "REGION")  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES") - 1
  ) *
  (
    (SELECT COUNT(DISTINCT "SEGMENT") FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES") - 1
  ) AS df
FROM exp;
