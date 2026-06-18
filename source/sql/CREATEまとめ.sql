上からCREATEするんやぞ！ 絶対やぞ（戒め）！
上からCREATEするんやぞ！ 絶対やぞ（戒め）！
上からCREATEするんやぞ！ 絶対やぞ（戒め）！

◆ログイン関連
CREATE TABLE users(
user_no INT AUTO_INCREMENT PRIMARY KEY,
mail_add VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL
);

◆年代関連
CREATE TABLE eras(
era_no INT AUTO_INCREMENT PRIMARY KEY,
era_name VARCHAR(4) UNIQUE
);

◆ジャンル関連
CREATE TABLE genres(
genre_no INT AUTO_INCREMENT PRIMARY KEY,
genre_name VARCHAR(10) UNIQUE
);

◆単語関連
CREATE TABLE words(
word_no INT AUTO_INCREMENT PRIMARY KEY,
word VARCHAR(100) UNIQUE,
pronounce VARCHAR(100),
meaning VARCHAR(100),
era_no INT,
genre_no INT,
level INT,
FOREIGN KEY(era_no) REFERENCES eras(era_no),
FOREIGN KEY(genre_no) REFERENCES genres(genre_no)
);

◆ユーザーごとにどの単語の閲覧履歴があるか(チェック)
CREATE TABLE history(
user_no INT NOT NULL,
word_no INT NOT NULL,
PRIMARY KEY(user_no,word_no),
FOREIGN KEY(user_no) REFERENCES users(user_no),
FOREIGN KEY(word_no) REFERENCES words(word_no)
);

◆ジャンルごとのテンプレート文
CREATE TABLE templates(
sentence_no INT AUTO_INCREMENT PRIMARY KEY,
genre_no INT NOT NULL,
sentence VARCHAR(30) NOT NULL,
FOREIGN KEY (genre_no) REFERENCES genres(genre_no)
);