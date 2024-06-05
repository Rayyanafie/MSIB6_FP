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
