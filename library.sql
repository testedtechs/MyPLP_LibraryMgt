- Database Management System: Library Management


-- Create Table: member (Stores member information)
CREATE TABLE member (
    member_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each member
    first_name VARCHAR(255) NOT NULL,      -- Member's first name
    last_name VARCHAR(255) NOT NULL,       -- Member's last name
    address VARCHAR(255),                   -- Member's address
    phone_number VARCHAR(20),                -- Member's phone number
    email VARCHAR(255) UNIQUE,             -- Member's email address (must be unique)
    join_date DATE NOT NULL                  -- Date the member joined
);

-- Create Table: author (Stores author information)
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each author
    first_name VARCHAR(255) NOT NULL,      -- Author's first name
    last_name VARCHAR(255) NOT NULL         -- Author's last name
);

-- Create Table: book (Stores book information)
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,   -- Unique identifier for each book
    title VARCHAR(255) NOT NULL,        -- Book title
    isbn VARCHAR(20) UNIQUE NOT NULL,        -- International Standard Book Number (must be unique)
    publication_year INT,              -- Year of publication
    genre VARCHAR(255),                -- Book genre
    available_copies INT NOT NULL DEFAULT 0 CHECK (available_copies >= 0) -- Number of copies available, defaults to 0, must be non-negative
);


-- Create Table: book_author (Many-to-Many relationship between books and authors)
CREATE TABLE book_author (
    book_id INT,                       -- Foreign key referencing book table
    author_id INT,                     -- Foreign key referencing author table
    PRIMARY KEY (book_id, author_id),    -- Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Table: loan (Stores loan information)
CREATE TABLE loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each loan
    member_id INT NOT NULL,                -- Foreign key referencing member table
    book_id INT NOT NULL,                  -- Foreign key referencing book table
    loan_date DATE NOT NULL,                 -- Date the book was loaned
    return_date DATE,                       -- Date the book was returned (can be NULL if not returned)
    due_date DATE NOT NULL,                  -- Date the book is due
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Sample Data Insertion

-- Insert data into member table
INSERT INTO member (first_name, last_name, address, phone_number, email, join_date) VALUES
('Taiwo', 'Karo', '123 Main St', '555-1234', 'taka@gmail.com', '2023-01-15'),
('Mcho', 'Johnson', '456 Oak Ave', '555-5678', 'bmchojoh@gmail.com', '2023-03-20'),
('Benedict', 'Kayode', '789 Pine Ln', '555-9012', 'benkay@gmail.com', '2023-05-10');

-- Insert data into author table
INSERT INTO author (first_name, last_name) VALUES
('Jane', 'Austen'),
('George', 'Orwell'),
('J.R.R.', 'Tolkien');

-- Insert data into book table
INSERT INTO book (title, isbn, publication_year, genre, available_copies) VALUES
('Pride and Prejudice', '978-0141439518', 1813, 'Romance', 5),
('1984', '978-0451524935', 1949, 'Dystopian', 3),
('The Hobbit', '978-0547928227', 1937, 'Fantasy', 7);

-- Insert data into book_author table (linking books to authors)
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), -- Pride and Prejudice by Jane Austen
(2, 2), -- 1984 by George Orwell
(3, 3); -- The Hobbit by J.R.R. Tolkien

-- Insert data into loan table
INSERT INTO loan (member_id, book_id, loan_date, return_date, due_date) VALUES
(1, 1, '2024-01-05', '2024-01-20', '2024-01-19'),
(2, 2, '2024-01-10', NULL, '2024-01-24'), -- Book not returned yet
(3, 3, '2024-01-12', '2024-01-26', '2024-01-26');

-- Display some of the data
SELECT * FROM member;
SELECT * FROM author;
SELECT * FROM book;
SELECT * FROM book_author;
SELECT * FROM loan;
