# database-wk-8

# Library Management System Database Schema

## Overview
This project implements a relational database schema for a Library Management System using MySQL. The schema is designed to manage library users, staff, books, authors, categories, and book loans, with proper relationships and constraints to ensure data integrity.

## Database Structure

### 1. Database
- `library_db`: The main database for the library system.

### 2. Tables
- **users**: Stores library members' details (name, email, phone, address). Each user has a unique ID and email.
- **authors**: Contains information about book authors (name, bio).
- **books**: Holds book details (title, ISBN, published year, author). Each book is linked to an author.
- **categories**: Lists book categories/genres (name).
- **book_category**: Junction table for the many-to-many relationship between books and categories.
- **loans**: Tracks which user borrowed which book, including loan, due, and return dates.
- **staff**: Stores staff member details, linked one-to-one with users.

## Relationships & Constraints
- **Primary Keys**: Each table has a primary key (e.g., `user_id`, `book_id`).
- **Foreign Keys**: Enforce relationships between tables (e.g., books to authors, loans to users/books).
- **Unique Constraints**: Ensure unique values for fields like email and ISBN.
- **Not Null Constraints**: Critical fields are required (e.g., name, email, title).
- **One-to-Many**: Authors to Books, Users to Loans.
- **Many-to-Many**: Books to Categories (via `book_category`).
- **One-to-One**: Users to Staff (each staff member is a user).

## How to Use
Run the SQL statements in `answers.sql` on a MySQL server to create the database and all tables with constraints and relationships.

## File List
- `answers.sql`: Contains all SQL statements for database creation.
- `README.md`: This documentation.

