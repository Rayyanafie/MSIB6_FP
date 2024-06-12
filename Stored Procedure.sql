--Add Department--
CREATE PROCEDURE sp_AddDepartment
    @name VARCHAR(30),
    @location INT
AS
BEGIN
    INSERT INTO tbl_departments (name, location)
    VALUES (@name, @location);
END
    
--Update Department--
CREATE PROCEDURE sp_UpdateDepartment
    @id INT,
    @name VARCHAR(30),
    @location INT
AS
BEGIN
    UPDATE tbl_departments
    SET name = @name,
        location = @location
    WHERE id = @id;
END
    
--Delete Department--
CREATE PROCEDURE sp_DeleteDepartment
    @id INT
AS
BEGIN
    DELETE FROM tbl_departments
    WHERE id = @id;
END

--Create Regions--
CREATE PROCEDURE sp_AddRegion
	@name VARCHAR(25)
AS 
BEGIN
	INSERT INTO tbl_regions (name)
	VALUES (@name);
END
-- Update Regions--
CREATE PROCEDURE sp_UpdateRegion
	@id INT,
	@name VARCHAR(25)
AS
BEGIN
	UPDATE tbl_regions
	SET name = @name
	WHERE id = @id;
END
--Delete Regions--
CREATE PROCEDURE sp_DeleteRegion
	@id INT
AS
BEGIN
	DELETE FROM tbl_regions
	WHERE id = @id;
END

--Add Role--
CREATE PROCEDURE sp_AddRoles
	@name VARCHAR(50)
AS 
BEGIN
	INSERT INTO tbl_roles(name)
	VALUES (@name);
END
--Update Role--
CREATE PROCEDURE sp_UpdateRoles
	@id INT,
	@name VARCHAR(50)
AS
BEGIN
	UPDATE tbl_roles
	SET name = @name
	WHERE id = @id;
END
--DELETE Role--
CREATE PROCEDURE sp_DeleteRoles
	@id INT
AS
BEGIN
	DELETE FROM tbl_roles
	WHERE id = @id;
END

--Add Permission--
CREATE PROCEDURE sp_AddPermission
	@name VARCHAR(100)
AS
BEGIN
	INSERT INTO tbl_permissions (name)
	VALUES (@name)
END
--Update Permission--
CREATE PROCEDURE sp_UpdatePermission
	@id INT,
	@name VARCHAR(100)
AS
BEGIN
	UPDATE tbl_permissions
	SET name = @name
	WHERE id = @id
END
--Delete Permission--
CREATE PROCEDURE sp_DeletePermission
	@id INT
AS
BEGIN
	DELETE FROM tbl_permissions
	WHERE id = @id
    
--Add Location--
CREATE PROCEDURE sp_AddLocation
    @street_address VARCHAR(40),
    @postal_code VARCHAR(12),
    @city VARCHAR(30),
    @state_province VARCHAR(25),
    @country CHAR(3)
AS
BEGIN
    INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
    VALUES (@street_address, @postal_code, @city, @state_province, @country);
END
    
--Update Location--
CREATE PROCEDURE sp_UpdateLocation
    @id INT,
    @street_address VARCHAR(40),
    @postal_code VARCHAR(12),
    @city VARCHAR(30),
    @state_province VARCHAR(25),
    @country CHAR(3)
AS
BEGIN
    UPDATE tbl_locations
    SET street_address = @street_address,
        postal_code = @postal_code,
        city = @city,
        state_province = @state_province,
        country = @country
    WHERE id = @id;
END
    
--Delete Location--
CREATE PROCEDURE sp_DeleteLocation
    @id INT
AS
BEGIN
    DELETE FROM tbl_locations
    WHERE id = @id;
END
    
--Add Country--
CREATE PROCEDURE sp_AddCountry
    @id CHAR(3),
    @name VARCHAR(40),
    @region INT
