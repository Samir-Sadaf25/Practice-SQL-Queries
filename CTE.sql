WITH avgIT AS
    (
        SELECT avg(salary) as sal1
        FROM employees
        WHERE dept_id = 1
    ),
  maxMKT AS 
   (
      SELECT max(salary) as sal2
      from employees
      WHERE dept_id = 2

   )    
SELECT * FROM employees 
WHERE salary > (SELECT sal1 FROM "avgIT") and salary < (SELECT sal2 FROM "maxMKT");

--Use a CTE to first calculate average salary per department, then select from it to show dept_name and avg_salary.
WITH dept_avg AS (
  SELECT dept_id, ROUND(AVG(salary), 2) AS avg_salary
  FROM employees
  GROUP BY dept_id
)
SELECT d.dept_name, da.avg_salary
FROM dept_avg da
JOIN departments d ON da.dept_id = d.id;
--Use a CTE to calculate total revenue (quantity × unit_price) per product, then show product name and revenue.
with revenue AS
(
    SELECT product_id,sum(quantity * unit_price) as total_rev from order_items GROUP BY product_id 
)
SELECT p.name,total_rev from revenue
JOIN products as p
on revenue.product_id = p.id
ORDER BY revenue DESC; 

--Use a CTE to calculate total spending per customer, then label each customer as "high spender" (above 500) or "low spender".
WITH spending AS (
  SELECT customer_id, SUM(total) AS total_spent
  FROM orders
  GROUP BY customer_id
)
SELECT c.name,
       COALESCE(s.total_spent, 0) AS total_spent,
       CASE WHEN COALESCE(s.total_spent, 0) > 500
            THEN 'high spender'
            ELSE 'low spender'
       END AS category
FROM customers c
LEFT JOIN spending s ON c.id = s.customer_id
ORDER BY total_spent DESC;

--Use TWO chained CTEs. First CTE: count employees per dept. Second CTE: find the dept with max headcount. Main query: list employees in that dept.
with headCount as
(
    SELECT dept_id,count(*) as cnt 
    FROM employees GROUP BY dept_id
),
top_dept AS
(
    SELECT dept_id FROM headCount
    ORDER BY cnt DESC
    LIMIT 1
)
SELECT e.name,e.salary
FROM employees as e
WHERE e.dept_id  =( SELECT dept_id FROM top_dept);