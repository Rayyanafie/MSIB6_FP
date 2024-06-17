USE company_db;
GO

-- ADD
-- Region
EXEC usp_add_region @name = 'Asia';
EXEC usp_add_region @name = 'Europe';
EXEC usp_add_region @name = 'America';
EXEC usp_add_region @name = 'Africa';
EXEC usp_add_region @name = 'Australia';

-- Country
EXEC usp_add_country 
    @id = 'IDN', 
    @name = 'Indonesia', 
    @region = 1;
EXEC usp_add_country 
    @id = 'USA', 
    @name = 'United States', 
    @region = 3;
EXEC usp_add_country 
    @id = 'GBR', 
    @name = 'United Kingdom', 
    @region = 2;
EXEC usp_add_country 
    @id = 'AUS', 
    @name = 'Australia', 
    @region = 5;
EXEC usp_add_country 
    @id = 'ZAF', 
    @name = 'South Africa', 
    @region = 4;
EXEC usp_add_country 
    @id = 'EGY', 
    @name = 'Egypt', 
    @region = 4;

-- Location
EXEC usp_add_location 
    @street_address = 'Jl. Sudirman No. 1', 
    @postal_code = '10220', 
    @city = 'Jakarta', 
    @state_province = 'DKI Jakarta', 
    @country = 'IDN';
EXEC usp_add_location 
    @street_address = '1600 Amphitheatre Parkway', 
    @postal_code = '94043', 
    @city = 'Mountain View', 
    @state_province = 'California', 
    @country = 'USA';
EXEC usp_add_location 
    @street_address = '221B Baker Street', 
    @postal_code = 'NW1 6XE', 
    @city = 'London', 
    @state_province = 'England', 
    @country = 'GBR';
EXEC usp_add_location 
    @street_address = '1 Martin Place', 
    @postal_code = '2000', 
    @city = 'Sydney', 
    @state_province = 'NSW', 
    @country = 'AUS';
EXEC usp_add_location 
    @street_address = '1 Jan Smuts Ave', 
    @postal_code = '2000', 
    @city = 'Johannesburg', 
    @state_province = 'Gauteng', 
    @country = 'ZAF';
EXEC usp_add_location 
    @street_address = 'Tahrir Square', 
    @postal_code = '11511', 
    @city = 'Cairo', 
    @state_province = 'Cairo', 
    @country = 'EGY';

-- Department
EXEC usp_add_department @name = 'Executive', @location = 1;
EXEC usp_add_department @name = 'Engineering', @location = 2;
EXEC usp_add_department @name = 'Human Resources', @location = 3;
EXEC usp_add_department @name = 'Finance', @location = 4;
EXEC usp_add_department @name = 'Sales', @location = 3;
EXEC usp_add_department @name = 'IT', @location = 1;
EXEC usp_add_department @name = 'Marketing', @location = 4;
EXEC usp_add_department @name = 'Research', @location = 5;
EXEC usp_add_department @name = 'Customer Service', @location = 6;

-- Jobs
EXEC usp_add_jobs
    @id = 'J101', 
    @title = 'Chief Executive Officer', 
    @min_salary = 50000000, 
    @max_salary = 100000000;
EXEC usp_add_jobs
    @id = 'J102', 
    @title = 'Chief Technology Officer', 
    @min_salary = 40000000, 
    @max_salary = 80000000;
EXEC usp_add_jobs
    @id = 'J103', 
    @title = 'Chief Financial Officer', 
    @min_salary = 40000000, 
    @max_salary = 80000000;
EXEC usp_add_jobs
    @id = 'J104', 
    @title = 'Manager', 
    @min_salary = 12000000, 
    @max_salary = 20000000;
EXEC usp_add_jobs
    @id = 'J105', 
    @title = 'Software Engineer', 
    @min_salary = 8000000, 
    @max_salary = 12000000;
EXEC usp_add_jobs
    @id = 'J106', 
    @title = 'Sales Representative', 
    @min_salary = 6000000, 
    @max_salary = 10000000;
