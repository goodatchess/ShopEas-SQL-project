-- ================================
-- ShopEasy: Insert Sample Data
-- ================================

INSERT INTO customers VALUES
(1, 'Arjun Kapoor',  'Mumbai',    'Premium', '2022-03-10'),
(2, 'Sneha Reddy',   'Hyderabad', 'Regular', '2022-07-22'),
(3, 'Rahul Verma',   'Delhi',     'Premium', '2021-11-05'),
(4, 'Priya Nair',    'Kochi',     'Regular', '2023-02-18'),
(5, 'Aditya Sharma', 'Pune',      'Premium', '2021-06-30');

INSERT INTO products VALUES
(1, 'Samsung Galaxy S24', 'Mobiles',     79999, 72000),
(2, 'boAt Airdopes 141',  'Audio',       3499,  1299),
(3, 'Levi Jeans 511',     'Clothing',    4999,  2499),
(4, 'LG 43 Smart TV',     'Electronics', 49999, 38000),
(5, 'Prestige Cooker 5L', 'Kitchen',     2299,  1599),
(6, 'Nike Air Max 270',   'Footwear',    12999, 8999);

INSERT INTO orders VALUES
(101, 1, '2024-01-05', 'Delivered', 'UPI'),
(102, 2, '2024-01-18', 'Delivered', 'COD'),
(103, 3, '2024-02-03', 'Delivered', 'Card'),
(104, 1, '2024-02-20', 'Returned',  'UPI'),
(105, 4, '2024-03-08', 'Delivered', 'UPI'),
(106, 5, '2024-03-25', 'Cancelled', 'Card'),
(107, 3, '2024-04-10', 'Delivered', 'UPI');

INSERT INTO order_items VALUES
(1, 101, 1, 1, 0.05),
(2, 101, 2, 2, 0.00),
(3, 102, 3, 1, 0.10),
(4, 103, 4, 1, 0.00),
(5, 104, 1, 1, 0.00),
(6, 105, 5, 3, 0.00),
(7, 107, 6, 1, 0.15);
