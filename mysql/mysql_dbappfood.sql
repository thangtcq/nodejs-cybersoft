-- Kiểm tra version
SELECT VERSION();

-- Xóa CSDL / DB / Database
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sub_foods;
DROP TABLE IF EXISTS foods;
DROP TABLE IF EXISTS food_types;
DROP TABLE IF EXISTS rate_res;
DROP TABLE IF EXISTS like_res;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS users;

-- Tạo CSDL / DB / Database
-- AUTO INCREMENT : tự động tăng, đảm bảo cột khóa chính luôn luôn là duy nhất, và không trùng nhau
CREATE TABLE IF NOT EXISTS users (
	user_id INT AUTO_INCREMENT,
	full_name VARCHAR (100) NOT NULL,
	email VARCHAR (50) NOT NULL,
	password VARCHAR (20) NOT NULL,
	
	PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS restaurants (
	res_id INT AUTO_INCREMENT,
	res_name VARCHAR (100) NOT NULL,
	image VARCHAR (50),
	description VARCHAR (500),
	
	PRIMARY KEY (res_id)
);

CREATE TABLE IF NOT EXISTS like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME NOT NULL,
	
	PRIMARY KEY (user_id, res_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants (res_id)
);

CREATE TABLE IF NOT EXISTS rate_res (
	user_id INT,
	res_id INT,
	amount INT NOT NULL,
	date_rate DATETIME NOT NULL,
	
	PRIMARY KEY (user_id, res_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants (res_id)
);

CREATE TABLE IF NOT EXISTS food_types (
	type_id INT AUTO_INCREMENT,
	type_name VARCHAR (20) NOT NULL,
	
	PRIMARY KEY (type_id)
);

CREATE TABLE IF NOT EXISTS foods (
	food_id INT AUTO_INCREMENT,
	food_name VARCHAR (50) NOT NULL,
	image VARCHAR (50),
	price FLOAT NOT NULL,
	description VARCHAR (500),
	type_id INT NOT NULL,
	
	PRIMARY KEY (food_id),
	FOREIGN KEY (type_id) REFERENCES food_types (type_id)
);

CREATE TABLE IF NOT EXISTS sub_foods (
	sub_id INT AUTO_INCREMENT,
	sub_name VARCHAR (50) NOT NULL,
	sub_price FLOAT NOT NULL,
	food_id INT NOT NULL,
	
	PRIMARY KEY (sub_id),
	FOREIGN KEY (food_id) REFERENCES foods (food_id)
);

CREATE TABLE IF NOT EXISTS orders (
	user_id INT,
	food_id INT,
	amount INT NOT NULL,
	code VARCHAR (10) NOT NULL,
	arr_sub_id VARCHAR (50) NOT NULL,
	
	PRIMARY KEY (user_id, food_id),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (food_id) REFERENCES foods (food_id)
);

-- Thêm dữ liệu
INSERT INTO users (user_id, full_name, email, password) VALUES
(1, "Steve Jobs", "stevejobs@gmail.com", "1234"),
(2, "Mike Markkula", "mikemarkkula@gmail.com", "1234"),
(3, "Steve Wozniak", "stevemozniak@gmail.com", "1234"),
(4, "Ronald Wayne", "ronaldwayne@gmail.com", "1234"),
(5, "Alice Robertson", "alicerobertson@gmail.com", "1234"),
(6, "Candice Clark", "candiceclark@gmail.com", "1234"),
(7, "Suzanne Mulkern", "suzannemulkern@gmail.com", "1234"),
(8, "Janet Hill", "janethill@gmail.com", "1234");

INSERT INTO restaurants (res_id, res_name, image, description) VALUES
(1, "1056 Hậu Giang", "1056-hau-giang.jpg", "1056 Hậu Giang, Hồ Chí Minh"),
(2, "111-113 Bình Phú", "111-113-binh-phu.jpg", "111-113 Bình Phú, Hồ Chí Minh"),
(3, "178 Hậu Giang", "178-hau-giang.jpg", "178 Hậu Giang, Hồ Chí Minh");

INSERT INTO like_res (user_id, res_id, date_like) VALUES
(4, 2, "2024-02-19 16:10:53"),
(5, 3, "2024-07-09 14:33:03"),
(8, 2, "2024-02-28 12:03:40"),
(2, 2, "2024-01-10 17:06:44"),
(7, 1, "2024-08-17 16:41:27"),
(2, 3, "2024-03-28 16:35:05"),
(5, 2, "2024-02-11 01:03:32"),
(5, 1, "2024-01-19 10:29:21"),
(3, 2, "2024-07-20 17:00:30"),
(3, 1, "2024-01-09 05:44:49"),
(8, 3, "2024-08-27 23:25:54"),
(4, 1, "2024-03-26 07:32:45"),
(4, 3, "2024-05-02 01:19:24");

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(7, 1, 2, "2024-08-15 09:34:54"),
(7, 3, 3, "2024-07-24 13:15:47"),
(8, 3, 3, "2024-04-19 15:10:43"),
(2, 1, 1, "2024-02-10 05:35:03"),
(4, 2, 2, "2024-03-19 23:59:05"),
(5, 2, 5, "2024-06-22 18:49:12"),
(5, 1, 4, "2024-01-10 09:52:01"),
(7, 2, 2, "2024-04-14 09:02:53"),
(5, 3, 3, "2024-09-09 06:42:08"),
(4, 3, 2, "2024-01-20 20:43:59"),
(3, 1, 1, "2024-01-26 10:07:05"),
(2, 3, 5, "2024-09-18 15:31:10");

INSERT INTO food_types (type_id, type_name) VALUES
(1, "Cà Phê Highlight"),
(2, "Cà Phê Việt Nam");

INSERT INTO foods (food_id, food_name, image, price, description, type_id) VALUES
(1, "Trà Xanh Espresso Marble", "tra-xanh-espresso-marble.jpg", "49000","Cho ngày thêm tươi, tỉnh, êm, mượt với Trà Xanh Espresso Marble. Đây là sự mai mối bất ngờ giữa trà xanh Tây Bắc vị mộc và cà phê Arabica Đà Lạt. Muốn ngày thêm chút highlight, nhớ tìm đến sự bất ngờ này bạn nhé!", 1),
(2, "Bơ Arabica", "bo-arabica.jpg", "49000","Bơ sáp Đắk Lắk dẻo quẹo hòa quyện cùng Cà phê Arabica Cầu Đất êm mượt. Khuấy đều để thưởng thức hương vị tươi tỉnh, đầy mới lạ!", 2),
(3, "Đường Đen Sữa Đá", "duong-den-sua-da.jpg", "45000","Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng.", 2),
(4, "The Coffee House Sữa Đá", "the-coffee-house-sua-da.jpg", "39000","Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị", 2),
(5, "Cà Phê Sữa Đá", "ca-phe-sua-da.jpg", "29000","Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.", 2),
(6, "Cà Phê Sữa Nóng", "ca-phe-sua-nong.jpg", "39000","Cà phê được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.", 2),
(7, "Bạc Sỉu", "bac-siu.jpg", "29000","Bạc sỉu chính là 'Ly sữa trắng kèm một chút cà phê'. Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.", 2),
(8, "Bạc Sỉu Nóng", "bac-siu-nong.jpg", "39000","Bạc sỉu chính là 'Ly sữa trắng kèm một chút cà phê'. Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.", 2),
(9, "Cà Phê Đen Đá", "ca-phe-den-da.jpg", "29000","Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.", 2),
(10, "Cà Phê Đen Nóng", "ca-phe-den-nong.jpg", "39000","Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.", 2);

INSERT INTO sub_foods (sub_id, sub_name, sub_price, food_id) VALUES
(1, "Sốt Caramel", 10000, 1),
(2, "Shot Espresso", 10000, 1),
(3, "Trân Châu Trắng", 10000, 1),
(4, "Đào Miếng", 10000, 2),
(5, "Sốt Caramel", 10000, 2),
(6, "Trái Vải", 10000, 2),
(7, "Shot Espresso", 10000, 2),
(8, "Trân Châu Trắng", 10000, 2),
(9, "Sốt Caramel", 10000, 3),
(10, "Shot Espresso", 10000, 3),
(11, "Trân Châu Trắng", 10000, 3),
(12, "Sốt Caramel", 10000, 4),
(13, "Shot Espresso", 10000, 4),
(14, "Trân Châu Trắng", 10000, 4),
(15, "Sốt Caramel", 10000, 5),
(16, "Shot Espresso", 10000, 5),
(17, "Trân Châu Trắng", 10000, 5),
(18, "Sốt Caramel", 10000, 6),
(19, "Shot Espresso", 10000, 6),
(20, "Trân Châu Trắng", 10000, 6),
(21, "Sốt Caramel", 10000, 7),
(22, "Shot Espresso", 10000, 7),
(23, "Trân Châu Trắng", 10000, 7),
(24, "Sốt Caramel", 10000, 8),
(25, "Shot Espresso", 10000, 8),
(26, "Trân Châu Trắng", 10000, 8),
(27, "Sốt Caramel", 10000, 9),
(28, "Shot Espresso", 10000, 9),
(29, "Trân Châu Trắng", 10000, 9),
(30, "Sốt Caramel", 10000, 10),
(31, "Shot Espresso", 10000, 10),
(32, "Trân Châu Trắng", 10000, 10);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(2, 9, 49000, "PROMO82573", "[27, 29]"),
(5, 1, 59000, "PROMO21867", "[1]"),
(7, 7, 39000, "PROMO72864", "[23]"),
(5, 6, 49000, "PROMO18550", "[20]"),
(7, 4, 49000, "PROMO38601", "[12]"),
(5, 7, 49000, "PROMO91336", "[21, 22]"),
(2, 10, 39000, "PROMO12084", "[]"),
(7, 5, 39000, "PROMO76270", "[15]"),
(4, 6, 59000, "PROMO62913", "[19, 20]"),
(7, 10, 49000, "PROMO82026", "[32]"),
(2, 7, 59000, "PROMO18730", "[21, 22, 23]"),
(2, 4, 49000, "PROMO36796", "[13]"),
(5, 9, 39000, "PROMO97228", "[29]"),
(2, 2, 69000, "PROMO69461", "[4, 8]");

-- Truy vấn
-- B1. FROM : sẽ chạy trước
-- B2. SELECT : chỉ định kết quả đổ ra
SELECT *
FROM users;

-- Muốn chỉ định chỉ có 2 cột fullname và email đổ ra
SELECT full_name, email
FROM users;

SELECT full_name AS "Họ và tên", email AS "email"
FROM users;

-- LIMIT : giới hạn số dòng
SELECT *
FROM users
LIMIT 2;

-- WHERE : lọc dữ liệu
SELECT *
FROM users
WHERE user_id = 2;

-- 1 - 1 (ONE - to - ONE)
-- Mô tả: Một bản ghi trong bảng A sẽ chỉ liên kết tới một bản ghi trong bảng B

-- 1 - N (ONE - to - MANY)
-- Mô tả: Một bản ghi trong bảng A có thể có nhiều bản ghi tương ứng bên trong bảng B

-- N - N (MANY - to - MANY)
-- Mô tả: Một bản ghi trong bảng A có thể liên kết nhiều với bản ghi bên bảng B, và ngược lại

-- INNER JOIN
SELECT *
FROM orders
INNER JOIN users ON users.user_id = orders.user_id;

-- TH1. Bảng có số lượng hàng bằng nhau
-- Lấy bảng ở FROM làm chuẩn để so sánh

-- TH2. Bảng có số lượng hàng chênh lệch
-- Lấy bảng có số lượng hàng ít hơn làm chuẩn để so sánh

-- LEFT JOIN: sẽ lấy tất cả các bản ghi bên TRÁI, ngay cả khi không có bản ghi khớp với bản ghi bên PHẢI
SELECT *
FROM users
LEFT JOIN orders
ON orders.user_id = users.user_id;

-- RIGHT JOIN : sẽ lấy tất cả các bản ghi bên PHẢI, ngay cả khi không có bản ghi khớp với bản ghi bên TRÁI
SELECT *
FROM orders
RIGHT JOIN users
ON orders.user_id = users.user_id;

-- CROSS JOIN : sẽ lấy tất cả
SELECT *
FROM orders
CROSS JOIN users;

-- GROUP BY : sẽ nhóm những dữ liệu giống nhau và thường được sử dụng với COUNT(), MAX(), MIN(), SUM(), AVG()
-- COUNT : sẽ đếm số lượng trong lúc nhóm (GROUP BY)
SELECT users.user_id, users.full_name, users.password, COUNT(orders.user_id) AS "order"
FROM users
INNER JOIN orders
ON orders.user_id = users.user_id
GROUP BY users.user_id;

-- ORDER BY : sắp xếp
-- ASC: sắp xếp tăng dần
-- DESC: sắp xếp giảm dần
SELECT users.user_id, users.full_name, users.password, COUNT(orders.user_id) AS "order"
FROM users
INNER JOIN orders
ON orders.user_id = users.user_id
GROUP BY users.user_id
ORDER BY users.user_id DESC;

-- BÀI TẬP
-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT like_res.user_id AS "Mã khách hàng", users.full_name AS "Họ và tên", COUNT(like_res.user_id) AS "Số lần like"
FROM like_res
INNER JOIN users
ON users.user_id = like_res.user_id
GROUP BY like_res.user_id
ORDER BY COUNT(like_res.user_id) DESC
LIMIT 5;

-- Tìm 2 nhà hàng có số lượng like nhiều nhất
SELECT like_res.res_id AS "Mã nhà hàng", restaurants.res_name AS "Tên nhà hàng", COUNT(like_res.res_id) AS "Số lượng like"
FROM like_res
INNER JOIN restaurants
ON restaurants.res_id = like_res.res_id
GROUP BY like_res.res_id
ORDER BY COUNT(like_res.res_id) DESC
LIMIT 2;

-- Tìm người dùng đã đặt hàng nhiều nhất
SELECT orders.user_id AS "Mã khách hàng", users.full_name AS "Họ và tên", COUNT(orders.user_id) AS "Số lần đặt"
FROM orders
INNER JOIN users
ON users.user_id = orders.user_id
GROUP BY orders.user_id
ORDER BY COUNT(orders.user_id) DESC
LIMIT 1;

-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)
SELECT users.user_id AS "Mã khách hàng", users.full_name AS "Họ và tên"
FROM users
LEFT JOIN like_res
ON users.user_id = like_res.user_id
LEFT JOIN orders
ON users.user_id = orders.user_id
LEFT JOIN rate_res
ON users.user_id = rate_res.user_id
WHERE like_res.user_id IS NULL
AND rate_res.user_id IS NULL
AND orders.user_id IS NULL;

-- Tìm thức ăn có lượt mua nhiều nhất
SELECT foods.food_id AS "Mã sản phẩm", foods.food_name AS "Tên sản phẩm", COUNT(orders.food_id) AS "Số lần được mua"
FROM orders
INNER JOIN foods
ON orders.food_id = foods.food_id
GROUP BY orders.food_id
ORDER BY COUNT(orders.food_id) DESC
LIMIT 1
