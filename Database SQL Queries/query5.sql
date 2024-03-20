-- REQUEST 5

-- This query will return 2 products, one with max manf. cost and one with min.
SELECT
	product_code,
    product,
    manufacturing_cost
FROM fact_manufacturing_cost

-- Left join fact table with product dimension
LEFT JOIN dim_product
USING(product_code)

-- Using subqueries to get max and min manifacturing cost.
WHERE
	manufacturing_cost =
    (SELECT MAX(manufacturing_cost)
	 FROM fact_manufacturing_cost)
     OR
     manufacturing_cost =
    (SELECT MIN(manufacturing_cost)
	 FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;