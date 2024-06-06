-- View Employee Detail
CREATE VIEW vw_employee_details AS
SELECT 
    e.id AS employee_id,
    a.username,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.gender,
    e.email,
    e.hire_date,
    e.salary,
    e.manager AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    j.title AS job,
    d.name AS department,
    (SELECT TOP 1 r.name FROM tbl_account_roles ar
     JOIN tbl_roles r ON ar.role = r.id
     WHERE ar.account = a.id
     ORDER BY r.id DESC) AS role,
    l.city AS location,
    (SELECT TOP 1 jh.status FROM tbl_job_histories jh
     WHERE jh.employee = e.id
     ORDER BY jh.start_date DESC) AS status
FROM tbl_employees e
RIGHT JOIN tbl_accounts a ON e.id = a.id
RIGHT JOIN tbl_employees m ON e.manager = m.id
RIGHT JOIN tbl_jobs j ON e.job = j.id
RIGHT JOIN tbl_departments d ON e.department = d.id
RIGHT JOIN tbl_locations l ON d.location = l.id;
GO

-- View Jobs
CREATE VIEW vw_jobs AS
SELECT 
    j.id AS jobs_id,
	j.title AS name_jobs,
	j.min_salary,
	j.max_salary
FROM tbl_jobs j
GO

-- View Department
CREATE VIEW vw_department AS
SELECT 
    d.id AS department_id,
	d.name AS department_name,
	l.street_address AS department_location
FROM tbl_departments d
RIGHT JOIN tbl_locations l ON d.location = l.id
GO
