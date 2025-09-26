-- https://leetcode.com/problems/group-sold-products-by-the-date/description/
SELECT sell_date,
       count(distinct product) as num_sold,
       STRING_AGG(distinct product, ',' ORDER BY product) as products
FROM Activities
GROUP BY sell_date
ORDER BY 1;