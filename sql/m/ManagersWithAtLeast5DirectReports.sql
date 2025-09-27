-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
WITH m_count AS (
    SELECT DISTINCT managerId, COUNT(*) OVER (PARTITION BY managerId) AS ec
    FROM employee
)

SELECT name
FROM employee e INNER JOIN m_count mc ON e.id = mc.managerId
WHERE mc.ec >= 5
