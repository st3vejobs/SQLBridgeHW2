-- Shane Hylton Bridge Assignment 2

-- QUESTION 1

CREATE TABLE Videos ( 
	VideoID int NOT NULL AUTO_INCREMENT,
	Title varchar(200),
    Length int,
    URL varchar(200),
    PRIMARY KEY (VideoID)
    );
INSERT INTO Videos (Title, length, url)
VALUES ('How to shave your dog', 52, 'https://youtu.be/Gl79vNmM-Sc');

INSERT INTO Videos (Title, length, url)
VALUES ('How to Play Chess', 4, 'https://youtu.be/fKxG8KjH1Qg');
INSERT INTO Videos (Title, length, url)
VALUES ('How to Sharpen a Pencil', 5, 'https://youtu.be/_Q1Ohd8h_NQ');

SELECT * FROM Videos;


-- QUESTION 2
CREATE TABLE Reviewers (
	ReviewerID int NOT NULL AUTO_INCREMENT,
    UserName varchar(30),
    Rating int, 
    Review varchar(120),
    VideoID int,
    CHECK (Rating >= 0 AND Rating <= 5),
    PRIMARY KEY (ReviewerID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);
    
INSERT INTO Reviewers (UserName, Rating, Review, VideoID)
VALUES ('wetdog', 1, 'they did not teach how to shave wet dogs.', 1);
INSERT INTO Reviewers (UserName, Rating, Review, VideoID)
VALUES ('grandmaster', 1, 'I am better than the teacher.', 2);
INSERT INTO Reviewers (UserName, Rating, Review, VideoID)
VALUES ('penuser', 1, 'But how to sharpen pens?', 3);
INSERT INTO Reviewers (UserName, Rating, Review, VideoID)
VALUES ('doglover', 5, 'I don''t have a dog, but I like this video.', 1);


SELECT * FROM Reviewers;

-- QUESTION 3

SELECT Reviewers.UserName, Reviewers.Rating, Reviewers.Review, Videos.Title
FROM Reviewers
INNER JOIN Videos ON Reviewers.VideoID=Videos.VideoID;