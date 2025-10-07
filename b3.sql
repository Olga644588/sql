ДЗ 1
INSERT INTO genres(genre_id, name) VALUES
(1,'Рок' ),
(2, 'Поп'),
(3, 'Джаз'),
(4, 'Народный');
INSERT INTO artists(artist_id, name) VALUES
(1, 'Иван Иванов'),
(2, 'Ирина Кузнецова'),
(3, 'Диана'),
(4, 'Петр Смирнов');
INSERT INTO artists_genres(artist_id, genre_id) VALUES
(1,1),
(1,2),
(2,2),
(3,3),
(4,1),
(4,4);
INSERT INTO albums(album_id, title, release_year) VALUES
(1, 'Звездопад', 2020),
(2, 'Новинки', 2019),
(3, 'Вечера', 2022);
INSERT INTO artists_albums(artist_id, album_id) VALUES
(1,1),
(1,2),
(2,2),
(2,3),
(3,3),
(4,3);
INSERT INTO tracks(track_id, title, release_year, duration_seconds, album_id) VALUES
(1,'Морозное утро',2000, 210, 1),
(2, 'Ветерок', 2010, 200, 1),
(3, 'Солнышко',2020,  220, 2),
(4, 'Мелодия',2022,  180,2),
(5, 'Закат', 2021, 190, 3),
(6, 'Мой любимый город', 2020, 215, 3),
(7, 'Новинка', 2019, 211, 2);
INSERT INTO compilations(compilation_id, title, release_year) VALUES
(1, 'Лучшее', 2020),
(2, 'Хиты', 2021),
(3, 'Избранное', 2022),
(4, 'Золотые хиты', 2023);
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
