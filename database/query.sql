create database btvn1;

use btvn1;

CREATE TABLE post (
   id int PRIMARY KEY AUTO_INCREMENT,
   title varchar(250) NOT NULL,
   content text NOT NULL,
   created datetime DEFAULT CURRENT_TIMESTAMP,
   author varchar(100) NOT NULL,
   category set('Sport','Politics','Health','Tourism','Economy','Education','Technology','Science') NOT NULL,
   is_published BOOLEAN
 );

INSERT INTO Post (title, content, author, category)
VALUES ('Invalid Category', 'This post...', 'Jane Doe', 'Economy');


CREATE TABLE product (
   id int PRIMARY KEY AUTO_INCREMENT,
   name varchar(300) NOT NULL,
   description text NOT NULL,
   manufacturer varchar(250) NOT NULL,
   unit_price decimal(10,2) NOT NULL,
   category set('Quần áo','Mỹ phẩm','Đồ chơi','Dụng cụ học tập','Máy tính','Di động','Điện tử dân dụng','Văn phòng') NOT NULL
);

INSERT INTO Product (name, description, manufacturer, unit_price, category)
VALUES 
('Laptop', 'A laptop for gaming', 'Dell', 1200, 'Máy tính');