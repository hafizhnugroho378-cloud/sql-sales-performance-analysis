# Sales Performance Analysis using SQL

## Project Overview
This project analyzes monthly sales performance using SQL to generate actionable business insights.  
The focus is on **success rate trends, growth analysis, and performance evaluation against targets**.

This analysis simulates a real-world business scenario where management needs to monitor sales effectiveness over time.

---

## Business Questions
- How does the monthly sales success rate change over time?
- Are we improving or declining month-over-month?
- Are sales results meeting the expected target?
- Are there unusual spikes or drops that require attention?

---

## Dataset
- Source: Simulated sales transaction data
- Table: `orders`
- Key columns:
  - `sales_date`
  - `status` (Success / Failed)
  - `total_sales`

---

## Tools & Skills Used
- SQL (SQLite)
- Common Table Expressions (CTE)
- Window Functions:
  - `LAG ()`
  - `AVG() OVER`
- Business Metrics:
  - Success Rate
  - Month-over-Month Growth
  - Rolling Average (3 months)

---

## Analysis Summary
- Calculated **monthly success rate**
- Analyzed **month-over-month growth**
- Applied **rolling average** to smooth trends
- Classified performance trends:
  - Increase
  - Stable
  - Decrease
- Identified anomalies such as sudden spikes or drops

---

## Key Insights
- Sales performance shows fluctuations across months
- Rolling averages help identify underlying trends
- Month-over-month growth highlights performance momentum
- Certain periods require deeper investigation due to abnormal changes

---

## Business Interpretation
- Fluctuating success rates suggest inconsistency in sales execution.
- Periods of decline may indicate operational or market-related issues.
- Positive momentum in recent months shows improvement after corrective actions.
- Management should focus on stabilizing performance during volatile periods.
## Repository Structure
sql-sales-performance-analysis/
│
├── sql/
│   ├── 01_monthly_success_rate.sql
│   ├── 02_mom_growth_analysis.sql
│   ├── 03_rolling_average_trend.sql
│   └── 04_anomaly_detection.sql
│
└── README.md

---

## Conclusion
This analysis demonstrates how SQL can be used to translate raw transaction data into meaningful business insights.  
The results provide a foundation for performance monitoring, decision-making, and further analytical exploration.
