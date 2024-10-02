CREATE TABLE IF NOT EXISTS "ingredients"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "price_per_unit" DECIMAL(5,2) CHECK("price_per_unit" >= 0)
);

CREATE TABLE IF NOT EXISTS "customers"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS "donuts"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "gluten_free" BOOLEAN,
    "price_per_donut" DECIMAL(5,2) CHECK("price_per_donut" >= 0)
);

CREATE TABLE IF NOT EXISTS "donut_ingredients"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE IF NOT EXISTS "orders"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE IF NOT EXISTS "ordered_donuts"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);



