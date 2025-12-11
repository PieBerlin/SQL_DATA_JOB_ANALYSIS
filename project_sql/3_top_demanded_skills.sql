/*
    Question : what are the most demanded skills for data analyst roles?
    -join job postings to inner join tale simmilar to query 2
    -Focus on all job postings
    -Why? Retrieve the top 5 skills with the highest demand in the job market,
    providing insigts into the most valuable skills for job seekers

*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM  job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Software Engineer' -- use Data Analyst also 
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 100;