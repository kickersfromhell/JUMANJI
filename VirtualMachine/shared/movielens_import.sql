# http://grouplens.org/datasets/movielens/

DROP TABLE IF EXISTS movies.ratings;
DROP TABLE IF EXISTS movies.users;
DROP TABLE IF EXISTS movies.movies;

CREATE TABLE IF NOT EXISTS movies.users (
    userID INT PRIMARY KEY,
    age INT,
    gender TEXT,
    occupation TEXT,
    zipcode TEXT 
    );
LOAD DATA LOCAL INFILE 'u.user' INTO TABLE movies.users FIELDS TERMINATED BY '|';


CREATE TABLE IF NOT EXISTS movies.movies (
    itemID INT PRIMARY KEY NOT NULL,
    title TEXT,
    releaseDate DATE
    );
LOAD DATA LOCAL INFILE 'u.item' INTO TABLE movies.movies FIELDS TERMINATED BY '|'
(itemID, title, @var3)
set releaseDate = STR_TO_DATE(@var3,'%d-%M-%Y');


CREATE TABLE IF NOT EXISTS movies.ratings (
    userID INT ,
    itemID INT ,
    rating INT,
    timestamp INT,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (itemID) REFERENCES movies(itemID)
    );

LOAD DATA LOCAL INFILE 'u.data'
INTO TABLE movies.ratings;