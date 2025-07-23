SELECT id FROM 
( SELECT id,recordDate,temperature,LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp , LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date 
 FROM Weather ) 
AS Q WHERE DATEDIFF(recordDate,previous_date)=1 AND temperature > previous_temp ;