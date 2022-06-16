SELECT
    c.id AS customer_id
  , c.name
  , c.email
  , MIN(o.created_at) AS first_order_at
  , COALESCE(COUNT(o.id), 0) AS number_of_orders

FROM `analytics-engineers-club.coffee_shop.customers` c
LEFT JOIN `analytics-engineers-club.coffee_shop.orders` o
  ON c.id = o.customer_id

GROUP BY customer_id, name, email
ORDER BY first_order_at
--LIMIT 5
