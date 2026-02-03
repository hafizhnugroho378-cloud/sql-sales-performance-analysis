--- Objective
--- Analyze rolling average (3-month) of sales success rate to smooth short-term fluctuations and identify underlying trends

WITH monthly_rate AS (
    SELECT
        strftime('%m', sales_date) AS month,
        SUM(CASE WHEN status = 'Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS success_rate
    FROM orders
    GROUP BY month
)
SELECT
    month,
    ROUND(success_rate, 2) AS success_rate,
    ROUND(
        AVG(success_rate) OVER (
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg_3_months
FROM monthly_rate
ORDER BY month;
