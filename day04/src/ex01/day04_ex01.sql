SELECT m.name AS name
FROM v_persons_male m
UNION
SELECT f.name AS name
FROM v_persons_female f
ORDER BY name;