WITH prom_Accrual (priority, id, data, month)
AS
(  
	-- Расставляем приоритет 
    SELECT row_number() over(PARTITION BY month ORDER BY data ASC) AS 'priority', id, data, month
	FROM accrual
    ORDER BY data
)

SELECT a.priority, a.id 'id Долга', a.data 'a_data', a.month 'a.month', p.id 'id Платежа', p.data 'p_data', p.month 'p.month'
FROM prom_accrual as a RIGHT JOIN payment as p
		ON a.month = p.month
WHERE (a.data is NULL) OR (a.data <= p.data) AND (a.priority = 1) 
