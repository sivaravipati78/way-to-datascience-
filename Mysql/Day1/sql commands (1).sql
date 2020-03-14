
CREATE TABLE customers (
  customer_id INTEGER,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  dob DATE,
  phone VARCHAR(12)
);


select * from customers;
INSERT INTO customers (customer_id, first_name, last_name, dob, phone) VALUES (
  1, 'John', 'Brown', '1965-01-01', '800-555-1211');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone) VALUES (
  2, 'Cynthia', 'Green', '1968-02-05', '800-555-1212');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone) VALUES (
  3, 'Steve', 'White', '1971-03-16', '800-555-1213');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone) VALUES (
  4, 'Gail', 'Black', NULL, '800-555-1214');

INSERT INTO customers (customer_id, first_name, last_name, dob, phone) VALUES (
  5, 'Doreen', 'Blue', '1970-05-20', NULL);

-- commit the transaction
COMMIT;


select * from customers;


CREATE TABLE product_types (
  product_type_id INTEGER  PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE products (
  product_id INTEGER    PRIMARY KEY,
  product_type_id INTEGER
        REFERENCES product_types(product_type_id),
  name VARCHAR(30) NOT NULL,
  description VARCHAR(50),
  price decimal(5, 2)
);

INSERT INTO product_types (product_type_id, name) VALUES ( 1, 'Book');
INSERT INTO product_types (product_type_id, name) VALUES (  2, 'Video');
INSERT INTO product_types (product_type_id, name) VALUES ( 3, 'DVD');
INSERT INTO product_types (product_type_id, name) VALUES ( 4, 'CD');
INSERT INTO product_types (product_type_id, name) VALUES ( 5, 'Magazine');
-- commit the transaction
COMMIT;

-- insert sample data into products table

INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (3, 2, 'Supernova', 'A star explodes', 25.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (5, 2, 'Z Files', 'Series on mysterious activities', 49.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (6, 2, '2412: The Return', 'Aliens return', 14.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (7, 3, 'Space Force 9', 'Adventures of heroes', 13.49);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (9, 4, 'Classical Music', 'The best classical music', 10.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (10, 4, 'Pop 3', 'The best popular music', 15.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (11, 4, 'Creative Yell', 'Debut album', 14.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (12, NULL, 'My Front Line', 'Their greatest hits', 13.49);

-- commit the transaction
COMMIT;


CREATE TABLE purchases (
  product_id INTEGER
    REFERENCES products(product_id),
  customer_id INTEGER
    REFERENCES customers(customer_id),
  quantity INTEGER NOT NULL,
  CONSTRAINT purchases_pk PRIMARY KEY (product_id, customer_id)
);


-- insert sample data into purchases table
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 1, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 1, 3);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 2, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 2, 2);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 3, 3, 1);

-- commit the transaction
COMMIT;


CREATE TABLE employees (
  employee_id INTEGER
    PRIMARY KEY,
  manager_id INTEGER,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);

-- insert sample data into employees table

INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 1, NULL, 'James', 'Smith', 'CEO', 800000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 3, 2, 'Fred', 'Hobbs', 'Salesperson', 150000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 4, 2, 'Susan', 'Jones', 'Salesperson', 500000);

-- commit the transaction
COMMIT;



CREATE TABLE more_products (
  prd_id INTEGER PRIMARY KEY,
  prd_type_id INTEGER
    REFERENCES product_types(product_type_id),
  name VARCHAR(30) NOT NULL,
  available CHAR(1)
);

-- insert sample data into more_products table

INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  1, 1, 'Modern Science', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  2, 1, 'Chemistry', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  3, NULL, 'Supernova', 'N');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  4, 2, 'Lunar Landing', 'N');
INSERT INTO more_products ( prd_id, prd_type_id, name, available) VALUES ( 5, 2, 'Submarine', 'Y');

-- commit the transaction
COMMIT;

use dsedec;

CREATE TABLE more_employees (
  employee_id INTEGER PRIMARY KEY,
  manager_id INTEGER
    REFERENCES more_employees(employee_id),
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);


-- insert sample data into more_employees table

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  1, NULL, 'James', 'Smith', 'CEO', 800000);
     
INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  3, 2, 'Fred', 'Hobbs', 'Sales Person', 200000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  4, 1, 'Susan', 'Jones', 'Support Manager', 500000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  5, 2, 'Rob', 'Green', 'Sales Person', 40000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  6, 4, 'Jane', 'Brown', 'Support Person', 45000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 (  7, 4, 'John', 'Grey', 'Support Manager', 30000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  8, 7, 'Jean', 'Blue', 'Support Person', 29000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 (  9, 6, 'Henry', 'Heyson', 'Support Person', 30000);

INSERT INTO more_employees (  employee_id, manager_id, first_name, last_name, title, salary) VALUES 
  (  10, 1, 'Kevin', 'Black', 'Ops Manager', 100000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 ( 11, 10, 'Keith', 'Long', 'Ops Person', 50000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES 
(  12, 10, 'Frank', 'Howard', 'Ops Person', 45000);

INSERT INTO more_employees (  employee_id, manager_id, first_name, last_name, title, salary) VALUES 
(  13, 10, 'Doreen', 'Penn', 'Ops Person', 47000);

-- commit the transaction
COMMIT;

