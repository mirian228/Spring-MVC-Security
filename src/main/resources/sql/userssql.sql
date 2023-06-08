CREATE DATABASE user_directory;
USE user_directory;
CREATE TABLE users (
	username varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    enabled TINYINT(1) NOT NULL,
	PRIMARY KEY(username)
) Engine=InnoDB charset=utf8mb4;

INSERT INTO users VALUES 
	('john', '{noop}test123', 1),
    ('mary', '{noop}test123', 1),
    ('susan', '{noop}test123', 1);

ALTER TABLE users MODIFY COLUMN password varchar(68) NOT NULL;
CREATE TABLE authorities (

	username varchar(50) NOT NULL,
    authority varchar(50) NOT NULL,
    UNIQUE KEY authorities_idx_1 (username, authority),
    CONSTRAINT authorities_ibfk_1
    
    FOREIGN KEY (username) REFERENCES users(username)

) Engine=InnoDB charset=utf8mb4;

INSERT INTO authorities VALUES 
		('john', 'ROLE_EMPLOYEE'),
        ('mary', 'ROLE_EMPLOYEE'),
        ('mary', 'ROLE_MANAGER'),
        ('susan', 'ROLE_EMPLOYEE'),
        ('susan', 'ROLE_MANAGER'),
        ('susan', 'ROLE_ADMIN');

        
       