SELECT * FROM Employees
where  salary  < (
    SELECT * from Employees where employee_id = 144 
);

SELECT name,price FROM products
WHERE price = (
    SELECT max(price) FROM products
);
--3. Customers who have placed at least one order
SELECT name FROM customers
where id IN  (
    SELECT DISTINCT customer_id FROM orders
    
);
--6. Products never ordered
SELECT name
FROM products
WHERE id NOT IN (
  SELECT DISTINCT product_id
  FROM order_items
);
--Find customers whose total order value is greater than the average total spending across all customers.
SELECT NAME FROM customers
WHERE id = (
    SELECT customer_id FROM orders
    WHERE
)
SELECT avg(total) FROM orders;
WHERE customer_id = (
     SELECT id FROM customers

);
--8. Employees earning more than their department average
--For each employee, check if they earn more than the average salary in their own department.
SELECT e.name,e.salary,e.dept_id FROM employees as e
WHERE e.salary > (
    SELECT avg(e2.salary) FROM employees as e2
    WHERE e2.dept_id = e.dept_id
);
--List each product with its total revenue, and show whether it is above or below the median product revenue.

SELECT name
FROM employees WHERE dept_id = (
    SELECT id FROM departments
WHERE dept_name = 'Marketing'
);

SELECT sum(salary) FROM employees
WHERE dept_id = (
    SELECT id FROM departments
    WHERE dept_name = 'Engineering'
);


--second highest salary
SELECT * FROM employees
WHERE salary = (
    SELECT DISTINCT salary FROM employees
    ORDER BY salary DESC
    LIMIT 1
    OFFSET 1
);
SELECT * FROM employees where salary = (
    SELECT max(salary) FROM employees
WHERE salary < (
    (
    SELECT max(salary) FROM employees
)
)
); 
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC
limit 1
OFFSET 1;
--2. Find the most expensive product
SELECT name,price FROM products
WHERE price = (
    SELECT max(price) FROM products
);
-- who earns more than manager
SELECT * FROM employees as emp
WHERE salary > (
    SELECT salary FROM employees as mgr 
    WHERE emp.manager_id = mgr.id
)
--Find all products whose price is below the average price of all products.
SELECT * FROM products
WHERE price < (
    SELECT avg(price) FROM products
);
--Find the employee(s) with the minimum salary in the company.
SELECT * FROM employees
WHERE salary = (
    SELECT min(salary) FROM employees
);
--Find all customers who have NO orders at all.
SELECT name,email FROM customers
WHERE id NOT in (
    SELECT DISTINCT customer_id FROM orders
);
--Return all orders whose total is greater than the average order total.
SELECT * FROM orders
WHERE total > (
    SELECT avg(total) from orders
);
--Find products whose price is above the average price of Furniture items specifically.
SELECT * FROM products
WHERE price >(
    SELECT avg(price) FROM products
    WHERE category = 'Furniture'
);