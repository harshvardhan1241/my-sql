SELECT
count(job_id) as job_count,
location_category
from
job_postings_fact
WHERE
job_title_short ='Data Analyst'
group by location_category