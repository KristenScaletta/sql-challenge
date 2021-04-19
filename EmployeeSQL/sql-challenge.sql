
drop table if exists departments;
drop table if exists dept_emp;
drop table if exists employees;
drop table if exists titles;
drop table if exists salaries;
drop table if exists dept_manager;

CREATE TABLE "departments" (
    "DepartmentID" SERIAL,
    "dept_no" int   NOT NULL,
    "dept_name" varchar   NOT NULL,
   PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "dept_empID" SERIAL,
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (
        "dept_empID"
     ),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "employees" (
    "employeeID" SERIAL,
    "emp_no" int   NOT NULL,
    "emp_title_id" int   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    PRIMARY KEY (
        "employeeID"
     ),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

CREATE TABLE "titles" (
    "titlesID" SERIAL,
    "title_id" int   NOT NULL,
    "title" varchar   NOT NULL,
    PRIMARY KEY (
        "titlesID"
     ),
	FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)
);

CREATE TABLE "salaries" (
    "salariesID" SERIAL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    PRIMARY KEY (
        "salariesID"
     ),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

CREATE TABLE "dept_manager" (
    "managerID" SERIAL,
    "dept_no" int   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (
        "managerID"
     ),
	FOREIGN KEY (dept_no) REFERENCES dept_emp(dept_no)
);
