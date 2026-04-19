-- ================================
-- ShopEasy: CTE Queries
-- ================================

-- Q6: CTE - Calculate each customer's total spend
WITH customer_spend AS (
  SELECT
    c.customer_id,
    c.name,
    c.membership,
    SUM(p.selling_price * oi.quantity)  AS total_spent
  FROM customers c
  JOIN orders o       ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id    = oi.order_id
  JOIN products p     ON oi.product_id = p.product_id
  WHERE o.status = 'Delivered'
  GROUP BY c.customer_id, c.name, c.membership
)
SELECT *
FROM   customer_spend
ORDER BY total_spent DESC;


-- Q7: CTE + CASE - Label customers as Gold, Silver, Bronze
WITH customer_spend AS (
  SELECT
    c.customer_id,
    c.name,
    c.membership,
    SUM(p.selling_price * oi.quantity)  AS total_spent
  FROM customers c
  JOIN orders o       ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id    = oi.order_id
  JOIN products p     ON oi.product_id = p.product_id
  WHERE o.status = 'Delivered'
  GROUP BY c.customer_id, c.name, c.membership
)
SELECT
  name,
  membership,
  total_spent,
  CASE
    WHEN total_spent >= 50000 THEN 'Gold'
    WHEN total_spent >= 10000 THEN 'Silver'
    ELSE                           'Bronze'
  END AS spend_tier
FROM  customer_spend
ORDER BY total_spent DESC;
