SELECT p.address,
       round(CAST(max(p.age::float) - (min(p.age::float) / max(p.age::float)) AS numeric), 2) AS formula,
       round(avg(p.age), 2)                                                                   AS average,
       round(CAST(max(p.age::float) - (min(p.age::float) / max(p.age::float)) AS numeric), 2) >
       round(avg(p.age), 2)                                                                   AS comparison
FROM person p
GROUP BY p.address
ORDER BY p.address;