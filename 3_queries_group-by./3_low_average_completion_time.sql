SELECT students.name, avg(assignment_submissions.duration) as average_duration, avg(assignments.duration) as average_estimate
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration) 
ORDER BY average_duration;


