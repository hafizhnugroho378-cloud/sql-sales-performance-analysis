--- Objective
--- Analyze month-over-month (MoM) change in sales success rate
--- to evaluate performance momentum over time
WITH monthly_rate AS (
    SELECT
        strftime('%m', sales_date) AS month,
        SUM(CASE WHEN status = 'Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS success_rate
    FROM orders
    GROUP BY month
),
growth AS (
    SELECT
        month,
        success_rate,
        LAG(success_rate) OVER (ORDER BY month) AS prev_success_rate
    FROM monthly_rate
)
SELECT
    month,
    ROUND(success_rate, 2) AS success_rate,
    ROUND(success_rate - prev_success_rate, 2) AS mom_change
FROM growth
ORDER BY month;
