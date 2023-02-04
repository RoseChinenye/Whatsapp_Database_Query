# Whatsapp_Database_Query

##Description
This repo consist of a simple Whatsapp Database SQL scripts that runs in SSMS. 

The database name is WhatsappDB. It consists of three tables: Users, Chats, and Messages. 
The relationships between these tables are described in the Entity Relationship Diagram (ERD).

## Table Descriptions

**Users**

Every data of a Whatsapp user is saved in the users table. The data collected are:

    Username: the username of the user
    PhoneNumber: User's unique phone number

**Chats**

The chats table stores information about the chats between users. It has the following columns:

    id: a unique identifier for each chat
    SenderID: the id of the sender of a message
    RecieverID: the id of the reciever of a message

**Messages**

The messages table stores information about the messages sent in chats. It has the following columns:

    id: a unique identifier for each message
    ChatID: the id of the chat that the message was sent in
    SenderID: the id of the user who sent the message
    Messages: the text of the message
    timestamp: the time the message was sent


## Entity Relationship Diagram (ERD)

The ERD diagram is in the ERD Diagram File. It shows the relationship between entities in the Database.


## View

A view was created from which we can see the sender name, receiver name, messages sent between them with time stamps.




