CREATE TABLE IF NOT EXISTS meteorites_temp (
    name VARCHAR(50),
    id INTEGER,
    nametype VARCHAR(50),
    class VARCHAR(50),
    mass DECIMAL,
    discovery VARCHAR(50),
    year INTEGER,
    lat DECIMAL,
    long DECIMAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE meteorites_temp
SET mass=NULL
WHERE mass='';

UPDATE meteorites_temp
SET year=NULL
WHERE year='';

UPDATE meteorites_temp
SET lat=NULL
WHERE lat='';

UPDATE meteorites_temp
SET long=NULL
WHERE long='';

UPDATE meteorites_temp
SET lat = ROUND(CAST(lat AS DECIMAL), 2);

UPDATE meteorites_temp
SET long = ROUND(CAST(long AS DECIMAL), 2);

DELETE FROM meteorites_temp
WHERE nametype='Relict';

CREATE TABLE IF NOT EXISTS meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
    name VARCHAR(50),
    class VARCHAR(50),
    mass DECIMAL(10,2),
    discovery VARCHAR(50),
    year INTEGER,
    lat DECIMAL(10,2),
    long DECIMAL(10,2)
);

INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
    SELECT name, class, mass, discovery, year, lat, long FROM meteorites_temp
    ORDER BY year, name ASC;

DROP TABLE IF EXISTS meteorites_temp;
