-- REQUEST 8
/*This query will return sold quantity in millions
grouped by quarters*/

SELECT
	CONCAT('Q', EXTRACT(QUARTER FROM date)) AS quarter,
    ROUND(SUM(sold_quantity)/1000000,2) AS total_sold_quantity_mln
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY CONCAT('Q', EXTRACT(QUARTER FROM date))
ORDER BY total_sold_quantity_mln DESC;
