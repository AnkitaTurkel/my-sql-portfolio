-- Query: Employees Who Earn More Than Their Department Average
-- Purpose: Identifies employees whose salary is above their department's average.
SELECT e.employee_id, e.name, e.salary, e.department_id
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary;
