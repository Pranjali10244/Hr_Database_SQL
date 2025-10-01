CREATE DATABASE hrdata;
USE hrdata;

-- Upload csv file as table employees
SELECT*FROM EMPLOYEES;

-- Total Employees:
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Total Old Employees:
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination !='';

-- Total Old Employees:
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination ='';

-- Average Salary:
SELECT AVG(Salary) AS Avg_Salary
FROM employees;

-- Average Age:
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB, '%d-%m-%Y'), CURDATE())) AS AVG_Age
FROM employees;

-- Average Years in Company:
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DateofHire, '%d-%m-%Y'), CURDATE())) AS AVG_Years_in_Company
FROM employees;

-- Adding New Column for Employee Current Status:
ALTER TABLE employees
ADD EmployeeCurrentStatus INT;

-- Update values for New Column:
SET SQL_SAFE_UPDATES=0;

UPDATE employees
SET EmployeeCurrentStatus = CASE
WHEN DateofTermination ='' THEN 1
ELSE 0
END;


-- Calculate Attrition Rate based on custom EmpStatusID values:
SELECT (CAST(COUNT(CASE WHEN EmployeeCurrentStatus = 0 THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS Attrition_Rate
FROM employees;

-- Get Column Names and Data Types:
DESCRIBE employees;  # or SHOW COLUMNS FROM employees;

-- Print 1st 5 Rows:
SELECT*FROM employees
LIMIT 5;

-- Print last 5 Rows:
SELECT*FROM employees
ORDER BY EmpID DESC
LIMIT 5;

-- Changing Data Types of Salary:
ALTER TABLE employees
MODIFY COLUMN Salary DECIMAL(10, 2);


-- Convert all date columns inproper dates:
UPDATE employees
SET DOB = STR_TO_DATE(DOB, '%d-%m-%Y');
UPDATE employees
SET DateofHire = STR_TO_DATE(DateofHire, '%d-%m-%Y');
UPDATE employees
SET LastPerformanceReview_Date = STR_TO_DATE(LastPerformanceReview_Date, '%d-%m-%Y');

-- Alter Table:
ALTER TABLE employees
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;

-- Fill empty values in date of Termination:
UPDATE employees
SET DateofTermination = 'CurrentlyWorking'
WHERE DateofTermination IS NULL OR DateofTermination = '';

# Count employees Marital Status wise:
-- Count of each unique value in the maritalDesc:
SELECT MaritalDesc, COUNT(*) AS Count
FROM employees
GROUP BY MaritalDesc
ORDER BY Count DESC;

-- Count of each unique value in the Deapartment:
SELECT Department, COUNT(*) AS Count
FROM employees
GROUP BY Department
ORDER BY Count DESC;

-- Count of each unique value in the Position:
SELECT Position, COUNT(*) AS Count
FROM employees
GROUP BY Position
ORDER BY Count DESC;

-- Count of each unique value in the Manager:
SELECT Managername, COUNT(*) AS Count
FROM employees
GROUP BY ManagerName
ORDER BY Count DESC;

# Salary Distribution By Employees:
SELECT CASE
WHEN Salary < 30000 THEN '< 30K'
WHEN Salary BETWEEN 30000 AND 49999 THEN '30K-49K'
WHEN Salary BETWEEN 50000 AND 69999 THEN '50K-69K'
WHEN Salary BETWEEN 70000 AND 89999 THEN '70K-89K'
WHEN Salary >= 90000 THEN '90K and above'
END AS Salary_Range,
COUNT(*) AS Frequency 
FROM employees GROUP BY Salary_Range ORDER BY Salary_Range;

 -- Performance Score:
SELECT PerformanceScore, COUNT(*) AS Count
FROM employees
GROUP BY PerformanceScore
ORDER BY Count DESC;

-- Average Salary By Department:  # EDA = 
SELECT Department, AVG(Salary) AS AverageSalary
FROM employees
GROUP BY Department
ORDER BY Department;

-- Count Termination By Cause:
SELECT TermReason, COUNT(*) AS Count
FROM employees
WHERE TermReason IS NOT NULL
GROUP BY TermReason
ORDER BY Count DESC;

-- Employee Count of State:
SELECT State, COUNT(*) AS Count
FROM employees
GROUP BY State
ORDER BY Count DESC;

# Gender Distribution:
SELECT Gender, COUNT(*) AS Count
FROM employees
GROUP BY Gender
ORDER BY Count DESC;

-- Gettting Age Distribution:
-- Add a new column AGE:
ALTER TABLE employees
ADD COLUMN Age INT;

-- Update the Age column with calculated age:
UPDATE employees
SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());

# Age Distribution :
SELECT CASE
WHEN Age < 20 THEN '< 20'
WHEN Age BETWEEN 20 AND 29 THEN '20-29'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
WHEN Age >= 60 THEN '60 and above'
END AS Age_Range,
COUNT(*) AS Count 
FROM employees GROUP BY Age_Range;


