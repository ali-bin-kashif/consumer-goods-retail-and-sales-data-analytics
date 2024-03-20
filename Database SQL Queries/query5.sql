SELECT
	product_code,
    product,
    manufacturing_cost
FROM fact_manufacturing_cost
LEFT JOIN dim_product
USING(product_code)
WHERE
	manufacturing_cost =
    (SELECT MAX(manufacturing_cost)
	 FROM fact_manufacturing_cost)
     OR
     manufacturing_cost =
    (SELECT MIN(manufacturing_cost)
	 FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;