CREATE DATABASE `mini_blog` DEFAULT CHARACTER SET utf8;

CREATE TABLE user(
  id INTEGER AUTO_INCREMENT,
  user_name VARCHAR(20) NOT NULL,
  password VARCHAR(40) NOT NULL,
  created_at DATETIME,
  PRIMARY KEY(id),
  UNIQUE KEY user_name_index(user_name)
) ENGINE = INNODB;

CREATE TABLE follwing(
  user_id INTEGER,
  following_id INTEGER,
  PRIMARY KEY(user_id, following_id)
) ENGINE = INNODB;

CREATE TABLE status(
  id INTEGER AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  body VARCHAR(255),
  created_at DATETIME,
  PRIMARY KEY(id),
  INDEX user_id_index(user_id)
) ENGINE = INNODB;

ALTER TABLE follwing ADD FOREIGN KEY (user_id) REFERENCES user(id);
ALTER TABLE follwing ADD FOREIGN KEY (following_id) REFERENCES user(id);
ALTER TABLE status ADD FOREIGN KEY (user_id) REFERENCES user(id);

