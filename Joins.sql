--Show each employee's name, salary, and the name of their department. Only show employees who have a matching department.
SELECT name,salary,dept_name FROM employees
INNER JOIN departments
on employees.dept_id = departments.id;
--Show every customer's name and their order totals. Customers with no orders should still appear, with NULL for order columns.
SELECT c.name,o.total FROM customers as c
LEFT JOIN orders as o
on c.id = o.customer_id;
--Show each order item with its order ID, product name, quantity, and unit price.
SELECT i.order_id,p.name ,i.quantity,i.unit_price FROM order_items as i
INNER JOIN products as p 
on i.product_id = p.id;
--Show all products. For products with no orders, the order columns should be NULL. Then filter to show ONLY unordered products.
SELECT p.name,p.price from products as p
LEFT JOIN order_items as oi 
on p.id = oi.product_id
WHERE oi.order_id IS NULL;
--Show customer name, order date, product name, quantity for every item ever ordered. Chain 4 tables together.
SELECT c.name customer,o.created_at,p.name as product,oi.quantity
FROM customers as c JOIN orders as o
on c.id = o.customer_id
JOIN order_items as oi
on o.id = oi.order_id
JOIN products as p
on oi.product_id = p.id;
--Show each department name and how many employees it has. Departments with zero employees must still appear.
SELECT d.dept_name,count(e) as employeeCount FROM
departments as d
left JOIN employees as e
on d.id = e.dept_id
GROUP BY  d.dept_name;
--Show employee name and their manager's name. Employees with no manager (top-level) should still appear with NULL for manager.
SELECT e1.name as employee,e2.name as Manager
FROM employees as e1
LEFT JOIN employees as e2
on e1.manager_id = e2.id
ORDER BY Manager NULLS LAST;
--Show ALL customers and ALL orders, even if a customer has no orders OR an order somehow has no customer. Use FULL OUTER JOIN.
SELECT c.name,o.total,o.created_at
FROM customers as c
FULL JOIN orders as o
on c.id = o.customer_id;