SELECT teachers.name, count(assistance_requests.*) as total_assitances
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;