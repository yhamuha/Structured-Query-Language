-- https://datalemur.com/questions/sql-third-transaction

-- 1. with window function
SELECT
  user_id,
  spend,
  transaction_date
FROM (
  SELECT
  user_id,
  spend,
  transaction_date,
  ROW_NUMBER() OVER (
    PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions
  ) AS trans_num
WHERE row_num = 3;


-- 2. without window function
SELECT t1.user_id, t1.spend, t1.transaction_date
FROM transactions t1
WHERE 3 = (
    SELECT COUNT(*)
    FROM transactions t2
    WHERE t2.user_id = t1.user_id
      AND t2.transaction_date <= t1.transaction_date
);