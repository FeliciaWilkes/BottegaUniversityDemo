-- SQL query scripts for:
-- The average grade that is given by each professor
USE university_sql_schema;

SELECT avg(`grades`.`gradevalue`) as 'grade', `grades`.`idprofessors`
FROM `university_sql_schema`.`grades`
GROUP BY `grades`.`idprofessors`;
-- The top grades for each student
SELECT 
    `grades`.`idstudents`,
    Max(`grades`.`gradevalue`)
FROM `university_sql_schema`.`grades`
GROUP BY `grades`.`idstudents`;
-- Group students by the courses that they are enrolled in
SELECT
    `courses`.`coursesName`,
    `courses`.`coursesLevel`,
    `courses`.`idstudents`
FROM `university_sql_schema`.`courses`
group by `courses`.`idstudents`;

-- Create a summary report of courses and their average grades, 
SELECT 
    avg(`grades`.`gradevalue`) as avgGrade,
    `grades`.`idcourses`
FROM `university_sql_schema`.`grades`
group by `grades`.`idcourses`;
-- sorted by the most challenging course 
SELECT `courses`.`idcourses`,
    `courses`.`coursesName`,
    `courses`.`coursesLevel`
FROM `university_sql_schema`.`courses`
order by `courses`.`coursesLevel` DESC;
--(course with the lowest average grade) to the easiest course
SELECT 	`courses`.`idcourses`,
		`courses`.`coursesName`, 
        `courses`.`coursesLevel`,
        avg(`grades`.`gradevalue`)
FROM `university_sql_schema`.`courses` 
left join `university_sql_schema`.`grades`
on  
`university_sql_schema`.`courses`.`idcourses` = `university_sql_schema`.`grades`.`idcourses`
group by `courses`.`coursesLevel` desc;
-- Finding which student and professor have the most courses in common
select `idprofessors`,
	   `professorsFirstName`,
       `professorsLastName`,
       count(`courses`.`idcourses`),
		`students`.`idstudents`,
       `studentsFirstName`,
       `studentsLastName`
from `professors` 
left Join `students` 
on `students`.`idcourses` = `professors`.`idcourses`
join `courses`
on `courses`.`idcourses` = `professors`.`idcourses`
where `students`.`idcourses` = `professors`.`idcourses` group by `students`.`idstudents` ;