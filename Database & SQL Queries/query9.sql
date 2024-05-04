-- REQUEST 9

/* This query will return gross sales in and overall percentages
by Channels*/

-- Creating CTE to avoid overcomplexity is subqueries
WITH gross_sales_by_channel AS (
SELECT 
	channel,
    SUM(gross_price * sold_quantity) AS gross_sales
FROM fact_sales_monthly 
INNER JOIN dim_customer
USING(customer_code)
INNER JOIN ( SELECT product_code, gross_price
			 FROM fact_gross_price
             WHERE fiscal_year = 2021) AS gross_price_2021
ON fact_sales_monthly.product_code = gross_price_2021.product_code
WHERE fiscal_year = 2021
GROUP BY channel )

SELECT
	channel,
    ROUND(gross_sales/1000000,2) AS gross_sales_mln,
    ROUND(gross_sales / (SELECT SUM(gross_sales)
    FROM gross_sales_by_channel) * 100,2)
    AS percentage
FROM gross_sales_by_channel
ORDER BY percentage DESC;