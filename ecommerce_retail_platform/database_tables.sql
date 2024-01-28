--Eccommerce Retail Platform
CREATE TABLE
    parent_category (
        parent_category_id SERIAL PRIMARY KEY,
        parent_category_name VARCHAR(225),
    );

CREATE TABLE
    category (
        category_id SERIAL PRIMARY KEY,
        category_name VARCHAR(225),
        parent_category INT REFERENCES parent_category (parent_category_id),
    );

CREATE TABLE
    product_catalog (
        product_id SERIAL PRIMARY KEY,
        product_name VARCHAR(225),
        category INT REFERENCES category (category_id),
        price INT stock_level VARCHAR,
        product_description TEXT NULL
    );

CREATE TABLE
    customer_profiles (
        customer_id SERIAL PRIMARY KEY,
        customer_name VARCHAR(225),
        customer_address JSON phone VARCHAR(225),
        email VARCHAR(225),
        registration_date DATE
    );

CREATE TABLE
    order_details (
        order_id SERIAL PRIMARY KEY,
        customer INT REFERENCES customer (customer_id),
        order_date DATE,
        total_amount INT,
        order_status VARCHAR(25) CHECK (
            order_status IN ('Pending', 'Shipped', 'Delivered')
        ),
    );

CREATE TABLE
    order_item (
        order_item_id SERIAL PRIMARY KEY,
        order_id INT REFERENCES order (order_id),
        product_id INT REFERENCES product (product_id),
        quantity INT,
        price_per_unit INT
    );

CREATE TABLE
    shipping (
        shipping_id SERIAL PRIMARY KEY,
        order_id INT REFERENCES order (order_id),
        product_id INT REFERENCES product (product_id),
        shipping_method VARCHAR,
        tracking_number INT,
        delivery_status VARCHAR estimated_delivery_date DATE
    );