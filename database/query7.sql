-- REQUEST 7

SELECT
	date,
    MONTHNAME(date) as month,
    EXTRACT(YEAR from date) as year,
    ROUND(SUM((sold_quantity * gross_price)),2) AS gross_sales
FROM fact_sales_monthly
INNER JOIN dim_customer
USING(customer_code)

INNER JOIN fact_gross_price
USING(product_code)

WHERE customer = 'Atliq Exclusive'
GROUP BY date
ORDER BY gross_sales DESC;