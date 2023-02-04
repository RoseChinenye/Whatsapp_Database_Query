--SQL scripts that create tables of a WhatsApp database

CREATE TABLE [Users] (
		UserID int PRIMARY KEY IDENTITY (1,1),
		UserName varchar(50) NOT NULL,
		PhoneNumber varchar (20) NOT NULL

);

ALTER TABLE Users
ADD CONSTRAINT UX_PhoneNumber UNIQUE (PhoneNumber);

CREATE TABLE [Chats] (
		ChatID int PRIMARY KEY IDENTITY (1,1),
		SenderID int NOT NULL,
		ReceiverID int NOT NULL,
		FOREIGN KEY (SenderID) REFERENCES Users(UserID),
		FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)

);

CREATE TABLE [Messages] (
		MessageID int PRIMARY KEY IDENTITY (1,1),
		ChatID int NOT NULL,
		SenderID int NOT NULL,
		Message varchar(max) NOT NULL,
		Timestamp datetime default CURRENT_TIMESTAMP,
		FOREIGN KEY (ChatID) REFERENCES Chats(ChatID),
		FOREIGN KEY (SenderID) REFERENCES Users(UserID)

);

--SQL scripts that populate data of WhatsApp database

INSERT INTO [Users] (UserName, PhoneNumber) VALUES 
		('RoseJewels' , '09071688547'),
		('Ken','08096543278'),
		('Marshall','08128768900'),
		('Ada','08006543271'),
		('Nneka','07028768945');

INSERT INTO [Chats] (SenderID, ReceiverID) VALUES 
		(1,3),
		(4,2),
		(5,1),
		(4,5),
		(2,3);

INSERT INTO [Messages] (ChatID, SenderID, Message) VALUES 
		(1, 1, 'Hi Marshall, whatsup!'),
		(4, 4, 'Good Morning Nneka!'),
		(2, 4, 'Hey Ken!'),
		(5, 2, 'How far with you Marshall?'),
		(3, 5, 'Hello Rose!');


SELECT * FROM [Users]
SELECT * FROM [Chats]
SELECT * FROM [Messages]


--A view from which we can see the sender name, receiver name, messages sent between them with time stamps.

CREATE VIEW [ChatDetails] AS
SELECT 
	Sender.UserName AS SenderName,
	Receiver.UserName AS ReceiverName,
	m.Message AS MessagesSent,
	m.Timestamp
FROM 
	Messages m
	JOIN Chats chat ON m.ChatID = chat.ChatID
	JOIN Users Sender ON chat.SenderID = Sender.UserID
	JOIN Users Receiver ON chat.ReceiverID = Receiver.UserID;


SELECT * FROM [ChatDetails]