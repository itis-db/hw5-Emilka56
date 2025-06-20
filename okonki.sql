------1-------
SELECT
    date,
    amount,
    SUM(amount) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM transactions;

------2-------
SELECT
    id,
    category,
    price,
    ROUND(price - AVG(price) OVER (PARTITION BY category), 2) AS deviation_from_avg
FROM products;

------3-------
SELECT
    log_time,
    temperature,
    ROUND(AVG(temperature) OVER (
    ORDER BY log_time
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS moving_avg_3
FROM temperature_logs;

------4-------
SELECT
    task_id,
    project_id,
    start_date,
    FIRST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date) AS first_task_date,
        LAST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_task_date
FROM project_tasks;