EXEC usp_add_jobs
    @id = 'J107', 
    @title = 'HR Specialist', 
    @min_salary = 7000000, 
    @max_salary = 11000000;
EXEC usp_add_jobs
    @id = 'J108', 
    @title = 'Finance Analyst', 
    @min_salary = 9000000, 
    @max_salary = 13000000;
EXEC usp_add_jobs
    @id = 'J109', 
    @title = 'Marketing Specialist', 
    @min_salary = 7000000, 
    @max_salary = 11000000;
EXEC usp_add_jobs
    @id = 'J110', 
    @title = 'Research Scientist', 
    @min_salary = 9000000, 
    @max_salary = 13000000;
EXEC usp_add_jobs
    @id = 'J111', 
    @title = 'Customer Service Representative', 
    @min_salary = 6000000, 
    @max_salary = 9000000;

-- Roles
EXEC usp_add_roles @name = 'Super Admin';
EXEC usp_add_roles @name = 'Admin';
EXEC usp_add_roles @name = 'Manager';
EXEC usp_add_roles @name = 'Employee';

-- Permission
EXEC usp_add_permission @name = 'Add Employee';
EXEC usp_add_permission @name = 'Edit Employee';
EXEC usp_add_permission @name = 'Delete Employee';
EXEC usp_add_permission @name = 'Detail Employee';

EXEC usp_add_permission @name = 'Add Job';
EXEC usp_add_permission @name = 'Edit Job';
EXEC usp_add_permission @name = 'Delete Job';

EXEC usp_add_permission @name = 'Add Department';
EXEC usp_add_permission @name = 'Edit Department';
EXEC usp_add_permission @name = 'Delete Department';

EXEC usp_add_permission @name = 'Add Location';
EXEC usp_add_permission @name = 'Edit Location';
EXEC usp_add_permission @name = 'Delete Location';

EXEC usp_add_permission @name = 'Add Country';
EXEC usp_add_permission @name = 'Edit Country';
EXEC usp_add_permission @name = 'Delete Country';

EXEC usp_add_permission @name = 'Add Region';
EXEC usp_add_permission @name = 'Edit Region';
EXEC usp_add_permission @name = 'Delete Region';

EXEC usp_add_permission @name = 'Add Role';
EXEC usp_add_permission @name = 'Edit Role';
EXEC usp_add_permission @name = 'Delete Role';

EXEC usp_add_permission @name = 'Add Permission';
EXEC usp_add_permission @name = 'Edit Permission';
EXEC usp_add_permission @name = 'Delete Permission';

EXEC usp_add_permission @name = 'Add Payslip';

EXEC usp_add_permission @name = 'Edit Profile';

-- Role Permissions
-- Permission Super Admin
EXEC usp_add_role_permission @role_id = 1, @permission_id = 1;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 2;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 3;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 4;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 5;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 6;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 7;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 8;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 9;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 10;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 11;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 12;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 13;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 14;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 15;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 16;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 17;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 18;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 19;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 20;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 21;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 22;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 23;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 24;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 25;
EXEC usp_add_role_permission @role_id = 1, @permission_id = 26;

-- Permission Admin
EXEC usp_add_role_permission @role_id = 2, @permission_id = 1;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 2;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 3;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 4;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 5;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 6;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 7;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 8;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 9;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 10;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 11;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 12;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 13;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 14;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 15;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 17;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 18;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 20;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 21;
EXEC usp_add_role_permission @role_id = 2, @permission_id = 26;

-- Permission Manager
EXEC usp_add_role_permission @role_id = 3, @permission_id = 2;
EXEC usp_add_role_permission @role_id = 3, @permission_id = 4;
EXEC usp_add_role_permission @role_id = 3, @permission_id = 27;

-- Permission Employee
EXEC usp_add_role_permission @role_id = 4, @permission_id = 27;

