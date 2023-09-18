create database Insurance_Project;
use Insurance_project;
show tables;

-- *********************************************************************************************************************************************
-- 1. Number of invoice by Account Executive.

select Account_Executive,count( * ) as Number_of_invoices
from invoice
group by Account_Executive
order by Number_of_invoices desc;
-- *********************************************************************************************************************************************
-- 2. yearly Meeting Count.
 
 select year(meeting_date) as meeting_year,count(meeting_date) as meeting_Count
 from meeting
 group by meeting_year
 order by meeting_count desc;
 -- **********************************************************************************************************************************************
 -- 3. cross sell, New, Renewal = {Target, Achieve, invoice}.
 -- Target( Cross Sell, New, Renewal)
 
 select sum(cross_sell_budget) as Cross_sell_target, sum(new_budget) as new_target,sum(renewal_budget) as renewal_target
from individual_budgets;

 -- Achieved( Cross Sell, New, Renewal)
 select income_class, round(sum(amount)) as Achieved
from brokerage
 group by income_class
 order by achieved desc;
 
  -- invoice( Cross Sell, New, Renewal)
select income_class,sum(amount) as amount
  from invoice
 group by income_class
 order by amount;
-- ********************************************************************************************************************************************************* 
-- 4. Revenue by stages.

select stage, sum(revenue_amount) as revenue 
from opportunity
group by stage
order by revenue desc;

-- **********************************************************************************************************************************************
-- 5. Number of meeting by Account Executive.
select Account_executive, count(*) as Number_of_meeting
from meeting
group by account_executive
order by number_of_meeting desc;

-- ***********************************************************************************************************************************************
-- 6. top-4 open oppurtunity.
select opportunity_name, sum(revenue_amount) as Amount 
from opportunity
group by opportunity_name
order by amount desc
limit 4;
-- ************************************************************************************************************************************************
 -- 3. Cross sell, New, Renewal
 select b.income_class,sum(t.cross_sell_budget) as target, sum(b.Amount) as achieved,sum(I.Amount) as invoice
 from individual_budgets t
 join brokerage b on t.Branch = b.branch_name
 join invoice I on b.branch_name = I.branch_name
 Group by b.income_class;
 -- **************************************************************************************************************************************************
-- Active and Inactive policy
select policy_status, count(policy_number)
from brokerage
group by policy_status;
-- ******************************************************************************************************************************************************