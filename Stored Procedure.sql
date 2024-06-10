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
    UPDATE tbl_jobs
    SET title = @title,
		min_salary = @min_salary,
		max_salary = @max_salary
    WHERE id = @id;
END

-- Delete Jobs
CREATE PROCEDURE usp_delete_jobs
    @id VARCHAR(10)
AS
BEGIN
    DELETE FROM tbl_jobs
    WHERE id = @id;
END

-- Forgot Password
CREATE OR ALTER PROCEDURE usp_forgot_password 
    @Email VARCHAR(25),
    @New_Password VARCHAR(255),
    @Confirm_Password VARCHAR(255),
    @OTP INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EmployeeID INT;
    DECLARE @ValidPassword BIT;
    DECLARE @PasswordsMatch BIT;

	-- Cek employee
    SELECT @EmployeeID = e.id
    FROM tbl_employees e
    JOIN tbl_accounts a ON e.id = a.id
    WHERE e.email = @Email AND a.otp = @OTP;

	-- Cek aturan password
    SELECT @ValidPassword = dbo.func_password_policy(@New_Password);
    
	-- Cek kesamaan password
	SELECT @PasswordsMatch = dbo.func_password_match(@New_Password, @Confirm_Password);

	-- If no matching employee found, return an error
    IF @EmployeeID IS NULL
    BEGIN
        RAISERROR('Invalid email or OTP.', 16, 1);
        RETURN;
    END

	-- If the password policy is not met, return an error
    IF @ValidPassword = 0
    BEGIN
        RAISERROR('Password does not meet the required policy.', 16, 1);
        RETURN;
    END

	-- If the passwords do not match, return an error
    IF @PasswordsMatch = 0
    BEGIN
        RAISERROR('New password and confirm password do not match.', 16, 1);
        RETURN;
    END

	IF @EmployeeID IS NOT NULL AND @ValidPassword = 1 AND @PasswordsMatch = 1
	BEGIN
		UPDATE tbl_accounts
		SET password = @New_Password, is_used = 1, is_expired = 1
		WHERE id = @EmployeeID;

		PRINT 'Password updated successfully.';
	END
END
GO