-- Employee
EXEC usp_register
    @first_name = 'John', 
    @last_name = 'Doe', 
    @gender = 'Male', 
    @email = 'john.doe@gmail.com', 
    @phone = '082178541290', 
    @hire_date = '2023-01-01', 
    @salary = 80000000, 
    @manager_id = NULL, 
    @job_id = 'J101', 
    @department_id = 1, 
    @password = 'Johndoe123!', 
    @confirm_password = 'Johndoe123!';
EXEC usp_register
    @first_name = 'Jane', 
    @last_name = 'Smith', 
    @gender = 'Female', 
    @email = 'jane.smith@gmail.com', 
    @phone = '085734906512', 
    @hire_date = '2023-02-10', 
    @salary = 60000000, 
    @manager_id = 1, 
    @job_id = 'J103', 
    @department_id = 1, 
    @password = 'Janesmith123!', 
    @confirm_password = 'Janesmith123!';
EXEC usp_register
    @first_name = 'Michael', 
    @last_name = 'Johnson', 
    @gender = 'Male', 
    @email = 'michael.johnson@gmail.com', 
    @phone = '085712903864', 
    @hire_date = '2023-05-28', 
    @salary = 60000000, 
    @manager_id = 1, 
    @job_id = 'J102', 
    @department_id = 1, 
    @password = 'Michaeljohnson123!', 
    @confirm_password = 'Michaeljohnson123!';
EXEC usp_register
    @first_name = 'Emily', 
    @last_name = 'Davis', 
    @gender = 'Female', 
    @email = 'emily.davis@gmail.com', 
    @phone = '088847921042', 
    @hire_date = '2023-03-10', 
    @salary = 14000000, 
    @manager_id = 2,
    @job_id = 'J104', 
    @department_id = 4, 
    @password = 'Emilydavis123!', 
    @confirm_password = 'Emilydavis123!';
EXEC usp_register
    @first_name = 'Robert', 
    @last_name = 'Wilson', 
    @gender = 'Male', 
    @email = 'robert.wilson@gmail.com', 
    @phone = '082199317620', 
    @hire_date = '2023-08-17', 
    @salary = 14000000, 
    @manager_id = 3, 
    @job_id = 'J104', 
    @department_id = 5, 
    @password = 'Robertwilson123!', 
    @confirm_password = 'Robertwilson123!';
EXEC usp_register
    @first_name = 'Sophia', 
    @last_name = 'Taylor', 
    @gender = 'Female', 
    @email = 'sophia.taylor@gmail.com', 
    @phone = '082190236478', 
    @hire_date = '2023-06-15', 
    @salary = 15000000, 
    @manager_id = 2, 
    @job_id = 'J104', 
    @department_id = 6, 
    @password = 'Sophiataylor123!', 
    @confirm_password = 'Sophiataylor123!';
EXEC usp_register
    @first_name = 'Daniel', 
    @last_name = 'Martinez', 
    @gender = 'Male', 
    @email = 'daniel.martinez@gmail.com', 
    @phone = '085798635214', 
    @hire_date = '2023-07-01', 
    @salary = 12500000, 
    @manager_id = 3, 
    @job_id = 'J104', 
    @department_id = 7, 
    @password = 'Danielmartinez123!', 
    @confirm_password = 'Danielmartinez123!';
EXEC usp_register
    @first_name = 'Liam', 
    @last_name = 'Brown', 
    @gender = 'Male', 
    @email = 'liam.brown@gmail.com', 
    @phone = '085712345678', 
    @hire_date = '2023-08-01', 
    @salary = 10000000, 
    @manager_id = 4, 
    @job_id = 'J108', 
    @department_id = 8, 
    @password = 'Liambrown123!', 
    @confirm_password = 'Liambrown123!';
EXEC usp_register
    @first_name = 'Alice', 
    @last_name = 'Green', 
    @gender = 'Female', 
    @email = 'alice.green@gmail.com', 
    @phone = '085712345679', 
    @hire_date = '2023-09-01', 
    @salary = 10500000, 
    @manager_id = 2, 
    @job_id = 'J105', 
    @department_id = 5, 
    @password = 'Alicegreen123!', 
    @confirm_password = 'Alicegreen123!';
