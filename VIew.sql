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
JOIN tbl_accounts a ON e.id = a.id
LEFT JOIN tbl_employees m ON e.manager = m.id
LEFT JOIN tbl_jobs j ON e.job = j.id
LEFT JOIN tbl_departments d ON e.department = d.id
LEFT JOIN tbl_locations l ON d.location = l.id;
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
JOIN tbl_locations l ON d.location = l.id
GO

-- View Location
CREATE VIEW vw_location AS
SELECT 
    l.id AS location_id,
	l.street_address,
	l.postal_code,
	l.city,
	l.state_province,
	c.name AS location_country
FROM tbl_locations l
JOIN tbl_countries c ON l.country = c.id
GO

-- View Country
CREATE VIEW vw_country AS
SELECT 
    c.id AS country_id,
	c.name AS country_name,
	r.name AS country_region
FROM tbl_countries c
JOIN tbl_regions r ON c.region = r.id
GO

-- View Region
CREATE VIEW vw_region AS
SELECT 
    r.id AS region_id,
	r.name AS region_name
FROM tbl_regions r
GO

-- View Role
CREATE VIEW vw_role AS
SELECT 
    r.id AS role_id,
	r.name AS role_name
FROM tbl_roles r
GO

-- View Role Permission
CREATE VIEW vw_role_permission AS
SELECT 
    rp.id AS role_permission_id,
	rp.role,
	p.name
FROM tbl_role_permissions rp
JOIN tbl_permissions p ON rp.permission = p.id
GO

-- View Employee Salary
CREATE VIEW vw_employee_salary AS
SELECT
    e.id AS id,
    p.salary_period AS salary_period,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    p.overtime AS total_overtime,
    e.salary AS base_salary,
    (0.05 * e.salary * p.overtime) AS overtime_salary,
    (e.salary * 0.05) AS pph,
    e.salary + (0.05 * e.salary * p.overtime) - (e.salary * 0.05) AS total_salary
FROM tbl_employees e
JOIN tbl_payslip p ON e.id = p.employee;
