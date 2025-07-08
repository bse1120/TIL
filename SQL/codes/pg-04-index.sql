-- pg-04-index.sql

-- 인덱스 조회
SELECT
	tablename,
	indexname,
	indexdef
FROM pg_indexes
WHERE tablename IN ('large_orders', 'large_customers');

ANALYZE large_orders;
ANALYZE large_customers;

-- 실제 운영에서는 X (캐시 날리기)
SELECT pg_stat_rest();

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE customer_id='CUST-25000.';  -- 37506 / 131.757 ms 

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE amount BETWEEN 800000 AND 1000000;  -- 46296 / 201.674 ms

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE -- 41244 / 270.485 ms
	region='서울' AND amount > 500000 AND order_date >= '2024-07-08';

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE region = '서울'
ORDER BY amount DESC  -- 39722 / 154.334ms
LIMIT 100;


CREATE INDEX idx_orders_customer_id ON large_orders(customer_id);
CREATE INDEX idx_orders_amount ON large_orders(amount);
CREATE INDEX idx_orders_region ON large_orders(region);


EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE customer_id='CUST-25000.'; -- index 87 / 0.087ms

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE amount BETWEEN 800000 AND 1000000;  -- 46296 / 201.674 ms

EXPLAIN ANALYZE
SELECT COUNT(*) FROM large_orders WHERE region='서울'; -- 3423 / 12.774ms


-- 복합 인덱스
CREATE INDEX idx_orders_region_amount ON large_orders(region, amount);

EXPLAIN ANALYZE
SELECT * FROM large_orders
WHERE region = '서울' AND amount > 800000;  -- 226ms > 216ms

CREATE INDEX idx_orders_id_order_date ON large_orders(customer_id, order_date);

EXPLAIN ANALYZE
SELECT * FROM large_orders  
WHERE customer_id = 'CUST-25000.'    -- 0.058ms -> 0.047ms
  AND order_date >= '2024-07-01'
ORDER BY order_date DESC;


-- 복합 인덱스 순서의 중요도

CREATE INDEX idx_orders_region_amount ON large_orders(region, amount);
CREATE INDEX idx_orders_amount_region ON large_orders(amount, region);

SELECT
	indexname,
	pg_size_pretty(pg_relation_size(indexname::regclass)) AS index_size
FROM pg_indexes
WHERE tablename = 'large_orders'
  AND indexname LIKE '%region%amount%' OR indexname LIKE '%amount%region%'
ORDER BY indexname;

-- Index 순서 가이드라인

-- 고유값 비율
SELECT
	COUNT(DISTINCT region) AS 고유지역수,  -- 카디널리티
	COUNT(*) AS 전체행수,
	ROUND(COUNT(DISTINCT region) * 100 / COUNT(*), 2) AS 선택도
FROM large_orders;  -- 0.0007%

SELECT
	COUNT(DISTINCT amount) AS 고유금액수,  -- 카디널리티
	COUNT(*) AS 전체행수
FROM large_orders;  -- 선택도(데이터 중복도) 99%

SELECT
	COUNT(DISTINCT customer_id) AS 고유고객수,  -- 카디널리티
	COUNT(*) AS 전체행수
FROM large_orders;  -- 선택도 5.0%