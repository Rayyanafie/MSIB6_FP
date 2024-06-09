CREATE TRIGGER tr_insert_employee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT id, hire_date, 'Active', job, department
    FROM inserted;
END;


CREATE TRIGGER tr_update_employee_job
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
END;



CREATE TRIGGER tr_delete_employee
ON tbl_employees
AFTER DELETE
AS
BEGIN
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT id, GETDATE(), 'Resign', job, department
    FROM deleted;
END;
