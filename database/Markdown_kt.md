Phạm Thị Hồng Huệ
Link DB: https://dbdiagram.io/d/676d69eb5406798ef7b1decc
[.gitignore](.idea%2F.gitignore)

Phần A: 10 Câu Hỏi Truy Vấn (SELECT)
### Câu 1
**Đề bài:** Liệt kê danh sách User kèm tổng số Appointment mà mỗi User đã đặt.

Hiển thị các cột:
- `User.id`, `username`, `email`, `phone`.
- Tổng số Appointments (nếu chưa có, hiển thị 0).
- Sắp xếp danh sách theo số lượng Appointment giảm dần.
```
SELECT 
    u.id AS user_id, 
    u.username, 
    u.email, 
    u.phone, 
    COUNT(a.id) AS total_appointments 
FROM 
    User u 
LEFT JOIN 
    Appointment a 
ON 
    u.id = a.user_id 
GROUP BY 
    u.id, u.username, u.email, u.phone 
ORDER BY 
    total_appointments DESC;
```
### Câu 2
**Đề bài:**
Liệt kê thông tin Appointment (bao gồm cả Service và Package) của từng User, kèm ngày hẹn (appointment_date).

Các cột hiển thị:
Appointment.id, User.full_name, Service.name (nếu có), Package.name (nếu có), appointment_date, status.

```
SELECT 
    a.id AS appointment_id, 
    u.full_name, 
    s.name AS service_name, 
    p.name AS package_name, 
    a.appointment_date, 
    a.status
FROM 
    Appointment a
LEFT JOIN 
    User u ON a.user_id = u.id
LEFT JOIN 
    Service s ON a.service_id = s.id
LEFT JOIN 
    Package p ON a.package_id = p.id;
```
### Câu 3
**Đề bài:**
Thống kê Service theo từng category, tính giá trung bình (AVG price) và số lượng Service trong mỗi category.

Hiển thị:
category, Số dịch vụ, Giá trung bình (AVG price)
```
SELECT 
    category, 
    COUNT(id) AS service_count, 
    AVG(price) AS avg_price
FROM 
    Service
GROUP BY 
    category;
```
### Câu 4
**Đề bài:**
Liệt kê các Package có giá từ 1 triệu (1000000) trở lên (hoặc một ngưỡng tùy ý), kèm mô tả description và danh sách services (lưu trong cột services).

Các cột hiển thị:
- Package.id, name, price, description, services.
- Sắp xếp giảm dần theo price.
```
SELECT 
    id, 
    name, 
    price, 
    description, 
    services
FROM 
    Package
WHERE 
    price >= 1000000
ORDER BY 
    price DESC;

```
### Câu 5
**Đề bài:**
Hiển thị thông tin TestDetails và User đặt hẹn (thông qua Appointment).

Các cột:
- TestDetails.id, test_type, sample_time, request_note,
- User.username (hoặc full_name) từ Appointment.user_id.
- Sắp xếp theo created_at mới nhất trước (của TestDetails).
```
SELECT 
    td.id AS testdetails_id, 
    td.test_type, 
    td.sample_time, 
    td.request_note, 
    u.username AS user_name
FROM 
    TestDetails td
JOIN 
    Appointment a ON td.appointment_id = a.id
JOIN 
    User u ON a.user_id = u.id
ORDER BY 
    td.created_at DESC;
```
### Câu 6
**Đề bài:**
Lấy danh sách TestResult, kèm thông tin User và Service/Package trong Appointment.

Các cột:
- TestResult.id, result, result_file, result_date,
- User.full_name (hoặc username),
- Service.name (hoặc Package.name nếu muốn hiển thị cả hai).
- Sắp xếp theo result_date giảm dần.
```
SELECT 
    tr.id AS testresult_id, 
    tr.result, 
    tr.result_file, 
    tr.result_date, 
    u.full_name AS user_name, 
    s.name AS service_name, 
    p.name AS package_name
FROM 
    TestResult tr
JOIN 
    Appointment a ON tr.appointment_id = a.id
JOIN 
    User u ON a.user_id = u.id
LEFT JOIN 
    Service s ON a.service_id = s.id
LEFT JOIN 
    Package p ON a.package_id = p.id
ORDER BY 
    tr.result_date DESC;

```
### Câu 7
**Đề bài:**
Thống kê Expert theo từng specialty, kèm số lượng Expert ở mỗi chuyên môn đó.

Các cột hiển thị:
- specialty, Số lượng Expert
- Chỉ tính những Expert đã có appointment_id (tức là appointment_id không NULL).
```
SELECT 
    specialty, 
    COUNT(id) AS expert_count
FROM 
    Expert
WHERE 
    appointment_id IS NOT NULL
GROUP BY 
    specialty;

```
### Câu 8
**Đề bài:**
Liệt kê các bài Article, kèm tên tác giả (User.full_name), chỉ lấy những bài đã published_at (tức published_at IS NOT NULL).