EXEC usp_register
    @first_name = 'James', 
    @last_name = 'Clark', 
    @gender = 'Male', 
    @email = 'james.clark@gmail.com', 
    @phone = '082198765432', 
    @hire_date = '2023-10-01', 
    @salary = 9500000, 
    @manager_id = 3, 
    @job_id = 'J110', 
    @department_id = 4, 
    @password = 'Jamesclark123!', 
    @confirm_password = 'Jamesclark123!';
EXEC usp_register
    @first_name = 'Olivia', 
    @last_name = 'Garcia', 
    @gender = 'Female', 
    @email = 'olivia.garcia@gmail.com', 
    @phone = '088847921043', 
    @hire_date = '2023-11-01', 
    @salary = 10000000, 
    @manager_id = 4, 
    @job_id = 'J107', 
    @department_id = 7, 
    @password = 'Oliviagarcia123!', 
    @confirm_password = 'Oliviagarcia123!';
EXEC usp_register
    @first_name = 'Lucas', 
    @last_name = 'Miller', 
    @gender = 'Male', 
    @email = 'lucas.miller@gmail.com', 
    @phone = '082190236479', 
    @hire_date = '2023-12-01', 
    @salary = 9000000, 
    @manager_id = 5, 
    @job_id = 'J106', 
    @department_id = 6, 
    @password = 'Lucasmiller123!', 
    @confirm_password = 'Lucasmiller123!';
EXEC usp_register
    @first_name = 'Ethan', 
    @last_name = 'Moore', 
    @gender = 'Male', 
    @email = 'ethan.moore@gmail.com', 
    @phone = '085798635215', 
    @hire_date = '2024-01-01', 
    @salary = 9000000, 
    @manager_id = 6, 
    @job_id = 'J111', 
    @department_id = 6, 
    @password = 'Ethanmoore123!', 
    @confirm_password = 'Ethanmoore123!';
EXEC usp_register
    @first_name = 'Ava', 
    @last_name = 'Hernandez', 
    @gender = 'Female', 
    @email = 'ava.hernandez@gmail.com', 
    @phone = '085734906513', 
    @hire_date = '2024-02-01', 
    @salary = 10000000, 
    @manager_id = 7, 
    @job_id = 'J108', 
    @department_id = 8, 
    @password = 'Avahernandez123!', 
    @confirm_password = 'Avahernandez123!';
EXEC usp_register
    @first_name = 'Noah', 
    @last_name = 'Scott', 
    @gender = 'Male', 
    @email = 'noah.scott@gmail.com', 
    @phone = '082190236480', 
    @hire_date = '2024-03-01', 
    @salary = 7800000, 
    @manager_id = 4, 
    @job_id = 'J111', 
    @department_id = 5, 
    @password = 'Noahscott123!', 
    @confirm_password = 'Noahscott123!';
EXEC usp_register
    @first_name = 'Mia', 
    @last_name = 'Walker', 
    @gender = 'Female', 
    @email = 'mia.walker@gmail.com', 
    @phone = '085734906514', 
    @hire_date = '2024-04-01', 
    @salary = 12000000, 
    @manager_id = 9, 
    @job_id = 'J105', 
    @department_id = 5, 
    @password = 'Miawalker123!', 
    @confirm_password = 'Miawalker123!';
EXEC usp_register
    @first_name = 'William', 
    @last_name = 'Rodriguez', 
    @gender = 'Male', 
    @email = 'william.rodri@gmail.com', 
    @phone = '085712345680', 
    @hire_date = '2024-05-01', 
    @salary = 11000000, 
    @manager_id = 10, 
    @job_id = 'J107', 
    @department_id = 7, 
    @password = 'Williamrodriguez123!', 
    @confirm_password = 'Williamrodriguez123!';
EXEC usp_register
    @first_name = 'Charlotte', 
    @last_name = 'Harris', 
    @gender = 'Female', 
    @email = 'charlot.harris@gmail.com', 
    @phone = '088847921044', 
    @hire_date = '2024-06-01', 
    @salary = 9000000, 
    @manager_id = 5, 
    @job_id = 'J109', 
    @department_id = 3, 
    @password = 'Charlotteharris123!', 
    @confirm_password = 'Charlotteharris123!';
