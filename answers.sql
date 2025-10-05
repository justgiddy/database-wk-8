-- Library Management System Database Schema

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- 2. Create Tables

-- Users Table (Library Members)
CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	phone VARCHAR(20),
	address VARCHAR(255)
);

-- Authors Table
CREATE TABLE authors (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	bio TEXT
);

-- Books Table
CREATE TABLE books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(150) NOT NULL,
	isbn VARCHAR(20) NOT NULL UNIQUE,
	published_year INT,
	author_id INT NOT NULL,
	CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Categories Table
CREATE TABLE categories (
	category_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

-- Book_Category Table (Many-to-Many: Books <-> Categories)
CREATE TABLE book_category (
	book_id INT NOT NULL,
	category_id INT NOT NULL,
	PRIMARY KEY (book_id, category_id),
	FOREIGN KEY (book_id) REFERENCES books(book_id),
	FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Loans Table (Tracks which user borrowed which book)
CREATE TABLE loans (
	loan_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	book_id INT NOT NULL,
	loan_date DATE NOT NULL,
	due_date DATE NOT NULL,
	return_date DATE,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Staff Table (One-to-One with Users, for staff members)
CREATE TABLE staff (
	staff_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL UNIQUE,
	position VARCHAR(50) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);
