SELECT
skills_dim.skills as skill_name,
top_skills.skill_count
from
(SELECT
skill_id,
count(skill_id) as skill_count
from skills_job_dim
group by skill_id
order by skill_count desc
limit 10
) as top_skills
left JOIN skills_dim ON skills_dim.skill_id = top_skills.skill_id;