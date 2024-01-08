#Project Title: Online Retail Store

#Project Description : This project is for online retail store management system implemented using PostgreSQL.

Dependencies
PostgreSQL (version 16.1)
pgadmin4 (version 7.8)

#Installation

Clone the repository.
Install the required dependencies.
Set up the database according to the provided schema.

#Entities

Customer_details(customer_id,phone_number,email_id,name,gender,age)
customer_orders

 
create table orders (
order_id int NOT NULL,
cust_id int NOT NULL,
order_number int NOT NULL,
order_date DATE NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (cust_id) REFERENCES customer(customer_id)
);
