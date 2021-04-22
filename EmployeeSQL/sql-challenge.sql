
drop table if exists departments;
drop table if exists dept_emp;
drop table if exists employees;
drop table if exists titles;
drop table if exists salaries;
drop table if exists dept_manager;


CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    PRIMARY KEY (
        "emp_no"
     ),
	
	FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id")
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
	"dept_no" varchar   NOT NULL,
    
   		PRIMARY KEY (
        "emp_no", "dept_no"
     ),
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES "departments"("dept_no")
  
);


CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    PRIMARY KEY (
        "emp_no"
     ),
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    PRIMARY KEY (
        "dept_no", "emp_no"
     ),
	FOREIGN KEY ("emp_no") REFERENCES "employees"("emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES "departments"("dept_no")
);

---employee number, last name, first name, sex, and salary
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

---List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
  employees.last_name,
  employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department with: department number, department name, the manager's employee number, last name,first name. This doesn't yet work. Need to connect to departments table as well.

SELECT dept_emp.dept_no,
  employees.emp_no,
  employees.first_name,
  employees.last_name
  --departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no;

--department of each employee with: employee number, last name, first name, and department name. Missing dept. Need to figure out (like above) how to join 3 tables.
SELECT dept_emp.dept_no,
  employees.emp_no,
  employees.first_name,
  employees.last_name
  --departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." Source: https://stackoverflow.com/questions/39457789/check-string-starts-with-specific-letter
SELECT employees.first_name,
  employees.last_name,
  employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name = '[B]%'
ORDER BY employees.last_name;
