ДЗ 1
INSERT INTO genres(name) VALUES
("Рок"),
("Поп"),
("Народный");
INSERT INTO artists(name) VALUES
("Иван Иванов"),
("Ирина Кузнецова"),
("Диана"),
("Петр Смирнов");
INSERT INTO artists_genres(artist_id, genre_id) VALUES
(1,1),
(1,2),
(2,2),
(3,3),
(4,1),
(4,3);
INSERT INTO albums(title, year) VALUES
("Звездопад", 2020),
("Новинки", 2021),
("Вечера", 2022);
INSERT INTO albums_artists(album_id, artist_id) VALUES
(1,1),
(1,2),
(2,2),
(2,4),
(3,3),
(3,4);
INSERT INTO tracks(title, duration_seconds, album_id) VALUES
("Морозное утро", 210, 1),
("Ветерок", 200, 1),
("Солнышко", 220, 2),
("Мелодия", 180,2),
("Закат", 190, 3),
("Мой любимый город", 215, 3),
("Новинка", 211, 2);
INSERT INTO compilations(title, year) VALUES
("Лучшее", 2020),
("Хиты", 2021),
("Избранное", 2022),
("Золотые хиты", 2023);
INSERT INTO compilations_tracks(compilation_id, track_id) VALUES
(1,1),
(1,3),
(2,1),
(2,2),
(2,4),
(3,5),
(3,6),
(4,2),
(4,4),
(4,5);
