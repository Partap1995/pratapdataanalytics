# Data Analytics Project

Through this project I want to show that i have some knowledge of MYSQL programming. This project includes different commands, joins and subqueries used in MYSQL. This project consists of a database 'data_analytics' and three tables. The code is about creating a database and three tables with 10 rows per table and executing different MYSQL commands.

## Database Structure

### Database Name:
- `data_analytics`

### Tables:
1. **employees**
   - Stores employee details such as ID, first name, last name, and address.
   - **Columns:**
     - `emp_id`: Unique identifier for each employee (int)
     - `emp_firstname`: Employee's first name (char)
     - `emp_lastname`: Employee's last name (char)
     - `emp_address`: Employee's address (char)

2. **emp_dep**
   - Contains employee department details, including salary and reporting structure.
   - **Columns:**
     - `emp_id`: Employee ID (int)
     - `emp_department`: Department name (char)
     - `emp_salary`: Employee salary (int)
     - `reports_to`: Name of the supervisor (char)

3. **projects**
   - Holds information about projects assigned to employees.
   - **Columns:**
     - `project_id`: Unique identifier for each project (int)
     - `project_name`: Name of the project (char)
     - `project_description`: Brief description of the project (char)
     - `start_date`: Project start date (date)
     - `end_date`: Project end date (date)
     - `emp_id`: Employee assigned to the project (int)

## Installation

1. **Create the Database:**
   - Execute the following SQL command to create the database:
     ```sql
     CREATE DATABASE data_analytics;
     ```

2. **Use the Database:**
   - Switch to the newly created database:
     ```sql
     USE data_analytics;
     ```

3. **Create Tables:**
   - Run the provided SQL scripts to create the tables and insert sample data.

## Queries

The project includes several SQL queries for data analysis, such as:
- Retrieving employee details with salaries above a certain threshold.
- Finding the average salary per department.
- Identifying the projects assigned to the highest-paid employee.

### Example Query
To get the average salary by department, use the following SQL command:
```sql
SELECT emp_department, AVG(emp_salary) AS average_salary 
FROM emp_dep 
GROUP BY emp_department 
ORDER BY average_salary ASC;
