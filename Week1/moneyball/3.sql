SELECT year, HR FROM performances
WHERE player_id=(
    SELECT id FROM players WHERE first_name LIKE '%Ken%' AND last_name LIKE '%Griffey%')
ORDER BY year DESC;
