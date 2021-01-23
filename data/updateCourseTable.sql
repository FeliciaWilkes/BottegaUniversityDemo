UPDATE `university_sql_schema`.`courses`
SET
`coursesLevel` = 'Beginner'
WHERE `idcourses` BETWEEN 1 AND 10;

UPDATE `university_sql_schema`.`courses`
SET
`coursesLevel` = 'Intermediate'
WHERE `idcourses` BETWEEN 11 AND 20;

UPDATE `university_sql_schema`.`courses`
SET
`coursesLevel` = 'Advance'
WHERE `idcourses` BETWEEN 21 AND 31;