Các cột hiển thị:
- Article.id, title, content, category, published_at, User.full_name (hoặc username).
- Sắp xếp theo published_at giảm dần (mới nhất trước).
```
SELECT 
    a.id AS article_id, 
    a.title, 
    a.content, 
    a.category, 
    a.published_at, 
    u.full_name AS author_name
FROM 
    Article a
JOIN 
    User u ON a.author_id = u.id
WHERE 
    a.published_at IS NOT NULL
ORDER BY 
    a.published_at DESC;

```
### Câu 9
**Đề bài:**
Liệt kê Notification của từng User, hiển thị nội dung thông báo (content) và trạng thái (is_read).

Các cột hiển thị:
- Notification.id, User.username, Notification.content, Notification.is_read, Notification.created_at.
- Chỉ lấy các Notification chưa đọc (is_read = false).
```
SELECT 
    n.id AS notification_id, 
    u.username, 
    n.content, 
    n.is_read, 
    n.created_at
FROM 
    Notification n
JOIN 
    User u ON n.user_id = u.id
WHERE 
    n.is_read = false;

```
### Câu 10
**Đề bài:**
Liệt kê thông tin Billing, kèm tổng tiền (total_amount) và phương thức thanh toán (payment_status), cùng User.full_name.

Các cột hiển thị:
- Billing.id, User.full_name, appointment_id, total_amount, payment_status, payment_date.
- Sắp xếp theo payment_date mới nhất trước.
```
SELECT 
    b.id AS billing_id, 
    u.full_name, 
    b.appointment_id, 
    b.total_amount, 
    b.payment_status, 
    b.payment_date
FROM 
    Billing b
JOIN 
    User u ON b.user_id = u.id
ORDER BY 
    b.payment_date DESC;

```
Phần B: 5 Câu Hỏi Về Trigger
### Trigger 1
**Đề bài:**
Khi thêm mới (INSERT) một User, tự động cập nhật created_at thành thời điểm hiện tại (nếu chưa được gán).

Gợi ý: BEFORE INSERT trigger, kiểm tra NEW.created_at.
```
DELIMITER //
CREATE TRIGGER before_insert_user
BEFORE INSERT ON User
FOR EACH ROW
BEGIN
    IF NEW.created_at IS NULL THEN
        SET NEW.created_at = NOW();
    END IF;
END;
//
DELIMITER ;

```
### Trigger 2
**Đề bài:**
Không cho phép tạo Appointment ở quá khứ. Tức là, nếu appointment_date < NOW(), thì báo lỗi (hoặc rollback).

Gợi ý: BEFORE INSERT trigger trên bảng Appointment.
```
DELIMITER //
CREATE TRIGGER before_insert_appointment
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.appointment_date < NOW() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Appointment date cannot be in the past.';
    END IF;
END;
//
DELIMITER ;

```
### Trigger 3
**Đề bài:**
Khi xoá một Appointment, xoá luôn các TestDetails, Expert, TestResult liên quan (nếu có).

Gợi ý: AFTER DELETE trigger trên Appointment.

Lần lượt xoá TestDetails (appointment_id), Expert, TestResult.
```
DELIMITER //
CREATE TRIGGER after_delete_appointment
AFTER DELETE ON Appointment
FOR EACH ROW
BEGIN
    DELETE FROM TestDetails WHERE appointment_id = OLD.id;

    DELETE FROM Expert WHERE appointment_id = OLD.id;

    DELETE FROM TestResult WHERE appointment_id = OLD.id;
END;
//
DELIMITER ;

```
### Trigger 4
**Đề bài:**
Kiểm tra trước khi thêm Service: nếu price <= 0 thì báo lỗi “Giá dịch vụ phải lớn hơn 0”.

Gợi ý: BEFORE INSERT trigger trên bảng Service.
```
DELIMITER //
CREATE TRIGGER before_insert_service
BEFORE INSERT ON Service
FOR EACH ROW
BEGIN
    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Service price must be greater than 0.';
    END IF;
END;
//
DELIMITER ;

```
### Trigger 5
**Đề bài:**
Khi thêm Billing, nếu payment_status = 'Paid' thì tự động đặt payment_date = NOW().

Gợi ý: BEFORE INSERT hoặc BEFORE UPDATE trên bảng Billing.
```
DELIMITER //
CREATE TRIGGER before_insert_or_update_billing
BEFORE INSERT ON Billing
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'Paid' THEN
        SET NEW.payment_date = NOW();
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_billing
BEFORE UPDATE ON Billing
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'Paid' AND OLD.payment_status != 'Paid' THEN
        SET NEW.payment_date = NOW();
    END IF;
END;
//
DELIMITER ;

```
Phần C: 5 Câu Hỏi Về Stored Procedure
### SP 1
**Đề bài:**
Viết thủ tục thêm mới User với các tham số:

