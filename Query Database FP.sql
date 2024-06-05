-- Create the database
CREATE DATABASE company_db;
GO

USE company_db;
GO

CREATE TABLE tbl_regions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE tbl_countries (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    region INT,
    FOREIGN KEY (region) REFERENCES tbl_regions(id)
);

CREATE TABLE tbl_locations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country CHAR(3),
    FOREIGN KEY (country) REFERENCES tbl_countries(id)
);

CREATE TABLE tbl_departments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    location INT,
    FOREIGN KEY (location) REFERENCES tbl_locations(id)
);

CREATE TABLE tbl_jobs (
    id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    min_salary INT,
    max_salary INT
);

CREATE TABLE tbl_roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_permissions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_accounts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(255) NOT NULL,
    otp INT,
    is_expired BIT,
    is_used DATETIME
);

CREATE TABLE tbl_employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    gender VARCHAR(10),
    email VARCHAR(25),
    phone VARCHAR(20),
    hire_date DATE,
    salary INT,
    manager INT,
    job VARCHAR(10),
    department INT,
    FOREIGN KEY (manager) REFERENCES tbl_employees(id),
    FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    FOREIGN KEY (department) REFERENCES tbl_departments(id)
);

CREATE TABLE tbl_job_histories (
    employee INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(10),
    job VARCHAR(10),
    department INT,
    PRIMARY KEY (employee, start_date),
    FOREIGN KEY (employee) REFERENCES tbl_employees(id),
    FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    FOREIGN KEY (department) REFERENCES tbl_departments(id)
);

CREATE TABLE tbl_payslip (
    employee INT,
    salary_period DATE,
    overtime INT,
    PRIMARY KEY (employee, salary_period),
    FOREIGN KEY (employee) REFERENCES tbl_employees(id)
);

CREATE TABLE tbl_account_roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    account INT,
    role INT,
    FOREIGN KEY (account) REFERENCES tbl_accounts(id),
    FOREIGN KEY (role) REFERENCES tbl_roles(id)
);

CREATE TABLE tbl_role_permissions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    role INT,
    permission INT,
    FOREIGN KEY (role) REFERENCES tbl_roles(id),
    FOREIGN KEY (permission) REFERENCES tbl_permissions(id)
);

CREATE TABLE tbl_salary (
    id INT IDENTITY(1,1) PRIMARY KEY,
    salary_period date
);
