USE company_db;
go

-- Insert Employee
CREATE OR ALTER TRIGGER tr_insert_employee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT id, hire_date, 'Active', job, department
    FROM inserted;

	PRINT 'Employment history has been added to new employees';
END;
GO

-- Update Employee
CREATE OR ALTER TRIGGER tr_update_employee_job
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(job)
    BEGIN
        INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
        SELECT id, GETDATE(), 'Hand Over', job, department
        FROM inserted;
    END;

	PRINT 'Job history has been updated for job changes';
END;
GO

-- Delete Employee
CREATE OR ALTER TRIGGER tr_delete_employee
ON tbl_employees
AFTER DELETE
AS
BEGIN
	DECLARE @start_date DATE;

	SELECT @start_date = jh.start_date
	FROM tbl_job_histories jh
	WHERE jh.employee = employee;

    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT id, @start_date, GETDATE(), 'Resign', job, department
    FROM deleted;
END;
GO
