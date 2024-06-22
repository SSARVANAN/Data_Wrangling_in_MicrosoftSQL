UPDATE Sales.InvoiceLines
SET Sales.InvoiceLines.UnitPrice = Sales.InvoiceLines.UnitPrice + 20
WHERE
Sales.InvoiceLines.InvoiceLineID = 
(
	SELECT MIN(MIL.InvoiceLineID)
	FROM Sales.InvoiceLines AS MIL
	WHERE MIL.InvoiceID =
	(
		SELECT MIN(I.InvoiceId)  
		FROM Sales.Invoices AS I, Sales.InvoiceLines AS IL
		WHERE 
			I.InvoiceID = IL.InvoiceID
			AND I.CustomerID = 1060
	)
)