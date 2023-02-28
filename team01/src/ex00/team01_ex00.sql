WITH aggregation AS (SELECT b.user_id,
                            b.type                                    AS type,
                            sum(b.money)                              AS volume,
                            coalesce(c.name, 'not defined')           AS currency_name,
                            coalesce(c.rate_to_usd, 1)                AS last_rate_to_usd,
                            sum(b.money * coalesce(c.rate_to_usd, 1)) AS total_volume_in_usd
                     FROM balance b
                              LEFT JOIN currency c on c.id = b.currency_id AND
                                                      c.updated = (SELECT max(updated)
                                                                   FROM currency
                                                                   WHERE b.currency_id = id)
                     GROUP BY b.user_id, b.type, currency_name, last_rate_to_usd)
SELECT coalesce(u.name, 'not defined') AS name,
       coalesce(u.lastname, 'not defined') AS lastname,
       ag.type,
       ag.volume,
       ag.currency_name,
       ag.last_rate_to_usd,
       ag.total_volume_in_usd
FROM "user" AS u
         FULL JOIN aggregation AS ag ON u.id = ag.user_id
ORDER BY name DESC , lastname , type;