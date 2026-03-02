# LMS MySQL Database Architecture

## Overview
This repository contains a professional, fully normalized MySQL database design for a Learning Management System (LMS).
It includes ERD diagrams, SQL schema, migration files, sample data, and detailed documentation to demonstrate relational database architecture best practices.

## Features
- User roles: Student, Instructor, Admin
- Course management with modules and lessons
- Many-to-many enrollments with progress tracking
- Referential integrity with foreign keys
- Indexed for query performance
- Sample data for testing
- Migration-ready SQL files

## Project Structure
lms-mysql-database-architecture/
├── ERD/                 # Mermaid diagrams and exported PNGs
├── schema/              # SQL schema files
├── migrations/          # Migration scripts for future updates
├── seed/                # Sample data
├── docs/                # Database documentation
└── README.md            # Project overview and instructions

## Setup Instructions
1. Create the database:
```sql
CREATE DATABASE lms_db;
USE lms_db;
```
2. Run schema files in order:
```sql
SOURCE schema/001_init.sql;
SOURCE schema/002_indexes.sql;
SOURCE schema/003_constraints.sql;
```
3. Optional: Insert sample data:
```sql
SOURCE seed/seed.sql;
```

## ERD
ERD diagrams can be found in the `ERD/` folder. They visualize the entities, relationships, and cardinalities.

## Documentation
See `docs/DATABASE_DOCUMENTATION.md` for:
- Table descriptions
- Relationships
- Scaling considerations
- Design decisions

## License
MIT License
