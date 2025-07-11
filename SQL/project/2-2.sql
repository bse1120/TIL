-- 가장 많이 팔린 트랙 TOP 5
-- 판매량(구매된 수량)이 가장 많은 트랙 5개(track_id, name, 총 판매수량)를 출력하세요.
-- 동일 판매수량일 경우 트랙 이름 오름차순 정렬하세요.

SELECT
    t.track_id,
    t.name,
    SUM(ii.quantity) AS total_quantity_sold
FROM
    tracks t
JOIN
    invoice_items ii ON t.track_id = ii.track_id
GROUP BY
    t.track_id, t.name
ORDER BY
    total_quantity_sold DESC, t.name ASC
LIMIT 5;