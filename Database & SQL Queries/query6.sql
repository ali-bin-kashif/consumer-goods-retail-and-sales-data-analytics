-- REQUEST 6

/*This query will return top 5 customers who recieved 
high discounts in fiscal year 2021 and Australia*/
SELECT
	customer_code,
    customer,
    pre_invoice_discount_pct
FROM fact_pre_invoice_deductions
INNER JOIN dim_customer
USING(customer_code)
WHERE fiscal_year = 2021
	AND market = 'Australia'
ORDER BY pre_invoice_discount_pct DESC
LIMIT 5;