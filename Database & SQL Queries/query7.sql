-- REQUEST 7

--This query will return gross_sales overs time of Atliq Exclusive

SELECT
	date,
    MONTHNAME(date) as month,
    EXTRACT(YEAR from date) as year,
    -- Divide by 1 million to convert values in millions
    ROUND(SUM((sold_quantity * gross_price))/1000000,2) AS gross_sales_mln
FROM fact_sales_monthly
INNER JOIN dim_customer
USING(customer_code)

-- Joining with gross price fact table to get gross prices
INNER JOIN fact_gross_price
ON fact_sales_monthly.product_code = fact_gross_price.product_code
	AND fact_sales_monthly.fiscal_year = fact_gross_price.fiscal_year

-- Filtering customer
WHERE customer = 'Atliq Exclusive'
GROUP BY date;