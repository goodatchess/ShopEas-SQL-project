-- ================================
-- ShopEasy: Basic Queries
-- ================================

-- Q1: Total revenue from delivered orders
SELECT
  COUNT(DISTINCT o.order_id)          AS total_orders,
  SUM(p.selling_price * oi.quantity)  AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered';


-- Q2: Revenue by product category
SELECT
  p.category,
  COUNT(oi.item_id)                   AS items_sold,
  SUM(p.selling_price * oi.quantity)  AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o   ON oi.order_id   = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;


-- Q3: Top 3 customers by total spending
SELECT
  c.name,
  c.city,
  c.membership,
  COUNT(DISTINCT o.order_id)          AS orders,
  SUM(p.selling_price * oi.quantity)  AS total_spent
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.name, c.city, c.membership
ORDER BY total_spent DESC
LIMIT 3;


-- Q4: Monthly revenue trend
SELECT
  MONTHNAME(o.order_date)              AS month,
  COUNT(DISTINCT o.order_id)           AS orders,
  SUM(p.selling_price * oi.quantity)   AS revenue
FROM orders o
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY MONTH(o.order_date);


-- Q5: Order status breakdown
SELECT
  status,
  COUNT(*)                            AS count,
  ROUND(COUNT(*) * 100.0 / 7, 1)     AS percentage
FROM orders
GROUP BY status
ORDER BY count DESC;


-- Q10: Premium vs Regular members comparison
SELECT
  c.membership,
  COUNT(DISTINCT c.customer_id)       AS customers,
  COUNT(DISTINCT o.order_id)          AS orders,
  SUM(p.selling_price * oi.quantity)  AS total_revenue,
  ROUND(
    SUM(p.selling_price * oi.quantity) /
    COUNT(DISTINCT o.order_id), 0
  )                                    AS avg_order_value
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
JOIN products p     ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.membership;
