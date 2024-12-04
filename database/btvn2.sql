create database btvn2;

use btvn2;

// bài 1

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    referee_id INT NULL
);

INSERT INTO Customer (name, referee_id)
VALUES ('Will', NULL),
       ('Jane', NULL),
       ('Alex', 2),
       ('Bill', NULL),
       ('Zack', 1),
       ('Mark', 2);

SELECT *
FROM Customer
WHERE referee_id = 1 or referee_id IS NULL;

//Bài 2

CREATE TABLE Customer2 (
    product_id INT PRIMARY KEY auto_increment,
    low_fats ENUM('Y', 'N') NOT NULL,
    recyclable ENUM('Y', 'N') NOT NULL
);

INSERT INTO Customer2 (low_fats, recyclable)
VALUES ('Y', 'N'),
       ('Y', 'Y'),
       ('N', 'Y'),
       ('Y', 'Y'),
       ('N', 'N');

SELECT product_id
FROM Customer2
WHERE low_fats = 'Y' and recyclable = 'Y';

// bài 3

CREATE TABLE Tweets (
    tweet_id  INT PRIMARY KEY auto_increment,
    content text not null
);

INSERT INTO Tweets (content)
VALUES ('Let us Code'),
       ('More than fifteen chars are here!');

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;

//bài 4

CREATE TABLE Salary (
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(100),
    sex ENUM('m', 'f'),
    salary INT
);

INSERT INTO Salary (name, sex, salary)
VALUES
    ('A', 'm', 2500),
    ('B', 'f', 1500),
    ('C', 'm', 5500),
    ('D', 'f', 500);

SET SQL_SAFE_UPDATES = 0;

UPDATE Salary
SET sex = CASE
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END;

// bài 5

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

INSERT INTO Product (product_id, product_name)
VALUES
    (100, 'Nokia'),
    (200, 'Apple'),
    (300, 'Samsung');

// bài 6

CREATE TABLE Sales (
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    year INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Sales (sale_id, product_id, year, quantity, price)
VALUES
    (1, 100, 2008, 10, 5000),
    (2, 100, 2009, 12, 5000),
    (7, 200, 2011, 15, 9000);

SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
  ON s.product_id = p.product_id;

CREATE TABLE Views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

INSERT INTO Views (article_id, author_id, viewer_id, view_date)
VALUES
    (1, 3, 5, '2019-08-01'),
    (1, 3, 6, '2019-08-02'),
    (2, 7, 7, '2019-08-01'),
    (2, 7, 6, '2019-08-02'),
    (4, 7, 1, '2019-07-22'),
    (3, 4, 4, '2019-07-21'),
    (3, 4, 4, '2019-07-21');

SELECT DISTINCT author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
