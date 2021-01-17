SELECT * FROM
(SELECT a.id 'id Долга', a.data 'a_data', a.month 'a.month', p.id 'id Платежа', p.data 'p_data', p.month 'p.month'
FROM accrual as a LEFT JOIN payment as p
		ON a.month = p.month
UNION
SELECT a.id 'id Долга', a.data 'a_data', a.month 'a.month', p.id 'id Платежа', p.data 'p_data', p.month 'p.month'
FROM accrual as a RIGHT JOIN payment as p
		ON a.month = p.month) fullunion
WHERE fullunion.a_data <= fullunion.p_data