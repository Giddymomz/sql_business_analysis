-- SQL Business Analysis
-- Gideon Momanyi | ALX Data Analytics Graduate
-- Question: Who are best customers, which products sell most, where is revenue from?

-- 1. Total Revenue
SELECT SUM(amount) AS total_revenue FROM orders;

-- 2. Revenue by Product - Which product sells most?
SELECT product, SUM(amount) AS revenue, COUNT(*) AS num_orders
FROM orders
GROUP BY product
ORDER BY revenue DESC;

-- 3. Top Customers - Who spends most?
SELECT c.name, c.region, SUM(o.amount) AS total_spent, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.region
ORDER BY total_spent DESC
LIMIT 5;

-- 4. Revenue by Region - Where is revenue coming from?
SELECT c.region, SUM(o.amount) AS revenue, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY revenue DESC;

-- 5. Average Order Value
SELECT AVG(amount) AS avg_order_value, COUNT(*) AS total_orders FROM orders;

-- Insight: Jane Wanjiru (Nairobi) is top customer. Electronics is top product.
-- Focus retention on top 5 customers - they drive most revenue.
