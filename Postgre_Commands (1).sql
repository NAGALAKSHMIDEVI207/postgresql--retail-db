CREATE TABLE payment (
payment_id int not null,
cust_id int NOT NULL,
amount int NOT NULL,
payment_date date NOT NULL,
PRIMARY KEY (payment_id),
FOREIGN KEY (cust_id) REFERENCES customer(customer_id)
);

DROP TABLE payment;
INSERT INTO payment VALUES (4321,112,8765,'2023-05-08'),(5678,1,90000,'2023-06-03'),(8765,2,8765,'2023-05-08'),(9807,546,90000,'2023-06-03'),(6578,321,8765,'2023-05-08'),(98,342,90000,'2023-06-03'); 
INSERT INTO payment VALUES (528,1,8765,'2023-05-08'),(5028,2,875,'2021-09-08');

SELECT * FROM payment;

SELECT payment_id,amount,payment_date,name FROM payment 
LEFT JOIN customer ON payment.cust_id = customer.customer_id
 order by name asc;

SELECT amount, customer_id, 
avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
FROM payment
ORDER BY month desc;

create table customer (
customer_id int NOT NULL,
phone_number VARCHAR(12) NOT NULL,
email_id varchar NOT NULL,
name char(20) NOT NULL,
gender char NOT NULL,
age int NOT NULL,
PRIMARY KEY (customer_id)  
);

SELECT * FROM customer;

ALTER TABLE customer ALTER COLUMN phone_number TYPE VARCHAR(12);

ALTER TABLE customer ALTER COLUMN name TYPE char(20);

INSERT INTO customer (customer_id,phone_number,email_id,name,gender,age) VALUES ('001','123456789','don.don@gmail.com','don','m','56'),('002','6472347684','john.john@gmail.com','john','m','47'),('003','2365749865','rani.rani@gmail.com','rani','f','25'),('112','7653459823','pista.pista@gmail.com','pista','m','32'),('321','3428541076','giga.giga@gmail.com','giga','m','23'),('546','6543218790','suji.suji@gmail.com','suji','f','52'),('342','2347651234','wing.wing@gmail.com','wing','m','12');

create table orders (
order_id int NOT NULL,
cust_id int NOT NULL,
order_number int NOT NULL,
order_date DATE NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (cust_id) REFERENCES customer(customer_id)
);

INSERT INTO orders (order_id,cust_id,order_number,order_date) VALUES (961,001,04,'2013-06-08'),(765,002,56,'2023-03-02'),(121,003,876,'2023-09-06'),(210,112,290,'2023-08-05'),(222,321,986,'2023-09-07'),(223,112,85,'2023-03-02'),(224,342,73,'2023-01-04'),(008,002,979,'2023-02-08'),(226,001,321,'2023-12-09');

SELECT order_id, order_number,order_date, name  FROM orders 
  JOIN customer ON orders.cust_id = customer.customer_id
  
Create table product
(
	product_id int NOT NULL,
	category VARCHAR(20),
	product_name VARCHAR(20),
	brand_name VARCHAR(20),
	price float(10),
	product_quantity int,
	primary key(product_id)
);

INSERT INTO product VALUES(8721,'brush','bamboo brush','colgate', 10.99,35),(8621,'brush','wooden brush','closeup', 2.99,46),(524,'comb','plastic comb','hardems', 5.45,5),(802,'fan','table fan','whirlpool', 98.99,86),(752,'spoon','metal spoon','kona', 14.20,6);
INSERT INTO product VALUES(71,'washer','power washer','goma', 143.99,5);

SELECT * FROM product;

CREATE VIEW Products_Above_Average_Price AS
SELECT product_id, product_name, price
FROM product
WHERE price > (SELECT AVG(price) FROM product);

select * from products_above_average_price;
