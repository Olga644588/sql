ДЗ 2
1. Название и продолжительность самого длинного трека
SELECT title, duration_seconds
FROM tracks
ORDER BY duration_seconds DESC 
LIMIT 1;
2. Названия треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT title
FROM tracks
WHERE duration_seconds >=210;
3. Названия сборников, вышедших в период  с 2018 по 2020 год включительно
SELECT title
FROM compilations
WHERE year BETWEEN 2018 AND 2020;
4. Исполнители, чье имя состоит из одного слова 
SELECT name
FROM artists
WHERE name NOT LIKE "%%";
5. Названия треков, которые содержат слово "Мой" или "My"
SELECT title
FROM tracks
WHERE title ILIKE "%Мой%",
   OR title ILIKE "%My%";
ДЗ 3
1. Количество исполнителей в каждом жанре
SELECT 
    g.name AS genre,
    COUNT(DISTINCT ag.artist_id) AS artist_count
FROM genres g
LEFT JOIN artist_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_id, g.name;
2. Количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(*) AS tracks_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;
3. Средняя продолжительность треков по каждому альбому
SELECT 
    a.title AS album_title,
    AVG(t.duration_seconds) AS avg_duration_seconds
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.title;
4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.artist_id, ar.name
FROM artists ar
LEFT JOIN
    artists_albums aa ON ar.artist_id = aa.artist_id
LEFT JOIN
    albums a ON aa.album_id = a.album_id
WHERE
    a.release_year IS NULL OR a.release_year<"2020"OR a.release_year>"2020"
    GROUP BY ar.artist_id, ar.name
HAVING
    COUNT(a.album_id) = 0;
5. Названия сборников. в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT c.title AS compilation_title
FROM compilations c
JOIN compilations_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN artists_albums aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = "Диана";
