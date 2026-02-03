--- Objective:
--- Detect unusual spikes or drops (anomalies) in monthly sales success rate
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
        LAG(success_rate) OVER (ORDER BY month) AS prev_rate
    FROM monthly_rate
)
SELECT
    month,
    ROUND(success_rate, 2) AS success_rate,
    ROUND((success_rate - prev_rate), 2) AS mom_change,
    CASE
        WHEN ABS(success_rate - prev_rate) >= 5 THEN 'Anomaly'
        ELSE 'Normal'
    END AS performance_flag
FROM growth
ORDER BY month;
