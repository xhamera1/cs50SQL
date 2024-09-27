-- second additional
SELECT strftime("%Y", air_date) AS year,
strftime("%m-%d", MIN(air_date)) as date
FROM episodes
GROUP BY year;

