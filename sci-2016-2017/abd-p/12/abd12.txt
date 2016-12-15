1.
SELECT *
FROM employee
WHERE employee.Salary 
IN
(
	SELECT
		MAX(employee.Salary)
	FROM
	 employee
);

2.
SELECT *
FROM employee
WHERE employee.Salary >
	(
		SELECT AVG(employee.Salary)
		FROM employee
	);

3.
SELECT *
FROM employee
WHERE employee.BirthDate =
(
	SELECT employee.BirthDate
	FROM employee
	ORDER BY employee.BirthDate ASC LIMIT 1
);

4.
SELECT *
FROM employee
WHERE employee.Salary + 200 =
(
	SELECT employee.Salary
	FROM employee INNER JOIN department On employee.Id = department.ManagerId
	WHERE department.Name LIKE "IT"
);

5.
SELECT employee.FirstName, employee.LastName, employee.Salary,
(
	SELECT
		AVG(employee.Salary)
	FROM
		employee
) - employee.Salary AS roznica
FROM
	employee
WHERE
	employee.Salary <
	(
		SELECT
			AVG(employee.Salary)
		FROM
			employee
	);

6.
SELECT
	q1.nieaktywni,
	q2.aktywni
FROM
	(
		SELECT
			COUNT(*) As nieaktywni
		FROM
			employee
		WHERE
			employee.Active = 0
	) As q1,
	(
		SELECT
			COUNT(*) AS aktywni
		FROM
			employee
		WHERE
			employee.Active = 1
	) AS q2;

7.
SELECT
	*
FROM
	employee
WHERE
	LENGTH(employee.FirstName) = 
	(
		SELECT
			MAX(LENGTH(employee.FirstName))
		FROM
			employee
	);

8.
SELECT employee.FirstName, employee.LastName,
(
	SELECT
		AvgDepartmentSalaries.AvgSalary
	FROM
		(
			SELECT employee.departmentId AS DepId, AVG(employee.Salary) AS AvgSalary
			FROM employee
			GROUP BY employee.DepartmentId
		) AvgDepartmentSalaries
	WHERE AvgDepartmentSalaries.DepId = employee.DepartmentId
) AS AvgSalary
FROM employee;

9.
SELECT SUM(q1.value) AS Suma
FROM
(
	SELECT 1 AS value FROM Dual UNION ALL
	SELECT 2 FROM Dual UNION ALL
	SELECT 3 FROM Dual
) As q1

10.
SELECT *
FROM employee
WHERE employee.Id 
NOT IN
(
	SELECT employee.Id
	FROM employee 
	INNER JOIN department 
	ON employee.Id = department.ManagerId
);
