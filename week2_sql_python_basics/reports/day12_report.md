# 📅 Day 12 — Advanced Window Frames (Demo Results & Insights)

*Note:* These results are generated on a **synthetic Superstore-like dataset** for demo purposes. Replace with your Snowflake outputs for your repo.  

Dataset reference: `SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES`

---

## 1) 7-Day Rolling Sales — Calendar-Based (RANGE)
**SQL file:** `day12_rolling_7days_range.sql`

**Sample output (first 12 rows):**

| ORDER_DATE | DAILY_SALES | SALES_LAST_7_DAYS |
|------------|-------------|-------------------|
| 2015-01-01 | 477.34      | 477.34            |
| 2015-01-02 | 627.47      | 1,104.81          |
| 2015-01-03 | 889.57      | 1,994.38          |
| 2015-01-04 | 575.86      | 2,570.24          |
| …          | …           | …                 |

📌 **Insight:**  
- Rolling totals smooth daily fluctuations.  
- In this sample, sales grow steadily within each 7-day window, showing consistent weekly demand.

---

## 2) 7-Day Rolling Sales — Row-Based (ROWS)
**SQL file:** `day12_rolling_7days_rows.sql`

**Sample output (first 12 rows):**

| ORDER_DATE | DAILY_SALES | SALES_LAST_7_ROWS |
|------------|-------------|--------------------|
| 2015-01-01 | 477.34      | 477.34             |
| 2015-01-02 | 627.47      | 1,104.81           |
| 2015-01-03 | 889.57      | 1,994.38           |
| 2015-01-04 | 575.86      | 2,570.24           |
| …          | …           | …                  |

📌 **Insight:**  
- Similar to the calendar-based window here, since every date has data.  
- In real Snowflake results, if days are missing, `ROWS` may differ from `RANGE`.

---

## 3) 30-Day Moving Average of Daily Sales
**SQL file:** `day12_moving_avg_30d.sql`

**Sample output (first 12 rows):**

| ORDER_DATE | DAILY_SALES | AVG_SALES_30D |
|------------|-------------|----------------|
| 2015-01-01 | 477.34      | 477.34         |
| 2015-01-02 | 627.47      | 552.41         |
| 2015-01-03 | 889.57      | 664.79         |
| …          | …           | …              |

📌 **Insight:**  
- Moving averages smooth volatility.  
- Trends are easier to see—if the 30-day average rises steadily, long-term sales are healthy.

---

## 4) Month-to-Date (MTD) Sales per Month
**SQL file:** `day12_mtd_sales.sql`

**Sample output (first 12 rows):**

| MONTH_START | ORDER_DATE | DAILY_SALES | MTD_SALES |
|-------------|------------|-------------|-----------|
| 2015-01-01  | 2015-01-01 | 477.34      | 477.34    |
| 2015-01-01  | 2015-01-02 | 627.47      | 1,104.81  |
| 2015-01-01  | 2015-01-03 | 889.57      | 1,994.38  |
| …           | …          | …           | …         |

📌 **Insight:**  
- Shows how sales accumulate during a month.  
- By mid-month, performance can be compared against targets or previous months.

---

## 5) Previous vs Current Order (per Customer) — LAG
**SQL file:** `day12_customer_order_compare.sql`

**Sample output (first 12 rows):**

| CUSTOMER_ID | ORDER_ID       | ORDER_DATE | SALES  | PREVIOUS_ORDER_SALES |
|-------------|----------------|------------|--------|-----------------------|
| CUST-001    | ORD-20150101-1 | 2015-01-01 | 350.00 | NULL                  |
| CUST-001    | ORD-20150107-9 | 2015-01-07 | 420.00 | 350.00                |
| CUST-002    | ORD-20150102-4 | 2015-01-02 | 515.00 | NULL                  |
| …           | …              | …          | …      | …                     |

📌 **Insight:**  
- Lets us analyze order progression.  
- Example: If a customer’s sales rise in later orders, it signals growing engagement; if they shrink, it may indicate churn risk.

---

## 📌 Key Takeaways from Day 12
- **Window Frames** (`ROWS` vs `RANGE`) are powerful for time-series analysis.  
- **Rolling sums & averages** help spot trends beyond daily noise.  
- **MTD metrics** are vital for operational monitoring.  
- **LAG comparisons** highlight customer behavior changes order-over-order.  
