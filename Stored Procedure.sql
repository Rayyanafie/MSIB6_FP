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
END
