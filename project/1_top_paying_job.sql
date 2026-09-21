/*
What are the top-paying data analyst jobs?
Identify the top 10 highest-paying Data Analyst roles that are available remotely.
Focuses on job postings with specified salaries (remove nulls).
Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment.
*/
SELECT
jpf.job_id,
jpf.job_title,
jpf.job_location,
jpf.job_schedule_type,
jpf.salary_year_avg,
jpf.job_posted_date,
name as company_name
FROM
job_postings_fact as jpf
LEFT JOIN
company_dim as cd
ON
jpf.company_id=cd.company_id
WHERE
jpf.job_title ='Data Analyst'
AND
jpf.job_location ='Anywhere'
AND
jpf.salary_year_avg is not NULL
ORDER BY
jpf.salary_year_avg DESC
LIMIT 10