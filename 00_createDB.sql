CREATE user 'swcamp'@'%' IDENTIFIED BY 'swcamp';
SELECT * FROM user;

CREATE DATABASE menudb;

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

SHOW GRANTS FOR 'swcamp'@'%';