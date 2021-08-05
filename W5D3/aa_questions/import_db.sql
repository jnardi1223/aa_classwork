PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes; -- drop tables in order of children -> parent
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


-- seeding the tables
INSERT INTO
    users (fname, lname)
VALUES
    ('billy', 'bob'),
    ('jello', 'bingus'),
    ('samjam', 'cronko');

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('how is babby formed', 'They need to do way instain mother who kill thier babbys, becuse these babby cant fright back? It was on the news this mroing a mother in ar who had kill her three kids, they are taking the three babby back to new york too lady to rest. my pary are with the father who lost his chrilden i am truley sorry for your lots', (SELECT id FROM users WHERE fname = 'billy')),
    ('why is 2x2 4', 'my math teacher makes math hard', (SELECT id FROM users WHERE fname = 'jello')),
    ('how big is the moon', 'its so high in the sky', (SELECT id FROM users WHERE fname = 'samjam'));

INSERT INTO
    replies (question_id, parent_reply_id, user_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'how big is the moon'), NULL, (SELECT user_id FROM questions WHERE title = 'how big is the moon'), 'the moon real big');

INSERT INTO 
    question_follows
VALUES 
    