CREATE TABLE IF NOT EXISTS "users"(
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "schools"(
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "companies"(
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE IF NOT EXISTS "connections_people"(
    "id" INTEGER,
    "user_A_id" INTEGER,
    "user_B_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("user_A_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_B_id") REFERENCES "users"("id")
);


CREATE TABLE IF NOT EXISTS "schools_affiliations"(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "affiliation_start" NUMERIC,
    "affiliation_end" NUMERIC,
    "degree_type" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE IF NOT EXISTS "companies_affiliations"(
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "affiliation_start" NUMERIC,
    "affiliation_end" NUMERIC,
    "title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);




