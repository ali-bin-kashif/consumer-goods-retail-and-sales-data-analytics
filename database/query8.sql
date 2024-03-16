-- REQUEST 8

SELECT
	EXTRACT(QUARTER FROM date) AS quarter,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE EXTRACT(YEAR FROM date) = 2020
GROUP BY EXTRACT(QUARTER FROM date)
ORDER BY total_sold_quantity DESC;