
-- *** The Lost Letter ***

SELECT * FROM packages WHERE contents LIKE "%congratu%"; -- finding out information about letter

| id  |       contents        | from_address_id | to_address_id |
+-----+-----------------------+-----------------+---------------+
| 384 | Congratulatory letter | 432             | 854           |


 SELECT * FROM scans WHERE package_id IN (
   ...> SELECT id FROM packages WHERE contents LIKE "%congratu%");

| id | driver_id | package_id | address_id | action |         timestamp          |
+----+-----------+------------+------------+--------+----------------------------+ -- finding out about what happened with package
| 54 | 1         | 384        | 432        | Pick   | 2023-07-11 19:33:55.241794 |
| 94 | 1         | 384        | 854        | Drop   | 2023-07-11 23:07:04.432178 |
+----+-----------+------------+------------+--------+----------------------------+

SELECT address, type FROM addresses WHERE id IN (
   ...> SELECT address_id FROM scans WHERE package_id IN (
   ...> SELECT id FROM packages WHERE contents LIKE "%congratu%")
   ...> AND action="Drop");

+-------------------+-------------+
|      address      |    type     |  -- RESULT
+-------------------+-------------+
| 2 Finnigan Street | Residential |
+-------------------+-------------+


-- *** The Devious Delivery ***

    -- From the report I supposed that the package might have been connected with duck, so :

    SELECT * FROM packages WHERE contents LIKE "%duck%"
    AND from_address_id IS NULL;

    and I got only one result:

|  id  |   contents    | from_address_id | to_address_id |
+------+---------------+-----------------+---------------+
| 5098 | Duck debugger | NULL            | 50            |

    SELECT * FROM scans WHERE package_id IN (
   ...> SELECT id FROM packages WHERE contents LIKE "%duck%"
   ...> AND from_address_id IS NULL)
   ...> AND action="Drop";

|  id   | driver_id | package_id | address_id | action |         timestamp          |
+-------+-----------+------------+------------+--------+----------------------------+
| 30140 | 10        | 5098       | 348        | Drop   | 2023-10-24 10:08:55.610754 |
+-------+-----------+------------+------------+--------+----------------------------+

    SELECT address, type FROM addresses WHERE id IN (
   ...> SELECT address_id FROM scans WHERE package_id IN (
   ...> SELECT id FROM packages WHERE contents LIKE "%duck%"
   ...> AND from_address_id IS NULL)
   ...> AND action="Drop");

   -- final result:

|     address      |      type      |
+------------------+----------------+
| 7 Humboldt Place | Police Station |
+------------------+----------------+

-- *** The Forgotten Gift ***

    SELECT * FROM scans WHERE address_id IN (
   ...> SELECT id FROM addresses WHERE address="109 Tileston Street")
   ...> AND action="Pick";

|  id   | driver_id | package_id | address_id | action |         timestamp          |
+-------+-----------+------------+------------+--------+----------------------------+
| 10432 | 11        | 9523       | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
+-------+-----------+------------+------------+--------+----------------------------+


SELECT * FROM scans WHERE package_id IN (
   ...> SELECT package_id FROM scans WHERE address_id IN (
   ...> SELECT id FROM addresses WHERE address="109 Tileston Street")
   ...> AND action="Pick");


+-------+-----------+------------+------------+--------+----------------------------+
|  id   | driver_id | package_id | address_id | action |         timestamp          |
+-------+-----------+------------+------------+--------+----------------------------+
| 10432 | 11        | 9523       | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
| 10500 | 11        | 9523       | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
| 12432 | 17        | 9523       | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
+-------+-----------+------------+------------+--------+----------------------------+

 -- so the driver_id picked the package

SELECT * FROM packages WHERE id=9523;

|  id  | contents | from_address_id | to_address_id |
+------+----------+-----------------+---------------+
| 9523 | Flowers  | 9873            | 4983          |
+------+----------+-----------------+---------------+

SELECT name FROM drivers WHERE id IN (
   ...> SELECT driver_id FROM scans WHERE package_id IN (
   ...> SELECT package_id FROM scans WHERE address_id IN (
   ...> SELECT id FROM addresses WHERE address="109 Tileston Street")
   ...> AND action="Pick") AND timestamp>"2023-08-17 03:31:36.856889"); -- At that time the package was dropped off so the driver who has the package now must have taken it after that time


+-------+
| name  |
+-------+
| Mikel |
+-------+
