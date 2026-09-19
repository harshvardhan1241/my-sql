# 📊 SQL Practice & Analytics Portfolio

Welcome to my SQL practice repository! This project contains a collection of advanced SQL queries and problem-solving exercises designed to extract meaningful insights from data analyst job posting datasets. 

All queries are written and optimized specifically for **PostgreSQL**.

---

## 🛠️ Tech Stack & Environment
* **Database Engine:** PostgreSQL 16+
* **Interface Tool:** pgAdmin 4 / VS Code SQL Tools
* **Dataset Focus:** Technology job postings, company dimensions, and technical skill matrices.

---

## 💡 Key SQL Concepts Applied
* **Subqueries & Common Table Expressions (CTEs):** Used to isolate and stage complex data before processing, optimizing query execution speed.
* **Conditional Logic (`CASE WHEN`):** Utilized to dynamically segment data tiers (e.g., categorizing company sizes based on live job volumes).
* **Aggregate Functions (`COUNT`, `SUM`, `AVG`):** Grouped by entities to identify high-level workforce and hiring trends.
* **Advanced Joins:** Combining relational dimension tables (`skills_dim`, `companies_dim`) with core fact tables (`job_postings_fact`) without data loss.

---

## 🚀 Featured Problems & Solutions

### 1. Top 5 Most In-Demand Skills
* **Objective:** Find the 5 most frequently requested skill IDs and translate them to human-readable names.
* **Logic:** Leverages an inner subquery to aggregate and sort high-volume mapping tables first, performing a highly efficient `JOIN` only on the top 5 filtered results.

### 2. Company Hiring Tier Segmentation
* **Objective:** Categorize companies into 'Small', 'Medium', or 'Large' buckets based on their total open job counts.
* **Logic:** Groups millions of raw job postings by company ID, aggregates total metrics, and applies multi-conditional `CASE` logic to the compressed summary.
