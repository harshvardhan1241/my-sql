/*Find the top 5 skills most frequently required in 
remote job postings. Display the skill ID, skill name,
 and the total number of remote job postings requiring
  each skill, ordered from highest to lowest demand.*/


with remote_jobs as (
--this is for finding for remote jobs here is not need of sub query or cte because we are not using any aggregate function in the select statement.
--we have two tables job_postings_fact and skills_job_dim. we are joining these two tables on job_id and then filtering the results based on job_work_from_home = TRUE. Finally, we are grouping the results by skill_id, job_id, and job_work_from_home to get the total number of skills for each remote job.
--after that we will goint make this as sub query and then we will join this sub query with skills_dim table to get the skill name for each skill_id.  
SELECT 
skill_id ,
job_postings.job_work_from_home,
count(*) as total_skills
from
 skills_job_dim as skills_to_job
inner join
job_postings_fact as job_postings
on
job_postings.job_id = skills_to_job.job_id
where
job_postings.job_work_from_home = TRUE
group by skill_id,job_postings.job_work_from_home
)
select
skills.skill_id,
skills as skill_name,
total_skills
from remote_jobs
inner join skills_dim as skills on
 skills.skill_id = remote_jobs.skill_id
 order BY
 total_skills DESC
 limit 5;


