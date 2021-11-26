const { Pool } = require('pg');

const pool = new Pool({
  user: 'safiyusuf',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = (`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`);

const value = [process.argv[2] || 'JUL02']

pool.query(queryString, value)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});