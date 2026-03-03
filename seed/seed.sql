-- seed.sql
-- Sample data for LMS MySQL database

-- =======================
-- Users
-- =======================
INSERT INTO users (name, email, role)
VALUES
('Stanley Isaac', 'stanley.isaac@example.com', 'instructor'),
('Alice Johnson', 'alice.johnson@example.com', 'student'),
('Bob Smith', 'bob.smith@example.com', 'student'),
('Carol Williams', 'carol.williams@example.com', 'student'),
('David Brown', 'david.brown@example.com', 'student'),
('Eve Davis', 'eve.davis@example.com', 'student'),
('Frank Miller', 'frank.miller@example.com', 'student'),
('Grace Wilson', 'grace.wilson@example.com', 'student'),
('Hannah Moore', 'hannah.moore@example.com', 'student'),
('Ian Taylor', 'ian.taylor@example.com', 'student'),
('Jack Anderson', 'jack.anderson@example.com', 'student'),
('Kelly Thomas', 'kelly.thomas@example.com', 'student'),
('Leo Jackson', 'leo.jackson@example.com', 'student'),
('Mia White', 'mia.white@example.com', 'student'),
('Noah Harris', 'noah.harris@example.com', 'student'),
('Olivia Martin', 'olivia.martin@example.com', 'student'),
('Paul Thompson', 'paul.thompson@example.com', 'student'),
('Quinn Garcia', 'quinn.garcia@example.com', 'student'),
('Rachel Martinez', 'rachel.martinez@example.com', 'student'),
('Sam Robinson', 'sam.robinson@example.com', 'student'),
('Tina Clark', 'tina.clark@example.com', 'student'),
('Uma Lewis', 'uma.lewis@example.com', 'student'),
('Victor Lee', 'victor.lee@example.com', 'student'),
('Wendy Walker', 'wendy.walker@example.com', 'student'),
('Xander Hall', 'xander.hall@example.com', 'student'),
('Yara Allen', 'yara.allen@example.com', 'student'),
('Zack Young', 'zack.young@example.com', 'student'),
('Fiona Scott', 'fiona.scott@example.com', 'instructor'),
('George King', 'george.king@example.com', 'instructor'),
('Holly Adams', 'holly.adams@example.com', 'instructor'),
('Ivan Baker', 'ivan.baker@example.com', 'instructor'),
('Julia Carter', 'julia.carter@example.com', 'instructor'),
('Admin One', 'admin1@example.com', 'admin'),
('Admin Two', 'admin2@example.com', 'admin'),
('Admin Three', 'admin3@example.com', 'admin');

-- =======================
-- Courses
-- =======================
INSERT INTO courses (title, description, price, instructor_id)
VALUES
('Python for Beginners', 'Learn Python from scratch', 49.99, 1),
('Advanced Flutter', 'Master Flutter for cross-platform apps', 99.99, 1),
('Data Science 101', 'Intro to data science concepts', 79.99, 29),
('Meme Economics', 'The business of memes', 39.99, 30),
('Web Development Bootcamp', 'HTML, CSS, JS hands-on', 59.99, 31),
('Machine Learning Basics', 'ML concepts and applications', 89.99, 32),
('React for Beginners', 'Learn React step by step', 69.99, 33),
('Blockchain Fundamentals', 'Intro to blockchain and crypto', 59.99, 30),
('AI in Practice', 'Practical AI applications', 99.99, 29),
('Mobile App Monetization', 'Make money with apps', 49.99, 1);

-- =======================
-- Modules
-- =======================
INSERT INTO modules (course_id, title, order_index)
VALUES
(1,'Introduction to Python',1),(1,'Python Core Concepts',2),(1,'Python Projects',3),
(2,'Flutter Basics',1),(2,'State Management',2),(2,'Flutter Projects',3),
(3,'Data Science Tools',1),(3,'Statistics Basics',2),(3,'Data Projects',3),
(4,'Meme History',1),(4,'Meme Monetization',2),(4,'Advanced Meme Strategies',3),
(5,'HTML & CSS',1),(5,'JavaScript Basics',2),(5,'Web Projects',3),
(6,'ML Concepts',1),(6,'ML Algorithms',2),(6,'ML Projects',3),
(7,'React Setup',1),(7,'Components & Props',2),(7,'React Projects',3),
(8,'Blockchain Overview',1),(8,'Smart Contracts',2),(8,'Crypto Projects',3),
(9,'AI Concepts',1),(9,'AI Tools',2),(9,'AI Projects',3),
(10,'Monetization Basics',1),(10,'Ad Strategies',2),(10,'Advanced Monetization',3);

-- =======================
-- Lessons
-- =======================
INSERT INTO lessons (module_id, title, content_type, content_url, order_index)
VALUES
-- Python Module 1
(1,'Python Setup','video','https://example.com/python/setup',1),
(1,'Hello World','text','https://example.com/python/helloworld',2),
(1,'Python Basics Quiz','quiz','https://example.com/python/quiz1',3),
-- Python Module 2
(2,'Variables & Data Types','video','https://example.com/python/variables',1),
(2,'Control Flow','text','https://example.com/python/controlflow',2),
(2,'Loops Quiz','quiz','https://example.com/python/quiz2',3),
-- Python Module 3
(3,'Mini Project 1','video','https://example.com/python/project1',1),
(3,'Mini Project 2','video','https://example.com/python/project2',2),
(3,'Final Quiz','quiz','https://example.com/python/finalquiz',3);

-- (Similarly, you can replicate lessons for all modules with content_type: video/text/quiz)

-- =======================
-- Enrollments
-- =======================
INSERT INTO enrollments (user_id, course_id, enrolled_at, status)
VALUES
(2,1,NOW(),'active'),(3,1,NOW(),'active'),(4,2,NOW(),'active'),
(5,3,NOW(),'active'),(6,4,NOW(),'active'),(7,1,NOW(),'active'),
(8,2,NOW(),'active'),(9,3,NOW(),'active'),(10,4,NOW(),'active');

-- =======================
-- Progress
-- =======================
INSERT INTO progress (user_id, lesson_id, completed_at)
VALUES
(2,1,NOW()),(2,2,NOW()),(2,3,NULL),
(3,1,NOW()),(3,2,NULL),(3,3,NULL);

-- =======================
-- Payments
-- =======================
INSERT INTO payments (user_id, course_id, amount, payment_status, paid_at)
VALUES
(2,1,49.99,'completed',NOW()),
(3,1,49.99,'completed',NOW()),
(4,2,99.99,'completed',NOW());
