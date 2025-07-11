-- 장르별 상위 3개 아티스트 및 트랙 수
-- 각 장르별로 트랙 수가 가장 많은 상위 3명의 아티스트(artist_id, name, track_count)를 구하세요.
-- 동점일 경우 아티스트 이름 오름차순 정렬.

WITH RankedArtists AS (
  SELECT
    g.name AS genre_name,
    ar.artist_id,
    ar.name AS artist_name,
    COUNT(t.track_id) AS track_count,
    RANK() OVER (
      PARTITION BY g.name 
      ORDER BY
        COUNT(t.track_id) DESC,
        ar.name ASC             
    ) AS artist_rank
  FROM
    artists ar
    JOIN albums al ON ar.artist_id = al.artist_id
    JOIN tracks t ON al.album_id = t.album_id
    JOIN genres g ON t.genre_id = g.genre_id
  GROUP BY
    g.name,
    ar.artist_id,
    ar.name
)
SELECT
  genre_name,
  artist_id,
  artist_name,
  track_count
FROM
  RankedArtists
WHERE
  artist_rank <= 3
ORDER BY
  genre_name ASC, 
  artist_rank ASC;