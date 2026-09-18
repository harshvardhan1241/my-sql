
create table job_january as
SELECT*
FROM
job_postings_fact
WHERE
extract(month from job_posted_date) = 1

SELECT*
FROM job_january
WHERE
extract(DAY from job_posted_date) = 15 

create table job_February as
SELECT*
FROM
job_postings_fact
WHERE
extract(month from job_posted_date) = 2

create table job_March as
SELECT*
FROM
job_postings_fact
WHERE
extract(month from job_posted_date) = 3