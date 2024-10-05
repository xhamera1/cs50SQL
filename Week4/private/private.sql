CREATE TABLE IF NOT EXISTS words(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word VARCHAR(50)
);

INSERT INTO words (word)
SELECT substr(sentence, 98, 4) FROM sentences WHERE id = 14
UNION ALL
SELECT substr(sentence, 3, 5) FROM sentences WHERE id = 114
UNION ALL
SELECT substr(sentence, 72, 9) FROM sentences WHERE id = 618
UNION ALL
SELECT substr(sentence, 7, 3) FROM sentences WHERE id = 630
UNION ALL
SELECT substr(sentence, 12, 5) FROM sentences WHERE id = 932
UNION ALL
SELECT substr(sentence, 50, 7) FROM sentences WHERE id = 2230
UNION ALL
SELECT substr(sentence, 44, 10) FROM sentences WHERE id = 2346
UNION ALL
SELECT substr(sentence, 14, 5) FROM sentences WHERE id = 3041;

CREATE VIEW "message" AS
SELECT word AS phrase
FROM words;
