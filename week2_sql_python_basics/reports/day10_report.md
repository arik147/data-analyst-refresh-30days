# 📊 Day 10 – SQL Aggregations with GROUP BY & HAVING

## ✅ Activities Completed
- Aggregated **sales, profit, and orders** by category.
- Applied **HAVING** to filter regions with high sales.
- Explored **loss-making segments and products** by drilling down to sub-category and product level.
- Measured **profit margin** at category × segment level.

---

## 📊 Key Findings

### 1. Category Totals
- **Technology**: $836K sales, ~$145K profit, 1,544 orders.  
- **Furniture**: $742K sales, ~$18K profit, 1,764 orders.  
- **Office Supplies**: $719K sales, ~$123K profit, 3,742 orders.  

👉 Furniture has the lowest profitability relative to its sales.

---

### 2. Loss-Making Subcategories & Segments
- **Tables (Consumer, Corporate, Home Office)** → consistently negative profit.  
- **Bookcases (Consumer)** → -$4.4K loss.  
- **Supplies (Consumer)** → -$1.6K loss.  

---

### 3. Low-Margin Segments
- **Furniture category margins** are weak across all segments:  
  - Consumer: 1.8%  
  - Home Office: 3.2%  
  - Corporate: 3.3%  
- Indicates pricing or cost issues in Furniture.

---

### 4. Product-Level Losses
- Top negative-profit items include:  
  - **Cubify CubeX 3D Printer** (-$8.9K).  
  - **Lexmark MX611 Printer** (-$4.6K).  
  - **Bush Advantage Racetrack Conference Table** (-$1.9K).  
- Losses concentrated in **Tables and Machines** subcategories.

---

## ✨ Insights
- Furniture, despite high sales, is underperforming in profitability.  
- Tables are consistently loss-making across all customer segments → could be due to high discounts or supply chain costs.  
- Machines also have high negative-profit products, indicating a need for **better pricing or vendor negotiation**.  
- Recommendation: Review discount policies and supplier costs for **Tables and Machines**.

---

## 📌 Deliverables
- SQL Scripts:  
  - `day10_groupby_category.sql`  
  - `day10_having_regions.sql`  
  - `day10_loss_segments.sql`  
  - `day10_loss_products.sql`  
  - `day10_profit_margin.sql`  
- This report (`day10_report.md`)

---