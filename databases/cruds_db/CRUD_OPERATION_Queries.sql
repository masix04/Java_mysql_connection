
-- Basic Sql Query
SELECT * FROM `employees` AS emp WHERE emp.`first_name` = 'Perry'

-- Basic Update Query
UPDATE employees SET first_name = 'Hideyuki' ,last_name = 'Zallocco' WHERE DATE(employees.birth_date) = 2000

SELECT * FROM employees WHERE YEAR(employees.birth_date) = '2000'

-- INSERT Query
INSERT INTO `employees` (emp_no, emp_title, birth_date, first_name, last_name, gender, hire_date) VALUES(3, 'e0007', '2001-10-30', 'Rica', 'Banance', 'F', '2019-11-30') 

-- DELETE Query
DELETE FROM employees WHERE emp_no = 1