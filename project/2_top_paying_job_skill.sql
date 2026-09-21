/*Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH
top_paying_job as (
SELECT
jpf.job_id,
jpf.job_title,
jpf.salary_year_avg,
name as company_name
FROM
job_postings_fact as jpf
LEFT JOIN
company_dim as cd
ON
jpf.company_id=cd.company_id
WHERE
jpf.job_title_short ='Data Analyst'
AND
jpf.job_location ='Anywhere'
AND
jpf.salary_year_avg is not NULL
ORDER BY
jpf.salary_year_avg DESC
LIMIT 10
)

SELECT
tpj.job_id,
tpj.job_title,
tpj.salary_year_avg,
tpj.company_name,
sd.skills
FROM 
top_paying_job as tpj
INNER JOIN 
skills_job_dim as skd
ON
tpj.job_id=skd.job_id
INNER JOIN
skills_dim AS sd
ON
sd.skill_id = skd.skill_id
ORDER BY
tpj.salary_year_avg DESC