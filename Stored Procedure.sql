--Add Department--
CREATE PROCEDURE usp_add_department
    @name VARCHAR(30),
    @location INT
AS
BEGIN
    INSERT INTO tbl_departments (name, location)
    VALUES (@name, @location);
END

--Update Department--
CREATE PROCEDURE usp_update_department
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
CREATE PROCEDURE usp_delete_department
    @id INT
AS
BEGIN
    DELETE FROM tbl_departments
    WHERE id = @id;
END

--Create Regions--
CREATE PROCEDURE usp_add_region
	@name VARCHAR(25)
AS 
BEGIN
	INSERT INTO tbl_regions (name)
	VALUES (@name);
END

-- Update Regions--
CREATE PROCEDURE usp_update_region
	@id INT,
	@name VARCHAR(25)
AS
BEGIN
	UPDATE tbl_regions
	SET name = @name
	WHERE id = @id;
END

--Delete Regions--
CREATE PROCEDURE usp_delete_region
	@id INT
AS
BEGIN
	DELETE FROM tbl_regions
	WHERE id = @id;
END

--Add Role--
CREATE PROCEDURE usp_add_roles
	@name VARCHAR(50)
AS 
BEGIN
	INSERT INTO tbl_roles(name)
	VALUES (@name);
END

--Update Role--
CREATE PROCEDURE usp_update_roles
	@id INT,
	@name VARCHAR(50)
AS
BEGIN
	UPDATE tbl_roles
	SET name = @name
	WHERE id = @id;
END

--DELETE Role--
CREATE PROCEDURE usp_delete_roles
	@id INT
AS
BEGIN
	DELETE FROM tbl_roles
	WHERE id = @id;
END

--Add Permission--
CREATE PROCEDURE usp_add_permission
	@name VARCHAR(100)
AS
BEGIN
	INSERT INTO tbl_permissions (name)
	VALUES (@name)
END

--Update Permission--
CREATE PROCEDURE usp_update_permission
	@id INT,
	@name VARCHAR(100)
AS
BEGIN
	UPDATE tbl_permissions
	SET name = @name
	WHERE id = @id
END

--Delete Permission--
CREATE PROCEDURE usp_delete_permission
	@id INT
AS
BEGIN
	DELETE FROM tbl_permissions
	WHERE id = @id
END

--Add Location--
CREATE PROCEDURE usp_add_location
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
CREATE PROCEDURE usp_update_location
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
CREATE PROCEDURE usp_delete_location
    @id INT
AS
BEGIN
    DELETE FROM tbl_locations
    WHERE id = @id;
END

--Add Country--
CREATE PROCEDURE usp_add_country
    @id CHAR(3),
    @name VARCHAR(40),
    @region INT
AS
BEGIN
    INSERT INTO tbl_countries (id, name, region)
    VALUES (@id, @name, @region);
END

--Update Country--
CREATE PROCEDURE usp_UpdateCountry
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
CREATE PROCEDURE usp_delete_country
    @id CHAR(3)
AS
BEGIN
    DELETE FROM tbl_countries
    WHERE id = @id;
END

-- Add Jobs
CREATE OR ALTER PROCEDURE usp_add_jobs
    @id VARCHAR(10),
    @title VARCHAR(35),
    @min_salary int,
    @max_salary int
AS
BEGIN
    DECLARE @result BIT;
   
    SET @result = dbo.func_max_salary(@min_salary, @max_salary);
    
    IF @result = 1
    BEGIN
        INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
        VALUES (@id, @title, @min_salary, @max_salary);
    END
    ELSE
    BEGIN
        RAISERROR('The max salary must be greater than the min salary', 16, 1);
		RETURN;
    END
END;

-- Update Jobs
CREATE PROCEDURE usp_update_jobs
    @id VARCHAR(10),
    @title VARCHAR(35),
	@min_salary int,
	@max_salary int
AS
BEGIN
	DECLARE @result BIT;
   
    SET @result = dbo.func_max_salary(@min_salary, @max_salary);
    
    IF @result = 1
    BEGIN
        UPDATE tbl_jobs
        SET title = @title,
            min_salary = @min_salary,
            max_salary = @max_salary
        WHERE id = @id;
    END
    ELSE
    BEGIN
        RAISERROR('The max salary must be greater than the min salary', 16, 1);
		RETURN;
    END
END

-- Delete Jobs
CREATE PROCEDURE usp_delete_jobs
    @id VARCHAR(10)
AS
BEGIN
    DELETE FROM tbl_jobs
    WHERE id = @id;
END

--Login
CREATE PROCEDURE usp_Login
    @username VARCHAR(25),
    @password VARCHAR(255)
AS
BEGIN
    DECLARE @storedPassword VARCHAR(255)
    
    SELECT @storedPassword = password
    FROM tbl_accounts
    WHERE username = @username;
    
    IF @storedPassword IS NULL
    BEGIN
        -- Username not found
        SELECT 'Login failed: Username not found' AS message;
    END
    ELSE IF @storedPassword = @password
    BEGIN
        -- Successful login
        SELECT 'Login successful' AS message;
    END
    ELSE
    BEGIN
        -- Incorrect password
        SELECT 'Login failed: Incorrect password' AS message;
    END