EXEC usp_register
    @first_name = 'Benjamin', 
    @last_name = 'Lewis', 
    @gender = 'Male', 
    @email = 'benjamin.lewis@gmail.com', 
    @phone = '082198765433', 
    @hire_date = '2024-07-01', 
    @salary = 10000000, 
    @manager_id = 12, 
    @job_id = 'J108', 
    @department_id = 8, 
    @password = 'Benjaminlewis123!', 
    @confirm_password = 'Benjaminlewis123!';
EXEC usp_register
    @first_name = 'Amelia', 
    @last_name = 'Young', 
    @gender = 'Female', 
    @email = 'amelia.young@gmail.com', 
    @phone = '085712345681', 
    @hire_date = '2024-08-01', 
    @salary = 10500000, 
    @manager_id = 9, 
    @job_id = 'J108', 
    @department_id = 4, 
    @password = 'Ameliayoung123!', 
    @confirm_password = 'Ameliayoung123!';
EXEC usp_register
    @first_name = 'Henry', 
    @last_name = 'King', 
    @gender = 'Male', 
    @email = 'henry.king@gmail.com', 
    @phone = '085798635216', 
    @hire_date = '2024-09-01', 
    @salary = 9500000, 
    @manager_id = 10, 
    @job_id = 'J106', 
    @department_id = 5, 
    @password = 'Henryking123!', 
    @confirm_password = 'Henryking123!';
EXEC usp_register
    @first_name = 'Evelyn', 
    @last_name = 'Martinez', 
    @gender = 'Female', 
    @email = 'evelyn.martinez@gmail.com', 
    @phone = '088847921045', 
    @hire_date = '2024-10-01', 
    @salary = 9800000, 
    @manager_id = 8, 
    @job_id = 'J106', 
    @department_id = 6, 
    @password = 'Evelynmartinez123!', 
    @confirm_password = 'Evelynmartinez123!';

-- Payslip/Overtime
EXEC usp_add_overtime
    @employee_id = 1, 
    @salary_period = '2024-06', 
    @overtime = 10;
EXEC usp_add_overtime
    @employee_id = 2, 
    @salary_period = '2024-06', 
    @overtime = 5;
EXEC usp_add_overtime
    @employee_id = 3, 
    @salary_period = '2024-06', 
    @overtime = 8;
EXEC usp_add_overtime
    @employee_id = 4, 
    @salary_period = '2024-06', 
    @overtime = 7;
EXEC usp_add_overtime
    @employee_id = 5, 
    @salary_period = '2024-06', 
    @overtime = 6;
EXEC usp_add_overtime
    @employee_id = 6, 
    @salary_period = '2024-06', 
    @overtime = 4;
EXEC usp_add_overtime
    @employee_id = 7, 
    @salary_period = '2024-06', 
    @overtime = 3;
EXEC usp_add_overtime
    @employee_id = 8, 
    @salary_period = '2024-06', 
    @overtime = 5;
EXEC usp_add_overtime
    @employee_id = 9, 
    @salary_period = '2024-06', 
    @overtime = 9;
EXEC usp_add_overtime
    @employee_id = 10, 
    @salary_period = '2024-06', 
    @overtime = 7;
EXEC usp_add_overtime
    @employee_id = 11, 
    @salary_period = '2024-06', 
    @overtime = 8;
EXEC usp_add_overtime
    @employee_id = 12, 
    @salary_period = '2024-06', 
    @overtime = 6;
EXEC usp_add_overtime
    @employee_id = 13, 
    @salary_period = '2024-06', 
    @overtime = 5;
EXEC usp_add_overtime
    @employee_id = 14, 
    @salary_period = '2024-06', 
    @overtime = 4;
EXEC usp_add_overtime
    @employee_id = 15, 
    @salary_period = '2024-06', 
    @overtime = 6;
