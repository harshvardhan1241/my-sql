# 🗄️ SQL Practice Portfolio

Welcome to my SQL practice repository! This project serves as a centralized portfolio for my SQL scripts, query optimizations, and data analysis exercises. 

The primary goal of this repository is to demonstrate data retrieval proficiency, structural optimization, and business logic implementation using relational databases.

---

## 🛠️ Tech Stack
* **Database Engine:** PostgreSQL
* **Tooling:** pgAdmin / VS Code / DBeaver

---

## 🧠 Core SQL Concepts Covered
* **Multi-Table Joins:** Connecting fact and dimension tables via `INNER`, `LEFT`, and `RIGHT JOIN`.
* **Subqueries & CTEs:** Breaking complex requirements into modular, high-performance execution steps.
* **Aggregations & Grouping:** Using `GROUP BY`, `HAVING`, and aggregate functions (`COUNT`, `SUM`, `AVG`).
* **Data Transformation:** Using `CASE WHEN` statements for conditional analysis and data binning.

---

## 📂 Repository Structure
* `/scripts` - Clean, commented `.sql` query files organized by problem type.
* `/data` - Database schemas, data dictionaries, or setup scripts (if applicable).

---

## 🚀 Featured Queries & Logic

### 🔹 Top Skill Demands (Subqueries & Joins)
* **Goal:** Identify the most frequently appearing entities from a high-volume mapping table.
* **Approach:** Aggregates and limits data within an inner subquery first to maximize query performance before joining text dimensions.

### 🔹 Business Tier Classification (Conditional Logic)
* **Goal:** Dynamically segment entities into categorical buckets based on volume thresholds.
* **Approach:** Utilizes `COUNT(*)` windowed logic paired with a `CASE` statement to divide data into 'Small', 'Medium', and 'Large' buckets.
