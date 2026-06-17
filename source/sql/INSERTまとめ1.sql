◆usersテーブル
INSERT INTO users(mail_add,password) VALUES
('abcd@gmail.com','password');


◆erasテーブル
INSERT INTO eras(era_name) VALUES
('昭和後期'),
('平成初期'),
('平成中期'),
('平成後期'),
('令和');


◆genresテーブル
INSERT INTO genres(genre_name) VALUES
('用語'),
('物品・サービス'),
('人物'),
('ゲーム・アニメ'),
('音楽');


◆wordsテーブル
長すぎるので、INSERTまとめ2.sql をみてね☆。


◆historyテーブル
用語を検索した際にその度々追加していくのでここでは追加しない。
DAOに書く文は、

SELECT * FROM check WHERE user_no = ? AND word_no ?;

で、該当ユーザーがその用語を閲覧したことがあるかを判断。ヒットすれば、あるということ。以下の処理はスキップ。
ヒットしないなら、見たことがないということだから、以下の

INSERT INTO check(user_no,word_no) VALUES (?,?);

でユーザー ? さんが、この単語を ? 閲覧しました。と表すためにcheckテーブルに要素追加をする。
両文共に、user_noはServletでセッション取得、word_noはjspから取得する。


◆templatesテーブル
INSERT INTO templates(genre_no,sentence) VALUES
(1,'って流行った？'),
(2,'って流行った？'),
(3,'って誰？'),
(4,'ってどんな作品？'),
(5,'ってどんな感じのグループ？');

