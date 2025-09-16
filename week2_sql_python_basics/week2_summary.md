# 📅 Week 2 Summary — Days 8 to 14

This week focused on strengthening SQL skills for **data analysis, cleaning, and reporting** with the `SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES` dataset.

---

## 🔹 Day 8 – Basic Joins
- Practiced **INNER, LEFT, RIGHT, FULL joins**.  
- Combined multiple tables to enrich analysis.  
- Learned how join types impact row counts and NULL handling.

---

## 🔹 Day 9 – Aggregations & GROUP BY
- Calculated **SUM, AVG, MIN, MAX** by groups.  
- Explored **GROUP BY multiple columns**.  
- Used **HAVING** to filter aggregated results.  
- Insights: Identified top-performing categories and regions.

---

## 🔹 Day 10 – Subqueries
- Wrote **scalar, correlated, and nested subqueries**.  
- Used subqueries in `WHERE`, `FROM`, and `SELECT`.  
- Business case: find customers above average sales.  

---

## 🔹 Day 11 – Window Functions
- Introduced **RANK, ROW_NUMBER, SUM OVER, NTILE**.  
- Key analyses:
  - Top 10 customers by sales.  
  - First order per customer.  
  - Running monthly sales totals.  
  - Customer quartiles by revenue.  
- Insight: Top quartile customers contribute majority of revenue.

---

## 🔹 Day 12 – Advanced Window Frames
- Learned window frame clauses: **ROWS vs RANGE**.  
- Built **7-day rolling sums**, **30-day moving averages**.  
- Created **Month-to-Date (MTD)** metrics.  
- Compared current vs previous order using **LAG**.  
- Insight: Rolling windows help detect trends beyond daily noise.

---

## 🔹 Day 13 – CASE Statements & Conditional Logic
- Used `CASE` for **bucketing, flags, and conditional labels**.  
- Examples:
  - Sales bucket (High/Medium/Low).  
  - Profit status (Profitable/Loss).  
  - Region grouping (A/B).  
  - Discount level classification.  
  - Monthly performance vs thresholds.  
- Insight: CASE adds business context without extra ETL.

---

## 🔹 Day 14 – String Functions
- Practiced **UPPER, LOWER, INITCAP, TRIM, SUBSTRING, REPLACE, CONCAT**.  
- Cleaned and standardized customer names, postal codes.  
- Created compact city-state codes.  
- Searched for products containing specific keywords.  
- Insight: String functions are essential for **data cleaning, enrichment, and presentation**.

---

## 📌 Week 2 Key Takeaways
- SQL is powerful not only for querying but also for **transforming and preparing data** for analysis.  
- Combining **window functions**, **CASE logic**, and **string manipulation** enables advanced analytics directly in SQL.  
- Week 2 set a strong foundation for transitioning into **Week 3: Python & Pandas** for deeper analysis.

---

👉 Next up: **Week 3 (Days 15–21)** — shifting gears to Python & Pandas for exploratory data analysis (EDA), cleaning, and visualization. 🚀
