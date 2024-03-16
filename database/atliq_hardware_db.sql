-- REQUEST 1
SELECT DISTINCT(market)
FROM dim_customer
WHERE region = 'APAC'
	AND customer = 'Atliq Exclusive';
    
-- REQUEST 3
SELECT 
	segment,
    COUNT(DISTINCT product_code) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC;

--

