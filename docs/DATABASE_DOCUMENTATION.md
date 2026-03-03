# LMS Database Documentation

## Overview
This document provides a comprehensive description of the Learning Management System (LMS) MySQL database.  
It details all tables, columns, data types, relationships, constraints, and design considerations. This documentation serves both as a reference for developers and as a portfolio showcase of relational database architecture.

---

## Table of Contents
1. [Users](#users)
2. [Courses](#courses)
3. [Modules](#modules)
4. [Lessons](#lessons)
5. [Enrollments](#enrollments)
6. [Progress](#progress)
7. [Payments](#payments)
8. [Relationships](#relationships)
9. [Indexes and Performance](#indexes-and-performance)
10. [Design Considerations](#design-considerations)

---

## Users
**Table:** `users`  
Represents all users in the LMS system, including students, instructors, and admins.

| Column      | Type                   | Constraints                    | Description                              |
|------------|------------------------|--------------------------------|------------------------------------------|
| id         | INT AUTO_INCREMENT     | PRIMARY KEY                    | Unique identifier for each user          |
| name       | VARCHAR(120)           | NOT NULL                       | Full name of the user                     |
| email      | VARCHAR(255)           | UNIQUE, NOT NULL               | User email for login and communication   |
| role       | ENUM('student','instructor','admin') | NOT NULL | Defines the user type                     |
| created_at | TIMESTAMP              | DEFAULT CURRENT_TIMESTAMP      | Timestamp of account creation            |

---

## Courses
**Table:** `courses`  
Represents courses available in the LMS.

| Column        | Type                   | Constraints                    | Description                                |
|---------------|------------------------|--------------------------------|--------------------------------------------|
| id            | INT AUTO_INCREMENT     | PRIMARY KEY                    | Unique course identifier                   |
| title         | VARCHAR(255)           | NOT NULL                       | Name of the course                          |
| description   | TEXT                   |                                | Detailed description of the course         |
| price         | DECIMAL(10,2)          | DEFAULT 0.00, CHECK >=0       | Course cost                                 |
| instructor_id | INT                    | NOT NULL, FK → users(id)       | Reference to the instructor                |
| created_at    | TIMESTAMP              | DEFAULT CURRENT_TIMESTAMP      | Timestamp when course was created          |

---

## Modules
**Table:** `modules`  
Each course is divided into multiple modules.

| Column      | Type       | Constraints                 | Description                         |
|------------|------------|-----------------------------|-------------------------------------|
| id         | INT AUTO_INCREMENT | PRIMARY KEY         | Unique module identifier            |
| course_id  | INT        | NOT NULL, FK → courses(id)  | Course this module belongs to       |
| title      | VARCHAR(255) | NOT NULL                   | Module name                         |
| order_index| INT        | DEFAULT 0, CHECK >=0        | Display order within the course    |

---

## Lessons
**Table:** `lessons`  
Modules contain lessons of various types.

| Column       | Type                       | Constraints                 | Description                                  |
|--------------|----------------------------|-----------------------------|----------------------------------------------|
| id           | INT AUTO_INCREMENT          | PRIMARY KEY                 | Unique lesson identifier                     |
| module_id    | INT                        | NOT NULL, FK → modules(id)  | Module this lesson belongs to               |
| title        | VARCHAR(255)               | NOT NULL                    | Lesson title                                 |
| content_type | ENUM('video','text','quiz')| NOT NULL                    | Type of content                              |
| content_url  | TEXT                       |                             | URL of content                                |
| order_index  | INT                        | DEFAULT 0, CHECK >=0        | Display order within the module             |

---

## Enrollments
**Table:** `enrollments`  
Tracks which students are enrolled in which courses (many-to-many relationship).

| Column      | Type       | Constraints                     | Description                               |
|------------|------------|---------------------------------|-------------------------------------------|
| id         | INT AUTO_INCREMENT | PRIMARY KEY               | Unique enrollment identifier               |
| user_id    | INT        | NOT NULL, FK → users(id)        | Student enrolled                            |
| course_id  | INT        | NOT NULL, FK → courses(id)      | Course the student is enrolled in         |
| enrolled_at| TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP       | Enrollment timestamp                        |
| status     | ENUM('active','completed','dropped') | DEFAULT 'active' | Enrollment state                          |

**Notes:**  
- Unique constraint (`user_id, course_id`) prevents duplicate enrollments.

---

## Progress
**Table:** `progress`  
Tracks completion of lessons by students.

| Column       | Type      | Constraints                   | Description                          |
|-------------|-----------|-------------------------------|--------------------------------------|
| id          | INT AUTO_INCREMENT | PRIMARY KEY           | Unique progress entry identifier     |
| user_id     | INT       | NOT NULL, FK → users(id)      | Student                                  |
| lesson_id   | INT       | NOT NULL, FK → lessons(id)    | Lesson being tracked                     |
| completed_at| TIMESTAMP | DEFAULT NULL                  | Timestamp when lesson was completed    |

**Notes:**  
- Unique constraint (`user_id, lesson_id`) ensures one progress record per lesson per student.

---

## Payments
**Table:** `payments`  
Tracks payments made by students for courses.

| Column        | Type            | Constraints                    | Description                                |
|---------------|-----------------|--------------------------------|--------------------------------------------|
| id            | INT AUTO_INCREMENT | PRIMARY KEY                  | Unique payment identifier                  |
| user_id       | INT             | NOT NULL, FK → users(id)       | Student making the payment                 |
| course_id     | INT             | NOT NULL, FK → courses(id)     | Course being paid for                      |
| amount        | DECIMAL(10,2)   | NOT NULL, CHECK >0            | Payment amount                              |
| payment_status| ENUM('pending','completed','failed') | DEFAULT 'pending' | Status of the payment                      |
| paid_at       | TIMESTAMP       | DEFAULT CURRENT_TIMESTAMP      | Timestamp of payment                        |

---

## Relationships
- **Users → Courses:** An instructor (role = 'instructor') teaches many courses.  
- **Users → Enrollments:** A student (role = 'student') can enroll in many courses.  
- **Courses → Modules:** Each course contains multiple modules.  
- **Modules → Lessons:** Each module contains multiple lessons.  
- **Enrollments → Progress:** Students’ progress is tracked per lesson.  
- **Payments → Courses/Users:** Each payment references a student and a course.

---

## Indexes and Performance
- Indexed columns:
  - `users.email`, `users.role`  
  - `courses.instructor_id`  
  - `modules.course_id`  
  - `lessons.module_id`, `lessons.content_type`  
  - `enrollments.user_id`, `enrollments.course_id`  
  - `progress.user_id`, `progress.lesson_id`  
  - `payments.user_id`, `payments.course_id`, `payments.payment_status`  

- Foreign keys enforce **referential integrity**.  
- Unique constraints prevent duplicate enrollments and progress records.  

---

## Design Considerations
- Normalized to **3NF** to reduce redundancy.  
- Enum types for roles, content types, statuses enforce data consistency.  
- Order indices for modules and lessons support frontend ordering.  
- Timestamp columns allow tracking of creation, enrollment, completion, and payments.  
- Scalable structure suitable for adding more courses, students, or modules without schema changes.  

---

**End of Documentation**
