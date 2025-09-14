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
1. Количество исполнтителей в каждом жанре
SELECT 
    g.name AS genre_name,
    COUNT(DISTINCT ag.artist_id) AS artist_count
FROM genres g
JOIN artist_genres ag ON g.id = ag.genre_id
GROUP BY g.id, g.name;
2. Количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(t.id) AS tracks_count_2019_2020
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;
3. Средняя продолжительность треков по каждому альбому
SELECT 
    a.title AS album_title,
    AVG(t.duration_seconds) AS avg_duration_seconds
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.id, a.title;
4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM album_artists aa
    JOIN albums al ON aa.album_id = al.id
    WHERE al.year = 2020
);
5. Названия сборников. в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT c.title AS compilation_title
FROM compilations c
JOIN compilation_tracks ct ON c.id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN album_artists aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Диана';
ДЗ 4
1. Названия альбомов, в которых присутствуют исполнители более, чем одного жанра
SELECT DISTINCT a.title
FROM albums a
JOIN album_artists aa ON a.album_id = aa.album_id
JOIN (
    SELECT artist_id
    FROM artist_genres
    GROUP BY artist_id
    HAVING COUNT(DISTINCT genre_id) > 1
) multi_genre_artists ON aa.artist_id = multi_genre_artists.artist_id;
2. Наименования треков, которые не входят в сборники
SELECT t.title
FROM tracks t
LEFT JOIN compilation_tracks ct ON t.track_id = ct.track_id
WHERE ct.track_id IS NULL;
3. Исполнитель или исполнители, написавшие самый короткий по продолжительностти трек, теоретически таких треков может быть несколько
WITH MinDuration AS (
    SELECT MIN(duration) AS min_dur FROM tracks
),
ShortestTracks AS (
    SELECT t.track_id, t.album_id
    FROM tracks t, MinDuration
    WHERE t.duration = MinDuration.min_dur
)
SELECT DISTINCT ar.name
FROM ShortestTracks st
JOIN album_artists aa ON st.album_id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.artist_id;
4. Названия альбомов, содержащих наименьшее количество треков
WITH TrackCounts AS (
    SELECT album_id, COUNT(*) AS track_count
    FROM tracks
    GROUP BY album_id
),
MinCount AS (
    SELECT MIN(track_count) AS min_track_count FROM TrackCounts
)
SELECT a.title
FROM albums a
JOIN TrackCounts tc ON a.album_id = tc.album_id
JOIN MinCount mc ON tc.track_count = mc.min_track_count;