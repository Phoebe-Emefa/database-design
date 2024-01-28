-- University Enrollment and Course Management
-- Create department Table
CREATE TABLE
    department (
        department_id SERIAL PRIMARY KEY,
        department_name VARCHAR(225),
        department_head INT REFERENCES department (department_id),
    );

-- Create course Table
CREATE TABLE
    course (
        course_id SERIAL PRIMARY KEY,
        course_name VARCHAR(225),
        department INT REFERENCES department (department_id),
        prerequisites NULL,
    );

-- Create student Table
CREATE TABLE
    student (
        student_id SERIAL PRIMARY KEY,
        student_name VARCHAR(225),
        enrollment_date DATE,
        major INT REFERENCES course (course_id),
        phone VARCHAR(225),
        email VARCHAR(225),
    );

-- Create facility Table
CREATE TABLE
    facility (
        facility_id SERIAL PRIMARY KEY,
        facility_name VARCHAR(225),
        department INT REFERENCES department (department_id),
        phone VARCHAR(225),
        email VARCHAR(225),
        office_hours VARCHAR(225)
    );

-- Create classroom-assignment Table
CREATE TABLE
    classroom_assignment (classroom_assignment_id SERIAL PRIMARY KEY,);