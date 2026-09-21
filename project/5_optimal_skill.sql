/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
Identify skills in high demand and associated with high average salaries for Data Analyst roles
Concentrates on remote positions with specified salaries
Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis
*/
with skill_demand as (
    SELECT
    sd.skill_id,
    sd.skills,
    count(skd.job_id) as demand_count
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
    sd.skill_id,
    sd.skills
  
),average_salary AS
(
    SELECT
    sd.skill_id,   
    sd.skills,
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
    sd.skill_id,
    sd.skills
  
)
SELECT
sd.skill_id,
sd. skills,
demand_count,
avg_salary
FROM
skill_demand as sd
INNER JOIN 
average_salary ON
sd.skill_id= average_salary.skill_id
WHERE
demand_count>10
ORDER BY
avg_salary DESC,
demand_count DESC
LIMIT 25 ;

--rewirten code
SELECT
sd.skill_id,
sd.skills,
count(sjd.job_id) as demand_count,
round(avg(jpf.salary_year_avg),0) as avg_salary
from 
job_postings_fact as jpf
INNER JOIN
skills_job_dim as sjd
ON
jpf.job_id =sjd.job_id
INNER JOIN
skills_dim as sd
ON
sjd.skill_id = sd.skill_id
WHERE
jpf.job_title_short='Data Analyst'
AND
jpf.salary_year_avg is not NULL
AND
jpf.job_work_from_home= TRUE
GROUP BY
sd.skill_id
HAVING
count(sjd.job_id) >10
ORDER BY
avg_salary DESC,
demand_count DESC
limit 25;