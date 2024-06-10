USE company_db;
GO

-- Function Email Format
CREATE OR ALTER FUNCTION func_email_format (@email VARCHAR(50))
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT;

    IF RIGHT(@email, 10) = '@gmail.com'
    BEGIN
        IF LEN(@email) - LEN(REPLACE(@email, '@', '')) = 1
        BEGIN
            SET @result = 1;
        END
        ELSE
        BEGIN
            SET @result = 0;
        END
    END
    ELSE
    BEGIN
        SET @result = 0;
    END

    RETURN @result;
END
GO

-- Function Password Policy
CREATE OR ALTER FUNCTION func_password_policy (@password VARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT;

    IF LEN(@password) >= 8
    BEGIN
        IF @password LIKE '%[A-Z]%' AND 
           @password LIKE '%[a-z]%' AND 
           @password LIKE '%[0-9]%' AND 
           @password LIKE '%[!@#$%^&*(),.?":{}|<>]%'
        BEGIN
            SET @result = 1;
        END
    END

    RETURN @result;
END
GO

-- Function Gender
CREATE OR ALTER FUNCTION func_gender (@gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT;

	IF UPPER(@gender) IN ('MALE', 'FEMALE')
		SET @result = 1;
	ELSE
		SET @result = 0;

	RETURN @result;
END;
GO

-- Function Phone Number
CREATE OR ALTER FUNCTION func_phone_number (@phone VARCHAR(20))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT;

	IF @phone NOT LIKE '%[^0-9]%'
		SET @result = 1;
	ELSE
		SET @result = 0;

	RETURN @result;
END;
GO

-- Function Password Match
CREATE OR ALTER FUNCTION func_password_match (@new_password VARCHAR(255), @confirm_password VARCHAR(255))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT;

	IF @confirm_password = @new_password
		SET @result = 1;
	ELSE 
		SET @result = 0;
	
	RETURN @result;
END;
GO

-- Function Salary
CREATE OR ALTER FUNCTION func_salary (@job_id VARCHAR(10), @salary INT)
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT

	SELECT @result = CASE 
		WHEN @salary BETWEEN j.min_salary AND j.max_salary THEN 1
		ELSE 0
	END
	FROM tbl_jobs j
	WHERE j.id = @job_id;

	RETURN @result;
END;
GO

-- Function Max Salary
CREATE OR ALTER FUNCTION func_max_salary (@min_salary int, @max_salary int)
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT;

    IF @max_salary > @min_salary
        SET @result = 1;
    ELSE
        SET @result = 0;

    RETURN @result;
END;
GO

-- Function Change Password
