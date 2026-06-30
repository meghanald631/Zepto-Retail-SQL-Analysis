# 🛒 Zepto Retail Analytics — SQL Project

## 📌 Project Overview
End-to-end retail analytics project on 4,000+ product records from Zepto 
(quick-commerce platform). Performed data cleaning, schema design, and 
business-driven SQL analysis using MySQL.

## 🛠️ Tools & Technologies
- **MySQL** — Schema design, querying, aggregations
- **Python** (Pandas, NumPy) — Data cleaning & preprocessing
- **Excel** — Raw dataset

## 📂 Dataset
- 4,000+ product records
- Columns: Category, Name, MRP, Discount %, Available Quantity, 
  Discounted Selling Price, Weight (gms), Out of Stock status

## 🔍 Key Business Questions Answered
- Which 10 products offer the highest discount percentage?
- What is the potential revenue loss from out-of-stock high-MRP items?
- Which categories have the most out-of-stock products?
- What is the average discounted price per category?
- Which products have the highest price-to-weight value ratio?

## 📊 Key Insights
- 🏆 Identified **Top 10 best-value products** by discount %
- 💸 Quantified **revenue loss from out-of-stock items** to prioritize restocking
- 📦 Flagged high-MRP categories with critical stock gaps
- 🔢 Used **window functions** to rank products within categories

## 💻 SQL Concepts Used
- JOINs, Subqueries, CTEs
- CASE statements
- Window Functions (RANK, ROW_NUMBER, DENSE_RANK)
- Aggregate functions (SUM, AVG, COUNT, MAX, MIN)
- GROUP BY, ORDER BY, HAVING

## 🚀 How to Run
1. Clone this repository
2. Import `zepto_v1.xlsx` into MySQL
3. Run `zeptoSQLproject.sql` in MySQL Workbench

## 👩‍💻 Author
**Meghana L D** — Data Analyst  
[LinkedIn](https://linkedin.com/in/meghana-l-d) | [GitHub](https://github.com/meghanald631)