AS
BEGIN
    INSERT INTO tbl_countries (id, name, region)
    VALUES (@id, @name, @region);
END
    
--Update Country--
CREATE PROCEDURE sp_UpdateCountry
    @id CHAR(3),
    @name VARCHAR(40),
    @region INT
AS
BEGIN
    UPDATE tbl_countries
    SET name = @name,
        region = @region
    WHERE id = @id;
END
    
--Delete Country--
CREATE PROCEDURE sp_DeleteCountry
    @id CHAR(3)
AS
BEGIN
    DELETE FROM tbl_countries
    WHERE id = @id;
END

-- Add Jobs
CREATE PROCEDURE sp_AddJobs
    @id VARCHAR(10),
    @title VARCHAR(35),
	@min_salary int,
	@max_salary int
AS
BEGIN
    INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
    VALUES (@id, @title, @min_salary, @max_salary);
END

-- Update Jobs
CREATE PROCEDURE sp_UpdateJobs
    @id VARCHAR(10),
    @title VARCHAR(35),
	@min_salary int,
	@max_salary int
AS
BEGIN
    UPDATE tbl_jobs
    SET title = @title,
		min_salary = @min_salary,
		max_salary = @max_salary
    WHERE id = @id;
END

-- Delete Jobs
CREATE PROCEDURE sp_DeleteJobs
    @id VARCHAR(10)
AS
BEGIN
    DELETE FROM tbl_jobs
    WHERE id = @id;
END

CREATE OR ALTER PROCEDURE usp_update_employee 
	@employee_id int,
	@first_name VARCHAR(25),
	@last_name VARCHAR(25),
	@gender VARCHAR(10),
	@email VARCHAR(25),
	@phone VARCHAR(20),
	@hire_date DATE,
	@salary int,
	@manager_id int,
	@job_id VARCHAR(10),
	@department_id int,
	@password VARCHAR(255),
	@confirm_password VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @email_format BIT;
	DECLARE @password_policy BIT;
	DECLARE @gender_valid BIT;
	DECLARE @phone_valid BIT;
	DECLARE @password_match BIT;
	DECLARE @salary_valid BIT;
	
	-- Check email format
    SET @email_format = dbo.func_email_format(@email);
    IF @email_format = 0
    BEGIN
		RAISERROR('Email format is invalid', 16, 1);
		RETURN;
    END

    -- Check password policy
    SET @password_policy = dbo.func_password_policy(@password);
    IF @password_policy = 0
    BEGIN
        RAISERROR('Password does not meet the policy requirements', 16, 1);
		RETURN;
    END

    -- Check if passwords match
    SET @password_match = dbo.func_password_match(@password, @confirm_password);
    IF @password_match = 0
    BEGIN
		RAISERROR('Passwords do not match', 16, 1);
		RETURN;
    END

    -- Check gender validity
    SET @gender_valid = dbo.func_gender(@gender);
    IF @gender_valid = 0
    BEGIN
        RAISERROR('Gender is invalid', 16, 1);
		RETURN;
    END

    -- Check phone number validity
    SET @phone_valid = dbo.func_phone_number(@phone);
    IF @phone_valid = 0
    BEGIN
        RAISERROR('Phone number is invalid', 16, 1);
		RETURN;
    END

    -- Check salary range for the job
    SET @salary_valid = dbo.func_salary(@job_id, @salary);
    IF @salary_valid = 0
    BEGIN
        RAISERROR('Salary is out of the valid range for the job', 16, 1);
		RETURN;
    END

	UPDATE tbl_employees 
	SET 
		first_name = @first_name,
		last_name = @last_name,
		gender = @gender,
		email = @email,
		phone = @phone,
		hire_date = @hire_date,
		salary = @salary,
		manager = @manager_id,
		job = @job_id,
		department = @department_id
	WHERE 
		id = @employee_id;

	PRINT 'Employee data has been successfully updated.';
END;
