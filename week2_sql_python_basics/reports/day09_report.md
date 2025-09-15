# 📊 Day 9 – SQL Joins (LEFT, RIGHT, FULL OUTER)

## ✅ Activities Completed
- Practiced **LEFT JOIN** to compare monthly sales vs target values and identify missing target definitions.  
- Practiced **RIGHT JOIN** to compare a product catalog against sales data and detect items never sold.  
- Practiced **FULL OUTER JOIN** to compare actuals vs budgets and flag mismatches on both sides.  
- Used `IS NULL` and `COALESCE` to analyze unmatched rows.

---

## 📊 Key Findings
**1. LEFT JOIN (Actuals vs Targets)**  
- All monthly sales retained, some regions/months had `NULL` target values.  
- Exposed missing definitions in the target table.

**2. RIGHT JOIN (Catalog vs Sales)**  
- Some catalog products had no sales history (`sales_sum IS NULL`).  
- Helped identify never-sold products.

**3. FULL OUTER JOIN (Budgets vs Actuals)**  
- Matched regions had variances calculated.  
- Found “North” region budget with no actuals (right-only).  
- Found some actual regions missing in budgets (left-only).

---

## ✨ Insights
1. **LEFT JOIN is best for retaining all operational records** and spotting missing reference data.  
2. **RIGHT JOIN is useful in catalog audits** — ensures coverage of all reference entities (like SKUs).  
3. **FULL OUTER JOIN is a strong data quality tool** — quickly surfaces mismatches between planning (budgets) and reality (actuals).  
4. Real-world usage: these joins are crucial for **data reconciliation, quality checks, and audits**.

---

## 📌 Deliverables
- SQL Scripts:  
  - `day09_left_join_targets.sql`  
  - `day09_right_join_catalog.sql`  
  - `day09_full_outer_data_quality.sql`  
  - `day09_all_joins.sql` (combined)  
- This report (`day09_report.md`)  

---