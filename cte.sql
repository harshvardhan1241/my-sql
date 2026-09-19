WITH job_january AS (
  SELECT *
  FROM job_postings_fact
  WHERE extract(month FROM job_posted_date) = 1
)
SELECT * FROM job_january;


select*
from job_postings_fact


with company_job_count as (
  select
   company_id,
    count(*) as job_count
  from job_postings_fact
  group by company_id
)

select
 company_dim.name as company_name,
company_job_count.job_count
from company_dim
left join company_job_count ON company_job_count.company_id = company_dim.company_id
order by company_job_count.job_count desc