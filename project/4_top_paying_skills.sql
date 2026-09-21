/*
Answer: What are the top skills based on salary?
Look at the average salary associated with each skill for Data Analyst positions
Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/
SELECT
skills,
round(AVG(JPF.salary_year_avg) )as avg_salary
FROM 
job_postings_fact as jpf
INNER JOIN 
skills_job_dim as skd
ON
jpf.job_id=skd.job_id
INNER JOIN
skills_dim AS sd
ON
sd.skill_id = skd.skill_id
WHERE
jpf.job_title_short ='Data Analyst'
AND
jpf.salary_year_avg is not NULL
AND
jpf.job_work_from_home = TRUE
GROUP BY
skills
ORDER BY
avg_salary
LIMIT 25