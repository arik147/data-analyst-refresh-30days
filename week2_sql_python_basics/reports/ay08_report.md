# 📊 Day 8 – SQL Joins (INNER JOIN with Customer Info)

## ✅ Activities Completed
- Built a **CUSTOMER_INFO** table using aggregated sales data.  
- Classified customers into **loyalty tiers** (Gold ≥ 10k, Silver ≥ 5k, Bronze < 5k).  
- Practiced INNER JOIN by linking `SUPERSTORE_SALES` with `CUSTOMER_INFO`.  
- Performed revenue, profitability, product preference, and loss rate analysis by tier.

---

## 📊 Key Findings

**1. Revenue by Loyalty Tier**
- Gold customers generate the majority of revenue.  
- Silver customers form a mid-tier contribution.  
- Bronze customers have the lowest sales but make up the largest number of customers.  

**2. Profitability by Tier & Region**
- West region + Gold tier contributed the highest profit.  
- Some Bronze customers in South region showed negative profit (loss-heavy).  

**3. Gold Customers’ Preferences**
- Top sub-categories for Gold = Technology products and Office Supplies.  
- These customers show strong spending on high-value categories.  

**4. Loss Rate by Tier**
- Bronze customers showed the highest % of loss-making orders.  
- Gold customers, despite high sales, also had some loss-making orders due to discounts.  

---

## ✨ Insights
1. **Gold customers drive the most value** and should be targeted for loyalty/retention programs.  
2. **Bronze customers are riskier** due to higher loss rates — discount and pricing strategies need review.  
3. **Regional strategies** should focus on strengthening Gold segments in West and East while reducing losses in South.  

---

## 📌 Deliverables
- SQL Scripts:  
  - `day08_customer_info.sql`  
  - `day08_join_orders_with_customers.sql`  
  - `day08_revenue_by_tier.sql`  
  - `day08_profitability_by_tier_region.sql`  
  - `day08_gold_top_subcategories.sql`  
  - `day08_loss_rate_by_tier.sql`  
- This report (`day08_report.md`).  

---
