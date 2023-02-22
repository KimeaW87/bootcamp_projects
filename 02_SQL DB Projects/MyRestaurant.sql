.header on
.mode column

.print 'Create Tables: employees'
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name TEXT,
  hire_date DATE
);
.print 'Insert data to employees'
INSERT INTO employees VALUES
  (1, 'Kobe', '2021-02-01'),  
  (2, 'Miller', '2022-01-03'),
  (3, 'Curry', '2022-01-03');
.print 'Employee List'
SELECT * FROM employees;

.print 'Create Tables: menu_type'
CREATE TABLE menu_type (
  type_id INT PRIMARY KEY,
  type TEXT
);
.print 'Insert data to menu_type'
INSERT INTO menu_type VALUES
  (1, 'food'),  
  (2, 'beverage');
.print 'menu_type'
SELECT * FROM menu_type;

.print 'Create Tables: menus'
CREATE TABLE menus (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  price REAL,
  type_id INT,
  FOREIGN KEY(type_id) REFERENCES menu_type(type_id)
);
.print 'Insert data to menus'
INSERT INTO menus VALUES
  (1, 'pizza', 130,1),  
  (2, 'hotdog', 90,1),
  (3, 'hamberger', 180,1),
  (4, 'water', 20,2),
  (5, 'soft drink', 35,2);
.print 'menu'
SELECT * FROM menus;
  
.print 'Create Tables: customers'
CREATE TABLE customers (
  customer_id TEXT PRIMARY KEY,
  service_date DATE,
  amount REAL
);
.print 'Insert data to customers'
INSERT INTO customers VALUES
  ('C1', '2022-08-01', 150),
  ('C2', '2022-08-01', 250),
  ('C3', '2022-08-01', 180),
  ('C4', '2022-08-02', 230),
  ('C5', '2022-08-02', 355),
  ('C6', '2022-08-03', 199),  
  ('C7', '2022-08-03', 149);
.print 'customers'
SELECT * FROM customers;

.print 'Create Tables: orders'
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  menu_id INT,
  amount INT,
  customer_id TEXT,
  emp_id INT,
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
  FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);
.print 'Insert data to orders'
INSERT INTO orders VALUES
  (1, 1, 2,'C1',1),
  (2, 2, 3,'C2',2),
  (3, 4, 2,'C2',2),
  (4, 3, 2,'C3',3),
  (5, 1, 1,'C4',1),
  (6, 5, 1,'C5',3),
  (7, 2, 2,'C6',1),
  (8, 4, 1,'C7',3);
.print 'orders'
SELECT * FROM orders;

.print 'average amount'
SELECT count(*) as n_all_order, round(avg(amount),2) AS avg_amount
FROM customers;

.print 'CREATE VIEW'
.print 'Menu Type With Order Amount'
CREATE VIEW MenuTypeOrderAmount AS
Select mt.type, m.menu_name, o.amount
  from orders as o join menus as m on o.menu_id = m.menu_id
  join menu_type as mt on mt.type_id = m.type_id;

select type, count(*) as n_all_order,count(type) as n_type, sum(amount) as tot_amt
  from MenuTypeOrderAmount
  group by type;

with cust_orders as (
  select o.customer_id, m.menu_name, m.price, o.amount, e.emp_name  
  From orders as o
  Join menus as m On o.menu_id = m.menu_id
  join employees as e On o.emp_id = e.emp_id
)

/*Select c.customer_id, c.service_date, sum(co.amount*co.price) as tot_amt 
from cust_orders as co Join customers as c On co.customer_id = c.customer_id
group by c.customer_id, c.service_date
order by tot_amt desc*/

Select 
  c.service_date, count(service_date) as n_date,
  avg(co.amount*co.price) as avg_amt, sum(co.amount*co.price) as tot_amt
from cust_orders as co Join customers as c On co.customer_id = c.customer_id
group by c.service_date
order by avg_amt desc, tot_amt
