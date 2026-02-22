# 🚖 OLA Data Analysis Project: SQL & Business Insights

## 📌 Project Overview
This project focuses on a comprehensive data analysis of a large-scale OLA booking dataset. The primary objective was to transform messy, raw data into a **"Business-Ready"** state and extract actionable insights regarding revenue, customer behavior, and operational efficiency using advanced SQL techniques.

---

## 🛠️ Technical Stack
* **Database:** MySQL
* **Key Skills:** Data Cleaning, Window Functions (CTEs, `ROW_NUMBER()`), Aggregations, Database Views
* **Documentation:** Professional Business Reporting (PDF/MS Word)

---

## 🧹 Data Cleaning & Pre-processing
Before analysis, a rigorous cleaning pipeline was executed to ensure data integrity:
* **Data Ingestion:** Successfully imported the raw dataset into MySQL using the **Table Data Import Wizard**, ensuring schema accuracy.
* **Duplicate Removal:** Leveraged `ROW_NUMBER()` and **CTEs** to identify and eliminate approximately 22,000 duplicate entries.
* **Date Standardization:** Permanently resolved date formatting errors (like `0000-00-00`) to enable accurate time-series analysis.
* **Outcome:** Successfully refined the dataset from 62,485 rows down to a high-quality pool of **40,540 rows**.

---

## 📊 Key Business Insights
Addressing 10 critical business questions provided a 360-degree view of operations:

### 1. Financial Performance
* **Revenue Generation:** Calculated the total successful booking value, amounting to **₹1,37,62,477**.
* **Payment Trends:** Identified high digital adoption with **10,289 UPI transactions**.

### 2. Customer & Driver Analysis
* **Customer Retention:** Found a low repeat-booking rate (max 3 rides/customer), indicating a need for loyalty programs.
* **Service Quality:** Driver ratings for Prime Sedans range from 3 to 5, highlighting a gap in premium service consistency.

### 3. Operational Efficiency
* **Cancellations:** Analyzed **4,079 customer cancellations** and **2,500 driver cancellations** due to personal/vehicle issues.
* **Incomplete Rides:** Investigated **1,542 incomplete trips**, identifying 'Vehicle Breakdown' as a major reliability concern.

---


## 🚀 Conclusion
This project demonstrates end-to-end data proficiency—from raw data wrangling in SQL to delivering strategic business recommendations. It showcases my technical skills in MySQL and a strong focus on driving operational excellence.
