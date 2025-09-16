# 📅 Day 13 — CASE Statements & Conditional Logic (Demo Results & Insights)

*Note:* These example outputs are generated from a synthetic Superstore-like dataset to demonstrate structure and insights. Replace with your Snowflake outputs for your repo.*

Dataset: `SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES`

---

## 1) Classify Orders by Sales Value
**SQL file:** `day13_sales_bucket.sql`

**Sample output (top 12 by sales):**
| ORDER_ID | SALES | SALES_BUCKET |
| --- | --- | --- |
| ORD-20150126-2964 | 1,599.28 | High Value |
| ORD-20150704-7860 | 1,450.84 | High Value |
| ORD-20151129-2477 | 1,427.04 | High Value |
| ORD-20150531-8264 | 1,412.77 | High Value |
| ORD-20150206-2014 | 1,375.02 | High Value |
| ORD-20150701-7012 | 1,367.97 | High Value |
| ORD-20150721-6464 | 1,360.97 | High Value |
| ORD-20150123-3662 | 1,333.89 | High Value |
| ORD-20151113-2245 | 1,309.19 | High Value |
| ORD-20150501-8853 | 1,275.24 | High Value |
| ORD-20150309-2286 | 1,247.64 | High Value |
| ORD-20150930-7342 | 1,245.38 | High Value |

**Insights**
- **High Value** orders contribute **1.9%** of total sales in this sample.
- Bucketing helps quickly identify VIP orders for premium handling and post-purchase outreach.

---

## 2) Flag Profitable vs Unprofitable Orders
**SQL file:** `day13_profit_flag.sql`

**Sample output (12 random rows):**
| ORDER_ID | SALES | PROFIT | PROFIT_STATUS |
| --- | --- | --- | --- |
| ORD-20150703-1299 | 482.35 | 147.46 | Profitable |
| ORD-20150413-5010 | 652.99 | 183.43 | Profitable |
| ORD-20150307-5769 | 325.36 | 11.84 | Profitable |
| ORD-20150301-3032 | 75.34 | 21.75 | Profitable |
| ORD-20150801-2987 | 430.59 | 97.75 | Profitable |
| ORD-20150711-8645 | 557.11 | -7.89 | Loss |
| ORD-20150711-8210 | 377.95 | 164.05 | Profitable |
| ORD-20150913-7602 | 623.39 | 69.09 | Profitable |
| ORD-20151002-5006 | 236.09 | 54.39 | Profitable |
| ORD-20151119-7285 | 305.00 | 6.78 | Profitable |

**Insights**
- **Profitable** orders represent **88.3%** of orders in this sample.
- Track **Loss** orders by product/segment to spot pricing or discounting issues.

---

## 3) Segment Customers by Region
**SQL file:** `day13_region_group.sql`

**Sample output (12 random rows):**
| CUSTOMER_ID | REGION | REGION_GROUP |
| --- | --- | --- |
| CUST-0026 | East | Region Group A |
| CUST-0018 | East | Region Group A |
| CUST-0042 | West | Region Group A |
| CUST-0206 | East | Region Group A |
| CUST-0039 | East | Region Group A |
| CUST-0220 | Central | Region Group B |
| CUST-0254 | Central | Region Group B |
| CUST-0121 | Central | Region Group B |
| CUST-0141 | East | Region Group A |
| CUST-0263 | West | Region Group A |

**Insights**
- **Region Group A (West & East)** contributes **56.3%** of total sales in this sample.
- Use region grouping for routing (logistics), promos, and regional performance tracking.

---

## 4) Discount Impact Category
**SQL file:** `day13_discount_level.sql`

**Sample output (12 random rows):**
| ORDER_ID | DISCOUNT | DISCOUNT_LEVEL |
| --- | --- | --- |
| ORD-20150128-2859 | 0.00 | No Discount |
| ORD-20150411-6038 | 0.00 | No Discount |
| ORD-20150819-7538 | 0.07 | Low Discount |
| ORD-20151102-7133 | 0.32 | Medium Discount |
| ORD-20150629-8868 | 0.21 | Medium Discount |
| ORD-20150116-8102 | 0.22 | Medium Discount |
| ORD-20150228-7394 | 0.00 | No Discount |
| ORD-20151015-3437 | 0.42 | High Discount |
| ORD-20150505-3639 | 0.11 | Low Discount |
| ORD-20150222-3196 | 0.08 | Low Discount |

**Insights**
- **No Discount** orders make up **25.4%** of revenue here — healthy pricing power.
- Monitor **High Discount** orders to ensure margins aren’t eroded.

---

## 5) Monthly Sales Performance vs Threshold
**SQL file:** `day13_monthly_performance.sql`

**Monthly performance:**
| ORDER_DATE | TOTAL_SALES | PERFORMANCE |
| --- | --- | --- |
| 2015-01-01 00:00:00 | 340,007.45 | Above Target |
| 2015-02-01 00:00:00 | 326,543.15 | Above Target |
| 2015-03-01 00:00:00 | 340,210.28 | Above Target |
| 2015-04-01 00:00:00 | 348,241.09 | Above Target |
| 2015-05-01 00:00:00 | 371,336.41 | Above Target |
| 2015-06-01 00:00:00 | 350,350.40 | Above Target |
| 2015-07-01 00:00:00 | 379,171.21 | Above Target |
| 2015-08-01 00:00:00 | 386,197.02 | Above Target |
| 2015-09-01 00:00:00 | 351,956.66 | Above Target |
| 2015-10-01 00:00:00 | 338,556.59 | Above Target |
| 2015-11-01 00:00:00 | 338,689.65 | Above Target |
| 2015-12-01 00:00:00 | 365,106.25 | Above Target |

**Insights**
- Months **Above Target**: **12** | **Below Target**: **0**.
- Use a dynamic target (e.g., last 3-month moving average + growth uplift) for more realistic goal-setting.

---

## 📌 Takeaways
- `CASE` builds business-readable KPIs without extra ETL.
- Bucketing, flags, and region-grouping make dashboards more actionable.
- Combine with windows (Days 11–12) to add temporal context (e.g., monthly performance buckets).