-- 1. -- EXPLAIN QUERY PLAN

CREATE INDEX enrollments_index
ON enrollments(student_id);

-- 2.

CREATE INDEX enrollments2_index
ON enrollments(course_id);

CREATE INDEX courses_index
ON courses(id, department, number, semester);

-- 3.


-- 4.

CREATE INDEX courses2_index
ON courses(semester, title);


-- 5.

CREATE INDEX satisfies_index
ON satisfies(course_id, requirement_id);

-- 6.

-- 7.



