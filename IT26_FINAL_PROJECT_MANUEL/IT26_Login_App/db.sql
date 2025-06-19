CREATE DATABASE login_app_db;
USE login_app_db;

CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE activity_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    activity VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

INSERT INTO roles (role_name) VALUES ('Administrator'), ('User');
INSERT INTO users (username, password, role_id)
VALUES ('admin', SHA2('admin', 256), 1),
       ('user1', SHA2('user1', 256), 2);
