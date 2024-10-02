CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE check_ins (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "timestamp" NUMERIC,
    "flight_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flight"("id")
);


CREATE TABLE airlines(
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE flights(
    "id" INTEGER,
    "airline_id" INTEGER,
    "airport_from" TEXT,
    "airport_to" TEXT,
    "departure_timestamp" NUMERIC,
    "arrival_timestamp" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
