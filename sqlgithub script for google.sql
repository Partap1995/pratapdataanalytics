create database data_analytics;
use data_analytics;
create table employees (
emp_id int unique,
emp_firstname char(20) not null,
emp_lastname char(20) not null,
emp_address char(50) 
);
create table emp_dep(
emp_id int,
emp_department char(20) ,
emp_salary int(10) not null,
reports_to char(30) not null
);
CREATE TABLE projects (
  project_id INT PRIMARY KEY,     
  project_name CHAR(50) NOT NULL,  
  project_description CHAR(100),   
  start_date DATE,                 
  end_date DATE,                   
  emp_id INT                   
);
alter table employees
modify emp_id int unique;
INSERT INTO employees (emp_id, emp_firstname, emp_lastname, emp_address) VALUES
(1, 'Aarav', 'Sharma', 'Delhi'),
(2, 'Vivaan', 'Patel', 'Mumbai'),
(3, 'Reyansh', 'Verma', 'Bangalore'),
(4, 'Diya', 'Singh', 'Pune'),
(5, 'Anaya', 'Iyer', 'Chennai'),
(6, 'Karan', 'Malhotra', 'Delhi'),         
(7, 'Riya', 'Kapoor', 'Mumbai'),           
(8, 'Kabir', 'Bansal', 'Bangalore'),      
(9, 'Saanvi', 'Joshi', 'Pune'),             
(10, 'Rohit', 'Mehta', 'Chennai');

INSERT INTO emp_dep (emp_id, emp_department, emp_salary, reports_to) VALUES
(1, 'HR', 60000, 'Vivaan Patel'),          
(2, 'Finance', 75000, 'Diya Singh'),       
(3, 'IT', 80000, 'Diya Singh'),            
(4, 'Marketing', 55000, 'Diya Singh' ),             
(5, 'IT', 70000, 'Reyansh Verma'),        
(6, 'HR', 62000, 'Aarav Sharma'),          
(7, 'Sales', 58000, 'Vivaan Patel'),       
(8, 'IT', 75000, 'Diya Singh'),            
(9, 'Finance', 72000, 'Vivaan Patel'),     
(10, 'Marketing', 60000, 'Diya Singh' );        

INSERT INTO projects (project_id, project_name, project_description, start_date, end_date, emp_id) VALUES
(1, 'Website Development', 'Revamp the company website for better user experience.', '2024-01-01', '2024-03-01', 1),
(2, 'Annual Budget', 'Prepare the budget for the upcoming financial year.', '2024-02-01', '2024-04-30', 2),
(3, 'Network Upgrade', 'Upgrade the company network infrastructure.', '2024-01-15', '2024-05-15', 3),
(4, 'Social Media Campaign', 'Launch a new marketing campaign on social media.', '2024-03-01', '2024-08-01', 4),
(5, 'App Development', 'Develop a mobile application for customer engagement.', '2024-02-15', '2024-07-15', 5),
(6, 'Data Analysis', 'Analyze sales data for the last quarter.', '2024-01-10', '2024-03-15', 6),
(7, 'Client Presentation', 'Prepare presentation for the upcoming client meeting.', '2024-03-05', '2024-03-20', 7),
(8, 'Cybersecurity Audit', 'Conduct a cybersecurity audit for the IT infrastructure.', '2024-02-01', '2024-04-01', 8),
(9, 'Investment Strategy', 'Develop investment strategies for clients.', '2024-01-20', '2024-05-20', 9),
(10, 'Brand Awareness Campaign', 'Create a campaign to increase brand visibility and awareness.', '2024-02-25', '2024-07-25', 10);

select * from emp_dep;
select emp_address,reports_to from employees left join emp_dep
on employees.emp_id = emp_dep.emp_id
 where emp_salary >= 70000;
 
use data_analytics;

select * from employees right join projects
 on employees.emp_id=projects.emp_id
 where emp_address ="mumbai" ;
 
 select emp_department, reports_to 
 from emp_dep
 order by emp_salary asc -- to select top 5 paid employees--
 limit 5;
 
 select emp_firstname, project_id, project_name ,timestampdiff(month, start_date, end_date) as timeSpent 
 from projects join employees
 on projects.emp_id = employees.emp_id; -- to find timespent by employees on the project
 
 select emp_department, avg(emp_salary) as average_salary 
 from emp_dep
 group by emp_department
 order by average_salary asc     -- to find average salary for each department and order it in ascending order
 ;
 
 select emp_department, count(*) as employee_per_department 
 from emp_dep
 group by emp_department;  -- to count employees per department--
 
 -- subqueries--
  select emp_department from emp_dep
   group by emp_department
  having avg(emp_salary) >(
  select 65000
  ); -- to find departments having average salary more than  65000
  
-- selecting the projects handled by the employees with highest salary using join --
select project_id, Project_name, emp_salary
from projects join emp_dep
on projects.emp_id = emp_dep.emp_id
order by emp_salary desc 
limit 1;

-- selecting the projects handled by the employees with highest salary using subqueries --
select project_id, project_name
from projects
where projects.emp_id = (
select emp_Id 
from emp_dep
order by emp_salary desc
limit 1
);

-- adding a new row --
 insert into employees values (
 11 , 'Pratap', 'Singh', 'kasganj'
 );
 -- modifying columns 
 -- changing column name--
 alter table employees
 rename column emp_firstname to employee_firstname;
 
 select Employee_firstname 
 from employees;
 
 -- deleting a row from database--
 delete from employees
 where emp_id =5;
 
 select employee_firstname
 from employees
 where emp_id = 5;
 
 
-- changing table name --
rename table employees to employee;

  
 
  



