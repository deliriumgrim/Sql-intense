insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH ag1 AS (
    SELECT b.user_id, b.money, b.type, b.currency_id, b.updated AS balance, c.id,
           c.name, c.rate_to_usd, c.updated AS currency
    FROM balance b
             JOIN currency c on c.id = b.currency_id AND b.updated > c.updated),
     ag2 AS (
         SELECT b.user_id, b.money, b.type, b.currency_id, b.updated AS balance,
                c.id, c.name, c.rate_to_usd, c.updated AS currency
         FROM balance b
                  JOIN currency c on c.id = b.currency_id AND b.updated < c.updated),
     connect AS (SELECT p.money AS c_money,
                        p.type AS c_type,
                        p.currency_id AS c_currency_id,
                        min(p.valid_date) AS valid_date
                 FROM (
                          SELECT ag1.money,
                                 ag1.type,
                                 ag1.currency_id,
                                 max(ag1.currency) AS valid_date
                          FROM ag1
                          GROUP BY ag1.money, ag1.type, ag1.currency_id
                          UNION
                          SELECT ag2.money,
                                 ag2.type,
                                 ag2.currency_id,
                                 min(ag2.currency) AS valid_date
                          FROM ag2
                          GROUP BY ag2.money, ag2.type, ag2.currency_id) p
                 GROUP BY p.money, p.type, p.currency_id)
SELECT coalesce(u.name, 'not defined') AS name,
       coalesce(u.lastname, 'not defined') AS lastname,
       c2.name AS currency_name,
       b.money * c2.rate_to_usd AS currency_in_usd
FROM connect c
         JOIN balance b ON b.money = c.c_money AND b.type = c.c_type
         JOIN currency c2 ON c2.updated = c.valid_date AND c2.id = c.c_currency_id
         LEFT JOIN "user" u ON b.user_id = u.id
ORDER BY name DESC , lastname, currency_name;