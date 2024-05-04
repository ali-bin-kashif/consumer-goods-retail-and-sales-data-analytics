-- REQUEST 10

/*This query will return Top 3 products in each division
in fiscal year 2021*/


-- Creating CTEs for to get top 3 products in each division
WITH ns_division AS (
SELECT
	division,
    product,
    SUM(sold_quantity) AS total_sold_quantity,
    RANK() OVER(ORDER BY SUM(sold_quantity) DESC) AS rank_order
FROM fact_sales_monthly
INNER JOIN dim_product
USING(product_code)
WHERE fiscal_year = 2021
	AND division = 'N & S'
GROUP BY product
ORDER BY total_sold_quantity DESC
LIMIT 3 ),

pa_division AS (
SELECT
	division,
    product,
    SUM(sold_quantity) AS total_sold_quantity,
    RANK() OVER(ORDER BY SUM(sold_quantity) DESC) AS rank_order
FROM fact_sales_monthly
INNER JOIN dim_product
USING(product_code)
WHERE fiscal_year = 2021
	AND division = 'P & A'
GROUP BY product
ORDER BY total_sold_quantity DESC
LIMIT 3 ),

pc_division AS (
SELECT
	division,
    product,
    SUM(sold_quantity) AS total_sold_quantity,
    RANK() OVER(ORDER BY SUM(sold_quantity) DESC) AS rank_order
FROM fact_sales_monthly
INNER JOIN dim_product
USING(product_code)
WHERE fiscal_year = 2021
	AND division = 'PC'
GROUP BY product
ORDER BY total_sold_quantity DESC
LIMIT 3 )


-- Joining all CTEs together
SELECT * FROM ns_division
UNION
SELECT * FROM pa_division
UNION
SELECT * FROM pc_division;
