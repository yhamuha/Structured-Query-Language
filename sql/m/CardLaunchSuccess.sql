-- https://datalemur.com/questions/card-launch-success
WITH card_launch AS (
  SELECT
    card_name,
    issued_amount,
    STR_TO_DATE(CONCAT(issue_year, '-', issue_month, '-01'), '%Y-%m-%d') AS issue_date,
    MIN(STR_TO_DATE(CONCAT(issue_year, '-', issue_month, '-01'), '%Y-%m-%d')) OVER (
      PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)

SELECT
  card_name,
  issued_amount
FROM card_launch
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;