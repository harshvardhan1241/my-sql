WITH job_january AS (
  SELECT *
  FROM job_postings_fact
  WHERE extract(month FROM job_posted_date) = 1
)
SELECT * FROM job_january;
