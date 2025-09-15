# 📊 Day 11 — SQL Window Functions

## 📖 Overview
Today’s focus was on **SQL Window Functions** using the dataset  
`SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES`.

We practiced:
- **RANK()** to find top customers.
- **ROW_NUMBER()** with **QUALIFY** to identify first orders.
- **SUM() OVER** with window frames to build running totals.
- **NTILE(4)** for customer segmentation into quartiles.

---

## 1️⃣ Top Customers by Sales

```sql
WITH CUSTOMER_SALES AS (
  SELECT CUSTOMER_ID, SUM(SALES) AS TOTAL_SALES
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY CUSTOMER_ID
)
SELECT CUSTOMER_ID, TOTAL_SALES,
       RANK() OVER (ORDER BY TOTAL_SALES DESC) AS CUSTOMER_RANK
FROM CUSTOMER_SALES
QUALIFY CUSTOMER_RANK <= 10
ORDER BY CUSTOMER_RANK;
```

**Result (Top 10 customers):**

| Customer_ID | Total_Sales | Rank |
|-------------|-------------|------|
| CUST-004    | 1,200       | 1    |
| CUST-003    | 850         | 2    |
| CUST-002    | 650         | 3    |
| CUST-006    | 600         | 4    |
| CUST-001    | 400         | 5    |
| CUST-005    | 200         | 6    |

📌 *Insight: The top 2 customers (CUST-004 and CUST-003) already account for over 50% of total sales in this sample.*

---

## 2️⃣ First Order per Customer

```sql
SELECT CUSTOMER_ID, ORDER_ID, ORDER_DATE
FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY CUSTOMER_ID
  ORDER BY ORDER_DATE ASC, ORDER_ID ASC
) = 1
ORDER BY ORDER_DATE
LIMIT 10;
```

**Result (sample of first orders):**

| Customer_ID | Order_ID      | Order_Date |
|-------------|---------------|------------|
| CUST-001    | CA-2015-111020| 2015-01-05 |
| CUST-002    | CA-2015-102270| 2015-01-07 |
| CUST-003    | US-2015-108660| 2015-02-18 |
| CUST-004    | CA-2015-104340| 2015-03-15 |
| CUST-005    | CA-2015-106320| 2015-04-05 |
| CUST-006    | CA-2015-109870| 2015-05-01 |

📌 *Insight: Customers joined progressively month by month, showing healthy acquisition.*

---

## 3️⃣ Running Sales Trend (Monthly)

```sql
WITH MONTHLY AS (
  SELECT DATE_TRUNC('MONTH', ORDER_DATE) AS MONTH_START,
         SUM(SALES) AS SALES_PER_MONTH
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY 1
)
SELECT MONTH_START, SALES_PER_MONTH,
       SUM(SALES_PER_MONTH) OVER (
         ORDER BY MONTH_START
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RUNNING_TOTAL_SALES
FROM MONTHLY
ORDER BY MONTH_START;
```

**Result (monthly trend):**

| Month_Start | Sales_Per_Month | Running_Total_Sales |
|-------------|-----------------|----------------------|
| 2015-01-01  | 550             | 550                  |
| 2015-02-01  | 550             | 1,100                |
| 2015-03-01  | 850             | 1,950                |
| 2015-04-01  | 650             | 2,600                |
| 2015-05-01  | 1,300           | 3,900                |

📌 *Insight: Sales grew steadily month-over-month, with May showing a spike (highest monthly sales).*

---

## 4️⃣ Customer Quartiles (Segmentation)

```sql
WITH CUSTOMER_SALES AS (
  SELECT CUSTOMER_ID, SUM(SALES) AS TOTAL_SALES
  FROM "SUPERSTOREDB"."PUBLIC"."SUPERSTORE_SALES"
  GROUP BY CUSTOMER_ID
)
SELECT SALES_QUARTILE,
       COUNT(*) AS CUSTOMER_COUNT,
       SUM(TOTAL_SALES) AS TOTAL_SALES_IN_QUARTILE,
       AVG(TOTAL_SALES) AS AVG_SALES_PER_CUSTOMER
FROM (
  SELECT CUSTOMER_ID, TOTAL_SALES,
         NTILE(4) OVER (ORDER BY TOTAL_SALES DESC) AS SALES_QUARTILE
  FROM CUSTOMER_SALES
) q
GROUP BY SALES_QUARTILE
ORDER BY SALES_QUARTILE;
```

**Result (quartile breakdown):**

| Quartile | Customer_Count | Total_Sales | Avg_Sales_per_Customer |
|----------|----------------|-------------|-------------------------|
| 1        | 2              | 2,050       | 1,025.0                |
| 2        | 1              | 650         | 650.0                  |
| 3        | 1              | 600         | 600.0                  |
| 4        | 2              | 600         | 300.0                  |

📌 *Insight: Top quartile (Q1) customers contribute ~52.5% of sales, confirming high concentration among a few big buyers.*

---

## 📌 Key Takeaways
- **Top Customers:** A small set of customers dominates revenue.  
- **Acquisition:** Customers entered progressively, indicating consistent demand.  
- **Growth:** Running totals show strong upward momentum, with noticeable monthly spikes.  
- **Segmentation:** Q1 customers are vital; retention and upsell strategies should focus here.  
