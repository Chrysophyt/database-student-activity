create database library;
use library;

create table books(
    bookID int AUTO_INCREMENT,
    bookTitle char(50) NOT NULL,
    authorName char(50) NOT NULL,
    borrowedStatus ENUM ('borrowed', 'available') NOT NULL,
    PRIMARY KEY(bookID)
);

create table users(
    userID int AUTO_INCREMENT,
    userName char(50) NOT NULL,
    numberOfBorrowing int, /*many times borrow*/
    numberOfReturning int, /*many times already returned*/
    PRIMARY KEY(userID)
);

create table flow(
    flowID int AUTO_INCREMENT,
    userIDBorrowing int NOT NULL,
    bookIDBorrowed int NOT NULL,
    borrowDate date NOT NULL,
    returnDate date,
    PRIMARY KEY(flowID),
    FOREIGN KEY(userIDBorrowing) REFERENCES users(userID),
    FOREIGN KEY(bookIDBorrowed) REFERENCES books(bookID)
);

INSERT books(bookTitle, authorName, borrowedStatus) VALUE
('How To C++', 'Arthur', 'available'),
('How To Java', 'Bob', 'available'),
('How To JavaScript', 'Chris', 'available'),
('How To Python', 'Darwin', 'available'),
('How To Zzzzz', 'Ezra', 'available');

INSERT users(userName) VALUE
('Fara'),
('Gavin'),
('Haley'),
('Irwin'),
('Jackob');

-- test case
-- fara borrow Java a Week Ago return it yesterday
-- fara borrow javaScript yesterday hasn't return it
-- Gavin borrow Java Today hasn't returned it
-- Jackob borrow Zzzz Yesterday hasn't returned it 

-- Borrowing Query
INSERT flow(userIDBorrowing, bookIDBorrowed, borrowDate) VALUE
((SELECT userID FROM users WHERE userName = 'Fara'), (SELECT bookID FROM books WHERE bookID=2), (SELECT NOW() - INTERVAL 7 DAY)),
((SELECT userID FROM users WHERE userName = 'Fara'), (SELECT bookID FROM books WHERE bookID=3), (SELECT NOW() - INTERVAL 1 DAY)),
((SELECT userID FROM users WHERE userName = 'Gavin'), (SELECT bookID FROM books WHERE bookID=2), (SELECT NOW())),
((SELECT userID FROM users WHERE userName = 'Jackob'), (SELECT bookID FROM books WHERE bookID=5), (SELECT NOW() - INTERVAL 1 DAY));
-- edit returned book
UPDATE flow
SET 
    returnDate = subdate(current_date, 1)
WHERE 
    flowID = 1;

-- edit book availability
UPDATE books
SET 
    borrowedStatus = 'borrowed'
WHERE
    bookID = 2 OR 
    bookID = 3 OR 
    bookID = 5;

-- edit user status
UPDATE users
SET 
    numberOfBorrowing = 0
WHERE
    userName = 'Haley' OR
    userName = 'Irwin';

UPDATE users
SET 
    numberOfBorrowing = 1
WHERE
    userName = 'Gavin' OR
    userName = 'Jackob';

UPDATE users
SET 
    numberOfBorrowing = 2
WHERE
    userName = 'Fara';

UPDATE users
SET 
    numberOfReturning = 1
WHERE
    userName = 'Fara';

UPDATE users
SET 
    numberOfReturning = 0
WHERE
    userName != 'Fara';


SELECT * FROM users;
SELECT * FROM books;
SELECT * FROM flow;


--QUERY
-- 1 --
SELECT books.bookTitle 
FROM 
    flow JOIN books ON flow.bookIDBorrowed = books.bookID
WHERE
    flow.borrowDate = subdate(current_date, 1) AND 
    flow.returnDate is NULL;

-- 2 --
SELECT books.bookTitle, flow.userIDBorrowing 
FROM 
    books LEFT JOIN flow ON flow.bookIDBorrowed = books.bookID
WHERE
    flow.returnDate is NULL
ORDER BY 
    bookID ASC;

-- 3 --
SELECT users.userID, results.bookIDBorrowed, results.bookTitle
FROM
    users LEFT JOIN (
    SELECT flow.userIDBorrowing, flow.bookIDBorrowed, books.bookTitle
    FROM 
        flow INNER JOIN books ON flow.bookIDBorrowed = books.bookID
    WHERE
        flow.returnDate is NULL -- not returned yet
    ) as results ON results.userIDBorrowing = users.userID;
    
-- 4 --

SELECT q1.userName, books.bookTitle, q1.numberOfBorrowing-q1.numberOfReturning as currently_borrow
    FROM
        (SELECT users.userID, users.userName, users.numberOfBorrowing, users.numberOfReturning, flow.bookIDBorrowed, flow.returnDate
        FROM
        users LEFT JOIN flow ON users.userID = flow.userIDBorrowing) as q1 LEFT JOIN books ON q1.bookIDBorrowed=books.bookID
    WHERE
        q1.returnDate is null -- finding the books that haven't been returned.
    HAVING
        currently_borrow > 3;
        --if want to know currently how much they are borrowing and what books they are borrowing.