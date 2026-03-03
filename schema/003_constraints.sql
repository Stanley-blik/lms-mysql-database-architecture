-- 003_constraints.sql
-- Additional constraints and integrity rules for LMS MySQL database

-- Users table: ensure email format (simple regex check)
ALTER TABLE users
ADD CONSTRAINT chk_users_email CHECK (email LIKE '%_@_%._%');

-- Courses table: price cannot be negative
ALTER TABLE courses
ADD CONSTRAINT chk_courses_price CHECK (price >= 0);

-- Modules table: order_index cannot be negative
ALTER TABLE modules
ADD CONSTRAINT chk_modules_order_index CHECK (order_index >= 0);

-- Lessons table: order_index cannot be negative
ALTER TABLE lessons
ADD CONSTRAINT chk_lessons_order_index CHECK (order_index >= 0);

-- Enrollments table: status validation (redundant with ENUM, but safe)
ALTER TABLE enrollments
ADD CONSTRAINT chk_enrollments_status CHECK (status IN ('active','completed','dropped'));

-- Progress table: completed_at must be NULL or a valid timestamp
ALTER TABLE progress
ADD CONSTRAINT chk_progress_completed_at CHECK (completed_at IS NULL OR completed_at <= NOW());

-- Payments table: amount must be positive
ALTER TABLE payments
ADD CONSTRAINT chk_payments_amount CHECK (amount > 0);

-- Payments table: payment_status validation
ALTER TABLE payments
ADD CONSTRAINT chk_payments_status CHECK (payment_status IN ('pending','completed','failed'));
