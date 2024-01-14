WITH x AS (SELECT measurement_value,measurement_time,
ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time as date) ORDER BY measurement_time) AS rownum
FROM measurements)

SELECT CAST(measurement_time as date) as measurement_day,
SUM(CASE WHEN MOD(rownum,2)=1 THEN measurement_value END) as odd_sum,
SUM(CASE WHEN MOD(rownum,2)=0 THEN measurement_value END) as even_sum
FROM x
GROUP BY CAST(measurement_time as date)
ORDER BY measurement_day;