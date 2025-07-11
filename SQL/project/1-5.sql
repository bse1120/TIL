-- 각 장르별 트랙 수 집계
--각 장르(genres.name)별로 트랙 수를 집계하고, 트랙 수 내림차순으로 정렬하세요.

SELECT g.name,
COUNT(*) AS name_count
FROM genres g
INNER JOIN tracks t ON g.genre_id = t.genre_id
GROUP BY g.name
ORDER BY name_count DESC;