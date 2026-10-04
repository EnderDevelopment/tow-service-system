CREATE TABLE IF NOT EXISTS tow_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    vehicle_plate VARCHAR(10) NOT NULL,
    location_x FLOAT NOT NULL,
    location_y FLOAT NOT NULL,
    location_z FLOAT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tow_prices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_type VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO tow_prices (vehicle_type, price) VALUES
    ('car', 500),
    ('truck', 700),
    ('van', 600);