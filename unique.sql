SELECT
jpf.job_id,
jpf.job_title,
jpf.job_title_short,
jpf.job_location,
jpf.location_category,
jpf.salary_year_avg,
CASE
    WHEN jpf.salary_year_avg < 50000 THEN 'low'
    WHEN jpf.salary_year_avg BETWEEN 50000 AND 100000 THEN 'medium'
    WHEN jpf.salary_year_avg > 100000  THEN 'high'
     else 'free'
    END as salary_category
FROM
job_postings_fact as jpf
where
    jpf.salary_year_avg is not NULL
    AND jpf.location_category not like '%remote%'
    AND jpf.location_category not like '%other%'

order by jpf.salary_year_avg ;



