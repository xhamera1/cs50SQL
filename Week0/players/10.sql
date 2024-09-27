SELECT first_name , last_name, birth_year, final_game AS "end_career" FROM players
WHERE final_game IS NOT NULL AND birth_year>="2002"
ORDER BY birth_year, final_game, first_name, last_name;