END;

--Change Password
CREATE or alter PROCEDURE usp_change_password
    @username VARCHAR(25),
    @oldPassword VARCHAR(255),
    @newPassword VARCHAR(255)
AS
BEGIN
    DECLARE @passwordMatch BIT;
    
    -- Check if the old password matches the stored password
    SET @passwordMatch = dbo.fn_CheckPassword(@username, @oldPassword);
    
    IF @passwordMatch = 1
    BEGIN
        -- Correct old password, update to new password
        UPDATE tbl_accounts
        SET password = @newPassword
        WHERE username = @username;
        
        SELECT 'Password change successful' AS message;
    END
    ELSE IF @passwordMatch = 0
    BEGIN
        -- Incorrect old password
        SELECT 'Password change failed: Incorrect old password' AS message;
    END
    ELSE
    BEGIN
        -- Username not found
        SELECT 'Password change failed: Username not found' AS message;
    END
END;

-- Forgot Password
CREATE OR ALTER PROCEDURE usp_forgot_password 
    @email VARCHAR(25),
    @new_password VARCHAR(255),
    @confirm_password VARCHAR(255),
    @otp INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @employee_id INT;
    DECLARE @valid_password BIT;
    DECLARE @password_match BIT;
	DECLARE @is_used BIT;
	DECLARE @is_expired BIT

    SELECT @employee_id = e.id, @is_expired = e.is_expired, @is_used = e.is_used
    FROM tbl_employees e
    JOIN tbl_accounts a ON e.id = a.id
    WHERE e.email = @email AND a.otp = @otp;

    SELECT @valid_password = dbo.func_password_policy(@new_password);
	SELECT @passwords_match = dbo.func_password_match(@new_password, @confirm_password);

    IF @employee_id IS NULL
    BEGIN
        RAISERROR('Invalid email or OTP', 16, 1);
        RETURN;
    END

    IF @valid_password = 0
    BEGIN
        RAISERROR('Password does not meet the required policy', 16, 1);
        RETURN;
    END

    IF @passwords_match = 0
    BEGIN
        RAISERROR('New password and confirm password do not match', 16, 1);
        RETURN;
    END

	IF @is_expired = 1 OR @is_used = 1
	BEGIN
		RAISERROR('Password change is not allowed, Please update the OTP first', 16, 1);
		RETURN;
	END

	IF @employee_id IS NOT NULL AND @valid_password = 1 AND @passwords_match = 1 AND is_expired = 0 AND @is_used = 0
	BEGIN
		UPDATE tbl_accounts
		SET password = @new_Password, is_used = 1, is_expired = 1
		WHERE id = @employee_id;

		PRINT 'Password updated successfully.';
	END
END

-- Generate OTP
CREATE OR ALTER PROCEDURE usp_generate_otp 
	@employee_id int, 
	@employee_email VARCHAR(25)
AS
BEGIN
	DECLARE @new_otp int;
	DECLARE @account_id int;

	IF EXISTS (SELECT 1 FROM tbl_employees WHERE id = @employee_id AND email = @employee_email)
	BEGIN
		SET @new_otp = FLOOR(RAND() * 900000) + 100000;
		SELECT @account_id = id FROM tbl_accounts WHERE id = @employee_id;

		IF @account_id IS NOT NULL
		BEGIN
			UPDATE tbl_accounts
			SET otp = @new_otp, is_expired = 0, is_used = 0
			WHERE id = @employee_id;

			PRINT 'OTP has been updated successfully';
		END
		ELSE
		BEGIN
			RAISERROR('Account for the given employee does not exist', 16, 1);
			RETURN;
		END
	END
	ELSE
	BEGIN
		RAISERROR('Employee with the given ID and email does not exist', 16, 1);
		RETURN;
	END
END;

-- Add Overtime 
CREATE OR ALTER PROCEDURE usp_add_overtime
	@employee_id int,
	@salary_period CHAR(7), -- Format YYYY-MM
	@overtime int
AS
BEGIN
	DECLARE @salary_period_date DATE;
	SET @salary_period_date = CAST(@salary_period + '-01' AS DATE);

	IF NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @employee_id)
	BEGIN 
		RAISERROR('Employee does not exist', 16, 1);
		RETURN;
	END

	INSERT INTO tbl_payslip (employee, salary_period, overtime)
    VALUES (@employee_id, @salary_period_date, @overtime);
END;

-- Add Employee or Register
CREATE OR ALTER PROCEDURE usp_register 
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

	INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
	VALUES (@first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager_id, @job_id, @department_id);

	INSERT INTO tbl_accounts (username, password, otp, is_expired, is_used)
	VALUES (@email, @password, NULL, 0, 0);

	PRINT 'Employee and account have been successfully registered.';
END;
