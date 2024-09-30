-- 11:
-- SELECT players.first_name, players.last_name, salaries.salary/performances.H AS 'dollars_per_hit' FROM players
-- JOIN salaries ON players.id=salaries.player_id
-- JOIN performances ON players.id=performances.player_id AND performances.year=salaries.year
-- WHERE salaries.year=2001 AND performances.H!=0
-- ORDER BY dollars_per_hit ASC
-- LIMIT 10;



SELECT first_name, last_name FROM players
WHERE id IN (SELECT id FROM (SELECT players.id, players.first_name, players.last_name, salaries.salary/performances.H AS 'dollars_per_hit' FROM players
    JOIN salaries ON players.id=salaries.player_id
    JOIN performances ON players.id=performances.player_id AND performances.year=salaries.year
    WHERE salaries.year=2001 AND performances.H!=0
    ORDER BY dollars_per_hit ASC
    LIMIT 10))
AND  id IN (SELECT id FROM (SELECT players.id, players.first_name, players.last_name, salaries.salary/performances.RBI AS 'dollars_per_RBI' FROM players
    JOIN salaries ON players.id=salaries.player_id
    JOIN performances ON players.id=performances.player_id AND performances.year=salaries.year
    WHERE salaries.year=2001 AND performances.RBI!=0
    ORDER BY dollars_per_RBI ASC
    LIMIT 10));

