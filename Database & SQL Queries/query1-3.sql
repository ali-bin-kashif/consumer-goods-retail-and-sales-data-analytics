-- REQUEST 1
-- Selecting all unique market names where region is APAC and customer is Amazon.
SELECT DISTINCT(market)
FROM dim_customer
WHERE region = 'APAC'
	 AND customer = 'Amazon';

-- REQUEST 2

-- This query will return the product count for both fiscal years and percentage change bw them.
SELECT
	p2020.p_count AS unique_products_2020,
	p2021.p_count AS unique_products_2021,
    ROUND((p2021.p_count - p2020.p_count)/p2020.p_count * 100
    ,2) AS percentage_chg
FROM
	-- Using subqueries in FROM clause for 2020 and 2021 fiscal year
	(SELECT COUNT(product_code) AS p_count
    FROM fact_gross_price WHERE fiscal_year=2020) AS p2020,
    (SELECT COUNT(product_code) AS p_count
    FROM fact_gross_price WHERE fiscal_year=2021) AS p2021;
    
-- REQUEST 3
-- This query will return the products count grouped by segments.
SELECT 
	segment,
    COUNT(DISTINCT product_code) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC;



