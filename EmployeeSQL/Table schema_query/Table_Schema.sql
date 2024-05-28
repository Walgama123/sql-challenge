-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/p7tbv8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS empployee_salary;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;


CREATE TABLE department (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(20)   NOT NULL,
    CONSTRAint pk_department PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE title (
    title_id varchar(5)   NOT NULL,
    title varchar(20)   NOT NULL,
    CONSTRAint pk_title PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employee (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(20)   NOT NULL,
    last_name varchar(20)   NOT NULL,
    sex char(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAint pk_employee PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE empployee_salary (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAint pk_empployee_salary PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE department_employee (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAint pk_department_employee PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE department_manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAint pk_department_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

ALTER TABLE employee ADD CONSTRAint fk_employee_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES title (title_id);

ALTER TABLE empployee_salary ADD CONSTRAint fk_empployee_salary_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

ALTER TABLE department_employee ADD CONSTRAint fk_department_employee_emp_no FOREIGN KEY(emp_no)
REFERENCES employee (emp_no);

ALTER TABLE department_employee ADD CONSTRAint fk_department_employee_dept_no FOREIGN KEY(dept_no)
REFERENCES department (dept_no);

ALTER TABLE department_manager ADD CONSTRAint fk_department_manager_dept_no_emp_no FOREIGN KEY(dept_no,emp_no)
REFERENCES department_employee (dept_no,emp_no);


