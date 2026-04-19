-- ================================
-- ShopEasy: Window Function Queries
-- ================================

-- Q8: RANK() - Top product per category
SELECT
  p.category,
  p.product_name,
  SUM(p.selling_price * oi.quantity)   AS revenue,
  RANK() OVER (
    PARTITION BY p.category
    ORDER BY SUM(p.selling_price * oi.quantity) DESC
  )                                     AS rank_in_category
FROM products p
JOIN order_items oi ON p.product_id  = oi.product_id
JOIN orders o       ON oi.order_id   = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category, p.product_id, p.product_name
ORDER BY p.category, rank_in_category;


-- Q9: SUM OVER() - Running total of revenue by month
WITH monthly AS (
  SELECT
    MONTH(o.order_date)                  AS month_num,
    MONTHNAME(o.order_date)              AS month,
    SUM(p.selling_price * oi.quantity)   AS revenue
  FROM orders o
  JOIN order_items oi ON o.order_id    = oi.order_id
  JOIN products p     ON oi.product_id = p.product_id
  WHERE o.status = 'Delivered'
  GROUP BY MONTH(o.order_date), MONTHNAME(o.order_date)
)
SELECT
  month,
  revenue,
  SUM(revenue) OVER (ORDER BY month_num)  AS running_total
FROM  monthly;
