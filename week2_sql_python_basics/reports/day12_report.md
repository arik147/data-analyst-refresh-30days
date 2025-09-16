# 📅 Day 12 — Advanced Window Frames

Dataset: `SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES`

## 🎯 Goals
- Use **window frame clauses** (`ROWS` vs `RANGE`) correctly.
- Build **rolling sums** and **moving averages**.
- Compute **MTD** metrics within partitions.
- Compare **current vs previous** values using `LAG`.

---

## 1) 7-Day Rolling Sales (Calendar-Based)
**File:** `day12_rolling_7days_range.sql`  
Uses a time-aware frame: `RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW`.

**Expected columns:** `ORDER_DATE`, `DAILY_SALES`, `SALES_LAST_7_DAYS`

> Tip (Snowsight chart): Line chart with X = `ORDER_DATE`, Y = `SALES_LAST_7_DAYS`.

---

## 2) 7-Day Rolling Sales (Row-Based)
**File:** `day12_rolling_7days_rows.sql`  
Uses `ROWS BETWEEN 6 PRECEDING AND CURRENT ROW`. Good if you have 1 row/day without gaps.

**Expected columns:** `ORDER_DATE`, `DAILY_SALES`, `SALES_LAST_7_ROWS`

---

## 3) 30-Day Moving Average
**File:** `day12_moving_avg_30d.sql`  
Smooths daily volatility using a 30-day calendar window.

**Expected columns:** `ORDER_DATE`, `DAILY_SALES`, `AVG_SALES_30D`

---

## 4) Month-to-Date (MTD) Sales
**File:** `day12_mtd_sales.sql`  
Partitions by month start, then accumulates daily sales within each month.

**Expected columns:** `MONTH_START`, `ORDER_DATE`, `DAILY_SALES`, `MTD_SALES`

---

## 5) Previous vs Current Order (per Customer)
**File:** `day12_customer_order_compare.sql`  
Uses `LAG` to reference the previous order's `SALES` within each `CUSTOMER_ID`.

**Expected columns:** `CUSTOMER_ID`, `ORDER_ID`, `ORDER_DATE`, `SALES`, `PREVIOUS_ORDER_SALES`

---

## 🧠 Notes
- If you see `not a valid group by expression`, first **aggregate** to the desired grain (daily, monthly, etc.), then apply the window over that result.
- `RANGE` is **time-aware** (e.g., 30 calendar days), while `ROWS` is **row-count based** (e.g., last 7 rows). Choose based on your data shape and business need.

## ✅ Optional KPIs to add in README
- Last 30-day average vs previous 30-day average
- Highest MTD month and value
- # of customers with increasing order value (current > previous)

---

### 📎 How to use
1. Run the `.sql` files in Snowflake.
2. Save result snippets (or charts) into your Day 12 README as needed.