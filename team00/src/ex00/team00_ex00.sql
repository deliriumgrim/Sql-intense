CREATE TABLE route_info
(
    point1 varchar NOT NULL,
    point2 varchar NOT NULL,
    cost   bigint  NOT NULL
);

INSERT INTO route_info (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('d', 'b', 25),
       ('b', 'd', 25),
       ('d', 'c', 30),
       ('c', 'd', 30),
       ('b', 'c', 35),
       ('c', 'b', 35);

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
SELECT total_cost,
       tour
FROM (SELECT sum + cost AS total_cost,
             '{' || route || ',a' || '}' AS tour
      FROM cte_recur
      WHERE point2 = 'a' AND length(route) = 7) p
WHERE total_cost = (SELECT min(sum + cost) AS total_cost
                    FROM cte_recur
                    WHERE point2 = 'a' AND length(route) = 7)
ORDER BY total_cost, tour;