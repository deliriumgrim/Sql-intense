WITH RECURSIVE cte_recur AS (
    SELECT r1.point1, r1.point2, r1.cost, 0::bigint AS sum, r1.point1 AS route
    FROM route_info r1 WHERE r1.point1 = 'a'
    UNION ALL
    SELECT r2.point1,
           r2.point2,
           r2.cost,
           r3.sum + r3.cost AS sum,
           r3.route || ',' || r3.point2
    FROM route_info r2
             JOIN cte_recur r3 on r3.point2 = r2.point1
    WHERE r3.route NOT LIKE '%'|| r3.point2 ||'%'
)
SELECT cost + sum as total_cost,
       '{' || route || ',a' || '}' AS tour
FROM cte_recur
WHERE length(route) = 7
  AND point2 = 'a'
ORDER BY total_cost, tour;