-- 1. non_usa_customers.sql: Provide a query showing Customers
--      (just their full names, customer ID and country) who are not in the US.
SELECT CustomerID, FirstName || ' ' || LastName AS Name , Country
FROM Customer
Where Country  != 'USA'


-- 2.brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT CustomerID, FirstName || ' ' || LastName AS Name , Country
FROM Customer
Where Country  = 'Brazil'


-- 3.brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil.
--     The resultant table should show
--     customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.FirstName || ' ' || c.LastName AS Name, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
FROM Invoice
JOIN Customer c ON c.CustomerId = INvoice.CustomerId
WHERE c.Country = 'Brazil'

-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT Employee.FirstName || ' ' || Employee.LastName AS Sales_Agent_Name
FROM Employee
Where Employee.Title = 'Sales Support Agent'

-- 5. unique_invoice_countries.sql: Provide a query showing a
--      unique/distinct list of billing countries from the Invoice table.
SELECT BillingCountry FROM Invoice
GROUP BY BillingCountry

-- 6.sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent.
--      The resultant table should include the Sales Agent's full name.
SELECT e.FirstName || ' ' || e.LastName AS Sales_agent_name, i.InvoiceId
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId
JOIN Employee e ON e.EmployeeId = c.SupportRepId

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total,
--Customer name, Country and Sale Agent name for all invoices and customers.
SELECT i.Total AS Invoice_total, c.FirstName ||' '||c.LastName AS Cust_name,
c.Country, e.FirstName||' '||e.LastName AS Sales_agent_name
FROM Invoice i
JOIN Customer c ON c.CustomerId = i.CustomerId
JOIN Employee e ON e.EmployeeId = c.SupportRepId

-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT count(InvoiceId) AS invoice_count, substr(InvoiceDate, 1, 4)
FROM Invoice
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
OR InvoiceDate BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY InvoiceDate LIKE '2009%' AND '2011%'

-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT SUM(Total) AS year_total_sales, substr(InvoiceDate, 1, 4)
FROM Invoice
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
OR InvoiceDate BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY InvoiceDate LIKE '2009%' AND '2011%'

--10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query
--that COUNTs the number of line items for Invoice ID 37.
SELECT count(InvoiceId)as num_line_items, InvoiceId FROM InvoiceLine
WHERE InvoiceId = 37






