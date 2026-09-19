SELECT  
company_dim.name as company_name,
company_job_count.total_jobs,
case
when company_job_count.total_jobs <10 then 'Low'
when company_job_count.total_jobs between 10 and 50 then 'Medium'
else 'High'
end as company_size
from
(SELECT
company_id,
count(*) as total_jobs 
from
job_postings_fact
group by company_id
) as company_job_count
inner JOIN company_dim ON company_dim.company_id = company_job_count.company_id