--- Objective:
--- Calculate monthly sales success rate to evaluate sales performance trends

WITH base AS (
    SELECT
        strftime('%m', sales_date) AS month,
        status
    FROM orders
),
agg AS (
    SELECT
        month,
        COUNT(*) AS total_trx,
        SUM(CASE WHEN status = 'Success' THEN 1 ELSE 0 END) AS success_trx
    FROM base
    GROUP BY month
)
SELECT
    month,
    ROUND(success_trx * 100.0 / total_trx, 2) AS success_rate
FROM agg
ORDER BY month;
