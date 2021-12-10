use hrdata;

#Display complete table
select * from hr;

#Total Number of Employees who worked with Company.
select count( distinct EmpID) from hr;
#There are 303 Employees

#Number of Active and Terminated Employees 
select count(distinct EmpID) from hr where DateofTermination = "";
#Out of total 303 , 199 employees are still Employed and 104 Employees were terminated

# Termination Status Count
select EmploymentStatus, count(EmploymentStatus) from hr group by EmploymentStatus;
# 88 Employees were Voluntarily Terminated whereas 16 Employees Had termination with cause.


#Deleting Unwanted Columns
Alter table hr drop column MaritalStatusID;
Alter table hr drop column EmpStatusID;
Alter table hr drop column PerfScoreID;
Alter table hr drop column FromDiversityJobFairID ;
Alter table hr drop column DeptID;
Alter table hr drop column GenderID;

#Rechecking Table after removing unwanted Tables
select * from hr;

#Percentage of Male and female Employees
select Sex, count(EmpID) as Number_of_Employees from hr group by Sex;
# 137 Males (43 %) and 171 Females (56 %) 

#Female Employees who are married
select MarriedID, count(EmpID) as Number_of_Employees from hr where Sex = 'F' group by MarriedID;
# 70 Females who are working in Company are Married whre as other 101 are unmarried. 

#Citizenship Status of Employees
select CitizenDesc , count(EmpId) from hr group by CitizenDesc;
# Mejority of Employees are US Citizens (287), 12 Employees are Eligible NonCitizens and 4 are not Citizens.

#Employees Categorized by Departments.
select Department,count(EmpID) from hr group by Department;
# Production Deprtment is having max 201 employees working with them, 50 in IT/IS, 11 Software Engineers, 31 in sales and 9 in admin office with 1 Executive.

#Details of Employee who is paid with heighest Salary.
select ï»¿Employee_Name, Position, Department,Salary, PerformanceScore, EmpSatisfaction, Absences, EmploymentStatus from hr where Salary = (select max(Salary) from hr);
	# $250000 is the maximum salary paid to King, Janet who is Pesident and CEO and he is still Active in Company
	# He is having 10 Absentees on his name and He fully met Perforamnace Expections

#Details of Employee who is paid with least Salary
select ï»¿Employee_Name, Position, Department,Salary, PerformanceScore, EmpSatisfaction, Absences, EmploymentStatus from hr where Salary = (select min(Salary) from hr);
	#Production Technician Zima Colleen is having least salary of $45046 he is still Active in Company

# Maximum Number of Absentees that an employee had. 
select ï»¿Employee_Name, Position, Department, Absences from hr where Absences = (select max(Absences) from hr);
	#Maximum count of Absences is 20

#Employees Grouped by Positions
select Position, count(EmpID) from hr where EmploymentStatus = 'Active' group by Position;
	#there are maximum 81 Employees who are still active as Production Technician I 
    
#Position with the average salary offered to them
select Position,round(Avg(salary)) from hr where EmploymentStatus = 'Active' group by Position order by Avg(Salary) desc;
	#Heighest Average Salary is offered for 'President and CEO' Post whereas Minimum averrage salary was offered to 'Administrative Assistant'

#Managers with number of Employees working under them
select ManagerName, Department, count(EmpID) from hr where EmploymentStatus = 'Active' group by ManagerName order by count(EmpID) desc; 
	# 'Ketsia Liebig' ,'Brannon Miller' and 'Kelley Spirea' are there 3 Managers from Production managing max number of Employees (16 Each)

# Best Recuitment Source for Company
select RecruitmentSource, count(EmpID) from hr group by RecruitmentSource order by count(EmpID);
	# Maximum Employees were hired through RECRUITMENTSOURCE : Indeed (86)

select RecruitmentSource, count(EmpID) from hr where EmploymentStatus = 'Active' group by RecruitmentSource order by count(EmpID);
	# Maximum Employees were hired through RECRUITMENTSOURCE(Active)  : Indeed (65)

select RecruitmentSource, count(EmpID) from hr where EmploymentStatus != 'Active' group by RecruitmentSource order by count(EmpID);
	# Maximum Employees were hired through RECRUITMENTSOURCE(Terminated)  : Google Search (30)

#Employees who came late in past 30 Days.    
select ï»¿Employee_Name, Position, Department, DaysLateLast30 from hr where DaysLateLast30 != 0 order by DaysLateLast30 desc;
	 #List of Employees who were late in last 30 Days

#Employees having Salary more than average salary
select count(EmpID) from hr where Salary > (Select AVG(Salary) from hr where EmploymentStatus = 'Active' );
#There are total 83 Employees who are currently working in company and are having Salary More than Average Salary.


    

