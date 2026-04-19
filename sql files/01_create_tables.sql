-- ================================
-- ShopEasy: Create Tables
-- ================================

CREATE TABLE customers (
  customer_id  INT          PRIMARY KEY,
  name         VARCHAR(100),
  city         VARCHAR(50),
  membership   VARCHAR(20),
  signup_date  DATE
);

CREATE TABLE products (
  product_id    INT           PRIMARY KEY,
  product_name  VARCHAR(100),
  category      VARCHAR(50),
  mrp           DECIMAL(10,2),
  selling_price DECIMAL(10,2)
);

CREATE TABLE orders (
  order_id     INT         PRIMARY KEY,
  customer_id  INT,
  order_date   DATE,
  status       VARCHAR(20),
  payment_mode VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  item_id      INT           PRIMARY KEY,
  order_id     INT,
  product_id   INT,
  quantity     INT,
  discount_pct DECIMAL(4,2) DEFAULT 0,
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
