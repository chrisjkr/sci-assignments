-- 1.
SELECT
	employee.FirstName,
	employee.LastName,
	employee.Salary
FROM
	employee
WHERE
	employee.Salary < 1000
	OR
	employee.Salary > 2000;

-- 2.
SELECT
	q1.FirstName,
	q1.LastName
FROM
	(
		(
			SELECT
				employee.FirstName,
				employee.LastName
			FROM
				employee
		)
		UNION
		(
			SELECT
				formeremployee.FirstName,
				formeremployee.LastName
			FROM
				formeremployee
		)
	) AS q1
ORDER BY
	q1.LastName ASC;

-- 3.
(
	SELECT
		employee.FirstName,
		employee.LastName
	FROM
		employee
	WHERE
		employee.Active = 0
)
UNION
(
	SELECT
		formeremployee.FirstName,
		formeremployee.LastName
	FROM
		formeremployee
);

-- 4.
(
	SELECT
		'Kobiety' AS opis,
		Count(employee.Gender) AS wartosc
	FROM
		employee
	WHERE
		employee.Gender Like 'W'
)
UNION
(
	SELECT
		'Mezczyzni' AS opis,
		Count(employee.Gender) AS wartosc
	FROM
		employee
	WHERE
		employee.Gender Like 'M'
);

-- 5.
(
	SELECT
		employee.FirstName,
		employee.LastName,
		'Kierownik' AS Stanowisko
	FROM
		employee,
		department
	WHERE
		department.ManagerId = employee.Id
		AND
		department.Name Like 'IT'
)
UNION
(
	SELECT
		employee.FirstName,
		employee.LastName,
		'Pracownik' AS Stanowisko
	FROM
		employee,
		department
	WHERE
		employee.Id NOT IN
		(
			SELECT
				employee.Id
			FROM
				employee,
				department
			WHERE
				department.ManagerId = employee.Id
		)
		AND
		employee.DepartmentId = department.Id
		AND
		department.Name Like 'IT'
);

-- 6.
SELECT
	employee.FirstName,
	employee.LastName
FROM
	employee,
	formeremployee
WHERE
	employee.Id = formeremployee.Id;

-- 7.
SELECT
	department.Name
FROM
	employee,
	formeremployee,
	department
WHERE
	employee.Id = formeremployee.Id
	AND
	employee.DepartmentId = department.Id;

-- 8 (To samo co 7.)

-- 9
SELECT
	formeremployee.FirstName,
	formeremployee.LastName
FROM
	formeremployee
WHERE
	formeremployee.Id NOT IN
	(
		SELECT
			employee.Id
		FROM
			employee
	);

-- 10
SELECT
	department.Name
FROM
	department
WHERE
	department.Id NOT IN
	(
		SELECT
			department.Id
		FROM
			formeremployee,
			department
		WHERE
			formeremployee.departmentId = department.Id
	);
