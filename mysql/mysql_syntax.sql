-- MySQL

-- Không phân biệt chữ hoa và chữ thường "select" & "SELECT"
-- Sử dụng chữ HOA
-- Dùng dấu chấm phẩy ";" để kết thúc dòng

-- Tạo CSDL / DB / Database
CREATE DATABASE IF NOT EXISTS demo_database;

-- Xóa CSDL / DB / Database
DROP DATABASE IF EXISTS demo_database;

-- Chọn DATABASE để thao tác
USE demo_database;

-- TABLE
-- Tạo TABLE
CREATE TABLE IF NOT EXISTS users (
    user_id INT,
    full_name VARCHAR(100),
    email VARCHAR(50),
    age INT,
    avatar VARCHAR(50),
    birth_day DATE,
    is_active BOOLEAN
)

-- Đổi tên TABLE
RENAME TABLE IF NOT EXISTS users TO users_new;

-- Xóa TABLE
DROP TABLE IF EXISTS users;

-- Xóa dữ liệu bên trong TABLE
TRUNCATE TABLE users;

-- ALTER TABLE
-- Thêm một cột vào TABLE
ALTER TABLE users
ADD password VARCHAR(8)

-- Xóa một cột trong table
ALTER TABLE users
DROP COLUMN avatar;

-- Đổi tên cột trong table
-- Lưu ý : Hỗ trợ cho phiên bản SQL 8.0 trở lên
ALTER TABLE users
RENAME COLUMN full_name TO fullName;
-- Lưu ý : Hỗ trợ cho phiên bản SQL cũ hơn
CHANGE full_name fullName VARCHAR(100);

-- Sửa đổi kiểu dữ liệu của cột trong table
ALTER TABLE users
MODIFY COLUMN email INT;

-- RÀNG BUỘC
-- NOT NULL: Cột không được NULL, phải có dữ liệu
-- UNIQUE : Giá trị trong cột phải khác nhau, duy nhất (id, email, username, ...)
-- PRIMARY KEY : Kết hợp của NOT NULL và UNIQUE, (id), 1 table nên có primary key
-- FOREIGN KEY : Tạo liên kết giữa các table với nhau
-- DEFAULT : Đặt giá trị mặc định cho một cột
-- CREATE INDEX : Đánh chỉ mục, lấy chỉ mục nhanh hơn

-- NOT NULL với CREATE TABLE
CREATE TABLE not_null (
	id INT NOT NULL,
	age INT
);

-- NOT NULL với ALTER TABLE
ALTER TABLE not_null
MODIFY age INT NOT NULL;

-- UNIQUE với CREATE TABLE
CREATE TABLE `unique` (
-- C1. Chỉ định UNIQUE ngay tại lúc tạo
	unique_id INT NOT NULL UNIQUE,
	
-- C2. Tạo cột trước rồi chỉ định UNIQUE sau
	email VARCHAR(50),
	facebook_id VARCHAR(20),
	google_id VARCHAR(20),
	zalo_id VARCHAR(20),
	
	tele_id VARCHAR(20),
	github_id VARCHAR(20),
	
	UNIQUE (email),
-- C3. Sử dụng CONSTRAINT
	CONSTRAINT UC_unique UNIQUE (facebook_id, google_id)
);

-- C4. UNIQUE với ALTER TABLE
ALTER TABLE `unique`
ADD UNIQUE (zalo_id)

-- C5. Kết hợp giữa ALTER TABLE và CONSTRAINT
ALTER TABLE `unique`
ADD CONSTRAINT UC_unique_2 UNIQUE (tele_id, github_id)

-- Xóa UNIQUE
ALTER TABLE `unique`
DROP INDEX UC_unique_2;

-- PRIMARY KEY với CREATE TABLE
CREATE TABLE primary_key (
-- C1. Chỉ định PRIMARY KEY ngay tại lúc tạo
	primary_key_id INT PRIMARY KEY,
	
	facebook_id VARCHAR(20),
	google_id VARCHAR(20),
	zalo_id VARCHAR(20),
	
	tele_id VARCHAR(20),
	github_id VARCHAR(20),
	discord_id VARCHAR (20),
	
-- C2. Tạo cột trước rồi chỉ định PRIMARY KEY sau
	PRIMARY KEY (facebook_id),
	
-- C3. Sử dụng CONSTRAINT
	CONSTRAINT PK_primary_key PRIMARY KEY (google_id, zalo_id)
);

-- C4. PRIMARY KEY với ALTER TABLE
ALTER TABLE primary_key
ADD PRIMARY KEY (tele_id);

-- C5. Kết hợp giữa ALTER TABLE và CONSTRAINT
ALTER TABLE primary_key
ADD CONSTRAINT PK_primary_key PRIMARY KEY (google_id, zalo_id)




