-- Healthcare Management System
-- Create patient Table
CREATE TABLE
    patient (
        patient_id SERIAL PRIMARY KEY,
        patient_name VARCHAR(225),
        dob DATE,
        phone VARCHAR(225),
        email VARCHAR(225),
        medical_history TEXT,
        current_treatment TEXT,
    );

-- Create staff Table
CREATE TABLE
    staff (
        staff_id SERIAL PRIMARY KEY,
        staff_name VARCHAR(225),
        specialty VARCHAR(225),
        contact VARCHAR(225),
        working_hours VARCHAR(225)
    );

-- Create appointment Table
CREATE TABLE
    appointment (
        appointment_id SERIAL PRIMARY KEY,
        patient_id INT REFERENCES patient (patient_id),
        staff_id INT REFERENCES staff (staff_id),
        appointment_datetime TIMESTAMP,
        visitation_purpose TEXT,
    );

-- Create inventory Table
CREATE TABLE
    inventory (
        item_id SERIAL PRIMARY KEY,
        item_name VARCHAR(225),
        quantity INT reorder_level TEXT
    );

-- Create department Table
CREATE TABLE
    department (
        department_id SERIAL PRIMARY KEY,
        department_name VARCHAR(225),
        department_head INT REFERENCES doctor (staff_id),
    );

-- Create doctor-patient Table
CREATE TABLE
    doctor_patient (
        relationship_id SERIAL PRIMARY KEY,
        staff_id INT REFERENCES staff (staff_id),
        patient_id INT REFERENCES patient (patient_id),
    );