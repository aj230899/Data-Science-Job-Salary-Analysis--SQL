use job_salaries;

select * from `ds_salaries - practise`;

## 1. How many job title was included in the dataset?
select count(distinct job_title) as no_of_jobs from `ds_salaries - practise`;

## 2. Which experience level has the highest salary?
select case when experience_level = 'MI' then 'Mid Level'
            when experience_level = 'SE' then 'Senior Level'
            when experience_level = 'EN' then 'Entry Level'
            when experience_level = 'EX' then 'Executive Level'
            Else null end as experience_category, count(1) as no_of_category, 
            round(max(salary_in_usd),2) as highest_salary from `ds_salaries - practise`
group by case when experience_level = 'MI' then 'Mid Level'
            when experience_level = 'SE' then 'Senior Level'
            when experience_level = 'EN' then 'Entry Level'
            when experience_level = 'EX' then 'Executive Level'
            Else null end
order by highest_salary desc;

## 3. Does the employment type affect salary?
select case when employment_type = 'FT' then 'Full time'
			when employment_type = 'PT' then 'Part time'
			when employment_type = 'FL' then 'Freelance'
			when employment_type = 'CT' then 'Contract'
            Else null end as employment_category, round(avg(salary_in_usd),2) as average_salary
            from `ds_salaries - practise`
group by employment_type
order by average_salary desc;
		
## 4. What is the average salary per job title in USD?
select distinct job_title, round(avg(salary_in_usd),2) as averge_salary from `ds_salaries - practise`
group by job_title order by 1,2;    
        
## 5. What is the highest salary per job title in USD?
select distinct job_title, round(max(salary_in_usd),2) as highest_salary from `ds_salaries - practise`
group by job_title order by 1,2 desc;

## 6. What is the highest paying entry-level data science job?
select job_title, experience_level, round(max(salary_in_usd),2) as highest_salary from `ds_salaries - practise`
where experience_level = 'EN' group by job_title order by 1,3; 

## 7. What is the highest paying mid-level data science job?
select job_title, experience_level, max(salary_in_usd)as highest_salary from `ds_salaries - practise`
where experience_level = 'MI' group by job_title order by 1,3;

## 8. What is the highest paying senior-level data science job?
select job_title, experience_level, max(salary_in_usd) as highest_salary from `ds_salaries - practise`
where experience_level = 'SE' group by job_title order by 1,3;

## 9. What is the highest paying Executive level data science job?
select job_title, experience_level, max(salary_in_usd) as highest_salary from `ds_salaries - practise`
where experience_level = 'EX' group by job_title order by 1,3;

## 10. What is the average salary per experience level?
select experience_level, avg(salary_in_usd) as average_salary from `ds_salaries - practise`
group by experience_level order by 1;

## 11. What is the lowest paying entry-level data science job?
select experience_level, min(salary_in_usd) as lowest_salary from `ds_salaries - practise`
where experience_level = 'EN' order by 1;

## 12. What is the lowest paying Mid-level Data Science Job?
select experience_level, min(salary_in_usd) as lowest_salary from `ds_salaries - practise`
where experience_level = 'MI' order by 1;

## 13. What is the lowest paying Senior level data science job?
select experience_level, min(salary_in_usd) as lowest_salary from `ds_salaries - practise`
where experience_level = 'SE' order by 1;

## 14. What is the lowest paying Executive level data science job?
select experience_level, min(salary_in_usd) as lowest_salary from `ds_salaries - practise`
where experience_level = "EX" order by 1;

## 15. Does company size affect salary?
select case when company_size = 'L' then 'Large'
			when company_size = 'S' then 'Small'
            when company_size = 'M' then 'Medium'
            else null end as company_size_category, min(salary_in_usd) as min_salary, max(salary_in_usd) as max_salary
            from `ds_salaries - practise`
group by company_size order by 1;

## 16. Does company location affect Salary?
select case when company_location = 'US' then 'in the US'
	   else "not in US" end as company_loc_category, min(salary_in_usd) as min_salary,
       max(salary_in_usd) as max_salary from `ds_salaries - practise`
group by case when company_location = 'US' then 'in the US'
	   else "not in US" end;

