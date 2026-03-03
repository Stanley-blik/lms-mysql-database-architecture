-- 002_indexes.sql
-- Indexes to improve query performance for LMS MySQL database

-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- Courses table
CREATE INDEX idx_courses_instructor_id ON courses(instructor_id);

-- Modules table
CREATE INDEX idx_modules_course_id ON modules(course_id);

-- Lessons table
CREATE INDEX idx_lessons_module_id ON lessons(module_id);
CREATE INDEX idx_lessons_content_type ON lessons(content_type);

-- Enrollments table
CREATE INDEX idx_enrollments_user_id ON enrollments(user_id);
CREATE INDEX idx_enrollments_course_id ON enrollments(course_id);

-- Progress table
CREATE INDEX idx_progress_user_id ON progress(user_id);
CREATE INDEX idx_progress_lesson_id ON progress(lesson_id);

-- Payments table
CREATE INDEX idx_payments_user_id ON payments(user_id);
CREATE INDEX idx_payments_course_id ON payments(course_id);
CREATE INDEX idx_payments_status ON payments(payment_status);
