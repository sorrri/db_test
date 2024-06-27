CREATE TABLE products(
  fruit_code INT PRIMARY KEY,
  fruit_name VARCHAR(100),
  fruit_price DECIMAL(10, 2)
);

INSERT INTO products
  (fruit_code, fruit_name, fruit_price)
VALUES 
  (1, 'Apple', 2000), 
  (2, 'Orange', 2500), 
  (3, 'Banana', 1700);
  
EXPLAIN SELECT * FROM products WHERE fruit_name = 'Orange';

ANALYZE TABLE products;