EXEC usp_add_overtime
    @employee_id = 16, 
    @salary_period = '2024-06', 
    @overtime = 5;
EXEC usp_add_overtime
    @employee_id = 17, 
    @salary_period = '2024-06', 
    @overtime = 6;
EXEC usp_add_overtime
    @employee_id = 18, 
    @salary_period = '2024-06', 
    @overtime = 7;
EXEC usp_add_overtime
    @employee_id = 19, 
    @salary_period = '2024-06', 
    @overtime = 5;
EXEC usp_add_overtime
    @employee_id = 20, 
    @salary_period = '2024-06', 
    @overtime = 8;
EXEC usp_add_overtime
    @employee_id = 21, 
    @salary_period = '2024-06', 
    @overtime = 4;
EXEC usp_add_overtime
    @employee_id = 22, 
    @salary_period = '2024-06', 
    @overtime = 3;

-- Role Employee
EXEC usp_edit_employee_role
	@employee_id = 1,
	@role_id = 1;
EXEC usp_edit_employee_role
	@employee_id = 2,
	@role_id = 2;
EXEC usp_edit_employee_role
	@employee_id = 3,
	@role_id = 2;
EXEC usp_edit_employee_role
	@employee_id = 4,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 5,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 6,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 7,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 8,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 9,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 10,
	@role_id = 3;
EXEC usp_edit_employee_role
	@employee_id = 11,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 12,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 13,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 14,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 15,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 16,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 17,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 18,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 19,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 20,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 21,
	@role_id = 4;
EXEC usp_edit_employee_role
	@employee_id = 22,
	@role_id = 4;


-- UPDATE
EXEC usp_update_location 
    @id = 1, 
    @street_address = '456 Elm St', 
    @postal_code = '67890', 
    @city = 'San Francisco', 
    @state_province = 'CA', 
    @country = 'USA';

EXEC usp_update_country 
    @id = 'USA', 
    @name = 'United States of America', 
    @region = 2;

EXEC usp_update_department @id = 1, @name = 'HR', @location = 2;

EXEC usp_update_jobs 
    @id = 'J104', 
    @title = 'Mobile Developer', 
    @min_salary = 10000000, 
    @max_salary = 15000000;

EXEC usp_update_region @id = 1, @name = 'Europe';

EXEC usp_update_roles @id = 2, @name = 'Staff Manager';

EXEC usp_update_permission @id = 2, @name = 'View Employee';

EXEC usp_update_employee
	@employee_id = 8,
	@first_name = 'Muhammad',
	@last_name = 'Albert',
	@gender = 'Male', 
	@email = 'Malbert@gmail.com', 
	@phone = '0895366968783', 
	@hire_date = '2023-06-19',
	@salary = 10000000, 
	@manager_id = 10, 
	@job_id = 'J107', 
	@department_id = 5, 
	@password = 'Albert123!', 
	@confirm_password = 'Albert123!';

EXEC usp_edit_profile 
	@employee_id = 15, 
	@first_name = 'Cristiano', 
	@last_name = 'Ronaldo', 
	@email = 'crseven@gmail.com', 
	@phone = '0895317528734';

EXEC usp_forgot_password 
	@Email = 'jane.smith@gmail.com', 
	@New_Password = 'Password12345!',
	@Confirm_Password = 'Password12345!',
	@OTP = 102614;

EXEC usp_generate_otp
	@employee_id = 2,
	@employee_email = 'jane.smith@gmail.com';

EXEC usp_edit_employee_role
	@employee_id = 2,
	@role_id = 4;


-- DELETE
EXEC usp_delete_location @id = 2;

EXEC usp_delete_country @id = 'USA';

EXEC usp_delete_department @id = 9;

EXEC usp_delete_jobs @id = 'J105';

EXEC usp_delete_region @id = 1;

EXEC usp_delete_roles @id = 1;

EXEC usp_delete_permission @id = 5;

EXEC usp_delete_employee @employee_id = 3;

EXEC usp_delete_employee_role @employee_id = 2;
