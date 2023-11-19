-- Working with the customers table

-- SELECT all rows
SELECT * FROM customers;

-- SELECT with condition
SELECT * FROM customers
WHERE state = 'NY'

-- SELECT with multiple conditions
SELECT * FROM customers
WHERE state = 'NY' AND (city = 'Brooklyn' OR postalcode = '11201')


-- UPDATE customer data
UPDATE customers
SET email = 'lindahall@yahoo.com'
WHERE id = 8