- p_username, p_password, p_full_name, p_email, p_phone, v.v.
- Nếu không truyền p_role => Mặc định 'user'.
- Khi INSERT, tự động set created_at = NOW().
```
DELIMITER //
CREATE PROCEDURE add_user(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_full_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_phone VARCHAR(255),
    IN p_address TEXT,
    IN p_date_of_birth DATE,
    IN p_gender VARCHAR(10),
    IN p_role VARCHAR(20) DEFAULT 'user'
)
BEGIN
    INSERT INTO User (
        username, password, full_name, email, phone, address, 
        date_of_birth, gender, role, created_at
    ) 
    VALUES (
        p_username, p_password, p_full_name, p_email, p_phone, p_address, 
        p_date_of_birth, p_gender, p_role, NOW()
    );
END;
//
DELIMITER ;

```
### SP 2
**Đề bài:**
Tạo thủ tục cập nhật thông tin Service (giá price, mô tả description, v.v.) dựa vào id.

Tham số: p_service_id, p_name, p_price, p_description, p_category, p_duration.

Thực hiện UPDATE bảng Service.

Cập nhật updated_at = NOW().
```
DELIMITER //
CREATE PROCEDURE update_service(
    IN p_service_id INT,
    IN p_name VARCHAR(255),
    IN p_price DECIMAL(10, 2),
    IN p_description TEXT,
    IN p_category VARCHAR(50),
    IN p_duration INT
)
BEGIN
    UPDATE Service
    SET 
        name = p_name,
        price = p_price,
        description = p_description,
        category = p_category,
        duration = p_duration,
        updated_at = NOW()
    WHERE id = p_service_id;
END;
//
DELIMITER ;

```
### SP 3
**Đề bài:**
Tạo thủ tục lấy danh sách Appointment (JOIN với User, Service, Package) theo User ID truyền vào.

Tham số: p_user_id.

Kết quả SELECT h
Hiển thị Appointment.id, appointment_date, status, Service.name, Package.name.
```
DELIMITER //
CREATE PROCEDURE get_appointments_by_user(
    IN p_user_id INT
)
BEGIN
    SELECT 
        a.id AS appointment_id, 
        a.appointment_date, 
        a.status, 
        s.name AS service_name, 
        p.name AS package_name
    FROM 
        Appointment a
    LEFT JOIN 
        Service s ON a.service_id = s.id
    LEFT JOIN 
        Package p ON a.package_id = p.id
    WHERE 
        a.user_id = p_user_id;
END;
//
DELIMITER ;

```
### SP 4
**Đề bài:**
Tạo thủ tục thêm mới Billing khi người dùng thanh toán.

Tham số: p_user_id, p_appointment_id, p_total_amount, p_payment_status.

Nếu p_payment_status = 'Paid' => payment_date = NOW(), ngược lại để NULL.
INSERT vào bảng Billing.
```
DELIMITER //
CREATE PROCEDURE add_billing(
    IN p_user_id INT,
    IN p_appointment_id INT,
    IN p_total_amount DECIMAL(10, 2),
    IN p_payment_status VARCHAR(20)
)
BEGIN
    INSERT INTO Billing (
        user_id, appointment_id, total_amount, payment_status, payment_date
    )
    VALUES (
        p_user_id, p_appointment_id, p_total_amount, p_payment_status, 
        CASE 
            WHEN p_payment_status = 'Paid' THEN NOW()
            ELSE NULL 
        END
    );
END;
//
DELIMITER ;

```
### SP 5
**Đề bài:**
Tạo thủ tục thống kê cho một User (theo p_user_id):

- Tổng số Appointment đã đặt.
- Tổng số Notification (bảng Notification) chưa đọc.
- Tổng chi phí đã thanh toán (bảng Billing, payment_status = 'Paid').
- Gợi ý: Có thể trả về qua 3 SELECT riêng hoặc 3 biến OUT.
```
DELIMITER //
CREATE PROCEDURE user_statistics(
    IN p_user_id INT,
    OUT total_appointments INT,
    OUT unread_notifications INT,
    OUT total_paid_amount DECIMAL(10, 2)
)
BEGIN
    SELECT COUNT(*) INTO total_appointments 
    FROM Appointment 
    WHERE user_id = p_user_id;

    SELECT COUNT(*) INTO unread_notifications 
    FROM Notification 
    WHERE user_id = p_user_id AND is_read = FALSE;

    SELECT SUM(total_amount) INTO total_paid_amount 
    FROM Billing 
    WHERE user_id = p_user_id AND payment_status = 'Paid';
END;
//
DELIMITER ;

```