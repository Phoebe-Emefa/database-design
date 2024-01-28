-- room_bookings, guest_information, staff_assignments, and service_requests.
CREATE TABLE
    room (
        room_id SERIAL PRIMARY KEY,
        room_type VARCHAR(25) CHECK (room_type IN ('Single', 'Double', 'Suite')),
        room_status VARCHAR(25) CHECK (room_status IN ('Occupied', 'Vacant')),
        cleaning_schedule TEXT,
        room_features TEXT,
    );

CREATE TABLE
    guest (
        guest_id SERIAL PRIMARY KEY,
        guest_name VARCHAR(225),
        phone VARCHAR(225),
        email VARCHAR(225),
        loyalty_program_membership NULL
    );

CREATE TABLE
    booking_detail (
        booking_detail_id SERIAL PRIMARY KEY,
        guest_id INT REFERENCES guest (guest_id),
        room_id INT REFERENCES room (room_id),
        check_in_date DATE,
        checkout_date DATE,
        payment_status CHECK (payment_status IN ('PAID', 'PENDING')),
    );

CREATE TABLE
    service_requests (
        service_requests_id SERIAL PRIMARY KEY,
        booking_id INT REFERENCES booking_detail (booking_detail_id),
        service_description TEXT,
        assigned_staff INT REFERENCES staff (staff_id),
        fulfillment_status VARCHAR(225)
    );

CREATE TABLE
    staff (
        staff_id SERIAL PRIMARY KEY,
        staff_name VARCHAR(225),
        phone VARCHAR(225),
        email VARCHAR(225),
        staff_role VARCHAR(225),
        assigned_tasks INT REFERENCES service_requests (service_requests_id),
    );