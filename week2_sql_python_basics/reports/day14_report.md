# 📅 Day 14 — String Functions (Demo Results & Insights)

*Note:* The sample outputs below were generated on a small synthetic dataset that mirrors Superstore fields. Replace with your Snowflake outputs in your repo.*

Dataset: `SUPERSTOREDB.PUBLIC.SUPERSTORE_SALES`

---

## 1) Standardize Customer Names
**SQL:** `day14_standardize_names.sql`

**Sample output:**
| CUSTOMER_ID | CUSTOMER_NAME | NAME_UPPER | NAME_LOWER | NAME_PROPER |
| --- | --- | --- | --- | --- |
| CUST-001 | alice johnson | ALICE JOHNSON | alice johnson | Alice Johnson |
| CUST-002 | BOB SMITH | BOB SMITH | bob smith | Bob Smith |
| CUST-003 | charlie McDonald | CHARLIE MCDONALD | charlie mcdonald | Charlie Mcdonald |
| CUST-004 | dEboRah  lee | DEBORAH  LEE | deborah  lee | Deborah  Lee |
| CUST-005 | Evan Wright | EVAN WRIGHT | evan wright | Evan Wright |

**Insights**
- Normalizing case (UPPER/LOWER/INITCAP) avoids duplicate keys due to inconsistent casing.
- Use `NAME_PROPER` for customer-facing displays; keep raw `CUSTOMER_NAME` for lineage.

---

## 2) Create City–State Codes
**SQL:** `day14_city_state_code.sql`

**Sample output:**
| CITY | STATE | CITY_STATE_CODE |
| --- | --- | --- |
| San Francisco | Oregon | San-Or |
| Los Angeles | Washington | Los-Wa |
| Seattle | California | Sea-Ca |
| Chicago | New York | Chi-Ne |
| Los Angeles | Oregon | Los-Or |
| San Francisco | Illinois | San-Il |
| Miami | California | Mia-Ca |
| Austin | Florida | Aus-Fl |
| New York | Oregon | New-Or |
| Miami | Colorado | Mia-Co |

**Insights**
- Compact codes simplify joins or grouping in dashboards with limited space.
- Consider zero-padding or using ISO codes for consistency when going multi-country.

---

## 3) Find Products Containing 'Table'
**SQL:** `day14_find_table_products.sql`

**Sample output:**
| PRODUCT_NAME |
| --- |
| Conference Table |
| Folding Table |
| Office Table XL |
| Tablet Stand |

**Insights**
- Quick text filters identify target product themes or campaign lists (e.g., all 'Table' items).
- For scale, move to full-text search or regex patterns for plural/stemming.

---

## 4) Rename Category Labels
**SQL:** `day14_replace_category.sql`

**Sample output:**
| CATEGORY | CATEGORY_RENAMED |
| --- | --- |
| Furniture | Furniture |
| Technology | Technology |
| Office Supplies | Office & Supplies |

**Insights**
- Use `REPLACE()` for presentation-only changes; avoid mutating source categories without governance.
- Keep a mapping table for multi-label rewrites to ensure consistency across reports.

---

## 5) Clean Postal Codes (Remove Spaces)
**SQL:** `day14_clean_postal_codes.sql`

**Sample output:**
| POSTAL_CODE | CLEAN_POSTAL_CODE |
| --- | --- |
| 717 28 | 71728 |
| 215 57 | 21557 |
| 62200 | 62200 |
| 577 08 | 57708 |
| 23103 | 23103 |
| 395 61 | 39561 |
| 884 11 | 88411 |
| 04228 | 04228 |
| 644 91 | 64491 |
| 147 35 | 14735 |
| 17485 | 17485 |
| 70105 | 70105 |

**Insights**
- Standardizing postal codes enables accurate geo-joins and deduplication.
- Add checks for non-numeric characters; consider normalizing to a canonical length per country.

---

## 📌 Takeaways
- String functions are essential for **data cleaning, enrichment, and presentation**.
- Consistent text keys reduce join errors and improve dashboard polish.
- For heavy-duty text work (tokenization/stemming), complement SQL with Python (Day 21+).