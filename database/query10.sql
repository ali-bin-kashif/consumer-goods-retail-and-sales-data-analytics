SELECT
	division,
    product_code,
    product,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
INNER JOIN dim_product
USING(product_code)
WHERE fiscal_year = 2021
GROUP BY division, product, product_code;