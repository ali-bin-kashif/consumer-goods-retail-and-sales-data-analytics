-- REQUEST 4 

-- Creating CTEs for counting unique products.
-- For 2020
WITH segment_2020 AS (
SELECT
	segment, 
    COUNT(DISTINCT product_code) AS product_count
FROM dim_product
LEFT JOIN fact_gross_price
USING(product_code)
WHERE fiscal_year = 2020
GROUP BY segment
ORDER BY product_count DESC ),

-- For 2021
segment_2021 AS (
SELECT
	segment, 
    COUNT(DISTINCT product_code) AS product_count
FROM dim_product
LEFT JOIN fact_gross_price
USING(product_code)
WHERE fiscal_year = 2021
GROUP BY segment
ORDER BY product_count DESC )

SELECT
	segment,
    s1.product_count AS product_count_2020,
    s2.product_count AS product_count_2021,
    (s2.product_count - s1.product_count) AS difference

-- Joining both CTE Tables
FROM segment_2020 AS s1
INNER JOIN segment_2021 AS s2
USING(segment)
ORDER BY difference DESC;