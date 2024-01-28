CREATE TABLE
    member (
        member_id SERIAL PRIMARY KEY phone VARCHAR(225),
        email VARCHAR(225),
        member_address VARCHAR(225),
        registration_date DATE,
        membership_status VARCHAR(25) CHECK (
            membership_status IN ('Active', 'Suspended', 'Expired')
        ),
    );

CREATE TABLE
    genre (
        genre_id SERIAL PRIMARY KEY,
        genre_name VARCHAR(225),
    );

-- Create books table 
CREATE TABLE
    book (
        book_id SERIAL PRIMARY KEY,
        title VARCHAR(225),
        author VARCHAR(225),
        genre INT REFERENCES genre (genre_id),
        isbn UNIQUE BIGINT,
        availability_status VARCHAR(25) CHECK (
            availability_status IN ('Available', 'Borrowed', 'Under Maintenance')
        ),
        publication_year INT,
    );

CREATE TABLE
    loan_records (
        loan_records_id SERIAL PRIMARY KEY,
        book_id INT REFERENCES book (book_id),
        member_id INT REFERENCES member (member_id),
        checkout_date DATE,
        due_date DATE,
        return_date DATE,
    );

CREATE TABLE
    events_scheduling (
        events_scheduling_id SERIAL PRIMARY KEY,
        event_name VARCHAR(225),
        event_description TEXT,
        event_location VARCHAR(225),
    );

CREATE TABLE
    event_registration (
        events_registration_id SERIAL PRIMARY KEY,
        events_scheduling_id INT REFERENCES events_scheduling (events_scheduling_id),
        member_id INT REFERENCES member (member_id),
    );