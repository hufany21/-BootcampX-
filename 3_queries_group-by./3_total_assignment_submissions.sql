SELECT count(*) as total_assignment_submissions, cohorts.name 
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name 
ORDER BY total_assignment_submissions DESC;
