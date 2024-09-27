SELECT first_name, last_name FROM players
WHERE height>(SELECT ROUND(AVG(CAST(height AS FLOAT)), 0) FROM players)
ORDER BY height DESC, first_name ASC, last_name ASC;
