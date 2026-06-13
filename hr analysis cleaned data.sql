DROP DATABASE hr_data ;
CREATE DATABASE HR_data ;
USE HR_data;

SELECT * FROM hr_data.`hr data.xlsx - hr data`;

-- Check the missing values

SELECT COUNT(*) FROM hr_data.`hr data.xlsx - hr data`
WHERE Attrition IS NULL OR 
`Business Travel` IS NULL OR
`CF_age band` IS NULL or
`CF_attrition label` IS NULL or
Department IS NULL OR 
`Education Field` IS NULL OR
`emp no` IS NULL OR 
`Employee Number` IS NULL OR 
Gender IS NULL OR 
`Job Role` IS NULL OR 
`Marital Status` IS NULL OR 
`Over Time` IS NULL OR 
`Over18` IS NULL OR 
`Training Times Last Year` IS NULL OR
-2 IS NULL OR 
0 IS NULL OR 
Age IS NULL OR
`CF_current Employee` IS NULL OR 
`Daily Rate` IS NULL OR
`Distance From Home` IS NULL OR 
Education IS NULL OR 
`Employee Count` IS NULL OR 
`Environment Satisfaction` IS NULL OR 
`Hourly Rate` IS NULL OR 
`Job Involvement` IS NULL OR 
`Job Level` IS NULL OR 
`Job Satisfaction` IS NULL OR 
`Monthly Income` IS NULL OR 
`Monthly Rate` IS NULL OR
`Num Companies Worked` IS NULL OR 
`Percent Salary Hike` IS NULL OR
`Performance Rating` IS NULL OR 
`Relationship Satisfaction` IS NULL OR 
`Standard Hours` IS NULL OR 
`Stock Option Level` IS NULL OR 
`Total Working Years` IS NULL OR 
`Work Life Balance` IS NULL OR 
`Years At Company` IS NULL OR 
`Years In Current Role` IS NULL OR 
`Years Since Last Promotion` IS NULL OR 
`Years With Curr Manager` IS NULL ; -- no null

-- Remove unwanted columns and changing table name 
ALTER TABLE hr_data.`hr data.xlsx - hr data` DROP COLUMN `CF_age band`, DROP COLUMN `CF_attrition label` , DROP COLUMN `CF_current Employee`, DROP COLUMN `Employee Count`,DROP COLUMN Over18, DROP COLUMN `Standard Hours`, DROP COLUMN `-2`, DROP COLUMN `0`,DROP COLUMN `emp no`;
SELECT * FROM hr_data.`hr data.xlsx - hr data`;
RENAME TABLE hr_data.`hr data.xlsx - hr data` TO HR_employee ; 
SELECT * FROM HR_employee;

-- check duplicate 
SELECT `Employee Number`,
COUNT(*)
FROM HR_employee
GROUP BY `Employee Number`
HAVING COUNT(*) > 1; -- no duplicate 

-- check attrition distribution
SELECT Attrition,
COUNT(*) Employee_Count
FROM HR_Employee
GROUP BY Attrition; -- yes - 237, no - 1233

SELECT Department,
COUNT(*) Employee_Count
FROM HR_Employee
GROUP BY Department; -- sales - 446, R&D - 961, HR - 63

SELECT Department,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM HR_Employee
GROUP BY Department; -- sales - 92, r&d - 133, hr - 12

SELECT
`Over Time`,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) Attrition_Count
FROM HR_Employee
GROUP BY `Over Time`; -- yes - 416 - 127, no - 1054 - 110

SELECT
Department,
AVG(`Monthly Income`) Avg_Salary
FROM HR_Employee
GROUP BY Department; -- sales - 6959.1726, r&d - 6281.2529, hr - 6654.5079



