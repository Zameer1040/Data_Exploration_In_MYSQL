create database Hr_Analytics;
use Hr_Analytics;

-- ***********************************************************************************************************
-- 1.Average Attrition rate for all Departments

SELECT department, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_rate
FROM hr_1
GROUP BY department;

-- **************************************************************************************************************
-- 2.Average Hourly rate of Male Research Scientist

select jobrole,gender,round(avg(hourlyrate),2) as avg_hourly_rate
from hr_1
where gender = "Male" and jobrole = "Research Scientist";

-- **************************************************************************************************************
-- 3.Attrition rate Vs Monthly income stats

SELECT
    h1.Attrition,
    COUNT(*) AS CountOfEmployees,
    AVG(h2.MonthlyIncome) AS AverageMonthlyIncome,
    MAX(h2.MonthlyIncome) AS MaxMonthlyIncome,
    MIN(h2.MonthlyIncome) AS MinMonthlyIncome,
    SUM(h2.MonthlyIncome) AS TotalMonthlyIncome
FROM hr_1 h1
INNER JOIN hr_2 h2 ON h1.Employeenumber = h2.EmployeeID
GROUP BY h1.Attrition;

-- ************************************************************************************************************
-- 4.Average working years for each Department

select h1.department, avg(h2.totalworkingyears) as avg_working_years
from hr_1 h1 inner join hr_2 h2 on h1.Employeenumber = h2.EmployeeID
group by h1.department;

-- *************************************************************************************************************
-- 5.Job Role Vs Work life balance

select h1.jobrole, avg(h2.worklifebalance) as avg_worklife_balance
from hr_1 h1 inner join hr_2 h2 on h1.employeenumber = h2.employeeid
group by h1.jobrole
order by avg_worklife_balance desc;

-- *****************************************************************************************************
-- 6. Attrition rate Vs Year since last promotion relation

SELECT h2.YearsSinceLastPromotion, 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritedEmployees,
       (SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRatePercent
FROM hr_1 h1 inner join hr_2 h2 on h1.employeenumber = h2.employeeid
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;

-- *******************************************************************************************************************************





