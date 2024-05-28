# HR Analysis
Goal of this project is analysis about employee of Pewlett Hackard (a fictional company) employed during the 1980s and 1990s.
## Background
Pewlett Hackard company wants to do an analysis of their employees worked during the 1980s and 1990s 
in order to make some future enhancement on their workforce. 
## Data sourcess
- [Department details](EmployeeSQL/Data/departments.csv)
- [Titles of the employees](EmployeeSQL/Data/titles.csv)
- [Employee master data](EmployeeSQL/Data/employees.csv)
- [Salary details of the employees](EmployeeSQL/Data/salaries.csv)
- [Employees who work in each department](EmployeeSQL/Data/dept_emp.csv)
- [Department managers](EmployeeSQL/Data/dept_manager.csv)


## Data Modeling
The modeling process starts by reading the available data in various CSV files and identifying 
- Relationship between those data
- Dependencies between data
- Unique values withing a given data set
- Relevant types of the data available. 

[Data modeling tool : quick database diagrams](https://www.quickdatabasediagrams.com). 

[Entity Relationship Diagram (ERD).](EmployeeSQL/ERD_images/Pewlett_Hackard_ERD.png)

## Data Engineering
Data engineering is divided into two parts.
- Create physical data tables.
  - Specify the data types, primary keys, foreign keys, and other constraints.
  - For the primary keys, verify that the column is unique. Otherwise, create a composite key, which takes two primary keys to uniquely identify a row.
  - Create the tables in the correct order to handle the foreign keys.
- Import data from CSV file 
  - Import each CSV file into the corresponding SQL table. Make sure to import the data in correct order to handle the foreign keys.

[RDBMS : pgAdmin 4](https://www.pgadmin.org/)

[Query Tool : PostgreSQL ver 16.3](https://www.postgresql.org/)

[Table creation script](EmployeeSQL/Table schema_query/Table_Schema.sql)

## Order of creating tables and importing data from CSV files 
1. Department
2. Titles
3. Employee
4. Employee salaries
5. Department employees
6. Department managers 

## Data Analysis
- List the employee number, last name, first name, sex, and salary of each employee.
- List the first name, last name, and hire date for the employees who were hired in 1986.
- List the manager of each department along with their department number, department name, employee number, last name, and first name.
- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
- List each employee in the Sales department, including their employee number, last name, and first name.
- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

[Data analysis script](EmployeeSQL/Analysis_queries/DataAnalysis.sql)
