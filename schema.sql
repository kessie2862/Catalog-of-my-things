-- Music Album
CREATE TABLE MusicAlbum (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
)

-- Genre
CREATE TABLE Genre(
    id SERIAl PRIMARY KEY,
    name VARCHAR(100),
)

-- Item
CREATE TABLE item (
  id SERIAl PRIMARY KEY,
  publish_date DATE NOT NULL,
  FOREIGN KEY (id) REFERENCES author (id)
);

-- Book
CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(50) NOT NULL,
  cover_state VARCHAR(50) NOT NULL,
  author_ID INT,
  genre_ID INT,
  label_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);
 -- Game
 CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  author_ID INT,
  genre_ID INT,
  label_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);