-- REQUEST 7

SELECT
	date,
    MONTHNAME(date) as month,
    EXTRACT(YEAR from date) as year,
    ROUND(SUM((sold_quantity * gross_price))/1000000,2) AS gross_sales_mln
FROM fact_sales_monthly
INNER JOIN dim_customer
USING(customer_code)

INNER JOIN fact_gross_price
ON fact_sales_monthly.product_code = fact_gross_price.product_code
	AND fact_sales_monthly.fiscal_year = fact_gross_price.fiscal_year

WHERE customer = 'Atliq Exclusive'
GROUP BY date;