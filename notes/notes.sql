SQLITE

0.  > .tables - Wyświetla listę wszystkich tabel w bieżącej bazie danych.
    > .schema - Wyświetla schemat (definicję struktury) wszystkich tabel i indeksów w bazie danych
      .schema table_name
    > .quit / .q - Zamyka SQLite i kończy sesję.
    > .databases - Zwraca listę wszystkich baz danych otwartych w bieżącej sesji wraz z ich ścieżkami do plików.
    > .mode - Zmienia format wyświetlania wyników zapytań SQL. Domyślnie wyniki są wyświetlane w formie tabeli z wierszami i kolumnami. 
              Można zmienić format na inne, takie jak CSV, list, column, HTML itp.
      .mode csv
    > .header - Włącza lub wyłącza wyświetlanie nagłówków kolumn w wynikach zapytania.
      .header ON
    > .read - Wykonuje skrypt SQL z zewnętrznego pliku.
      .read script.sql



1. SELECT - Służy do pobierania danych z bazy danych. Wynik zapytania SELECT jest zestawem rekordów (tabelą wynikową). 

    > SELECT column1, column2, ...
      FROM table_name
      WHERE condition;

    > SELECT FirstName, Salary FROM Employees
      WHERE Salary > 50000
      LIMIT 15;

    > SELECT FirstName AS 'Imię', LastName AS 'Nazwisko' FROM Employees;

2. FROM 
3. WHERE
4. LIMIT
5. AS
6. AND, OR, =, !=, <, >, <>, NOT

7. NULL - brak wartosci

    > SELECT * FROM Employees
      WHERE ManagerID IS NOT NULL;

8. LIKE - służy do wyszukiwania danych w kolumnie na podstawie dopasowania do wzorca. Używa się go w połączeniu z klauzulą WHERE, aby znaleźć rekordy, 
          które odpowiadają określonemu schematowi (wzorowi). Najczęściej korzysta się z symboli wieloznacznych (wildcards), takich jak % i _, aby zdefiniować wzorce.

          Symbole wieloznaczne:
            1. % — zastępuje dowolną liczbę znaków (może to być zero, jeden lub więcej znaków).
            2. _ — zastępuje dokładnie jeden znak.

            > SELECT column1, column2, ...
              FROM table_name
              WHERE column_name LIKE pattern;

            > SELECT * FROM Customers
              WHERE FirstName LIKE 'A%';  -- wszyskie rekordy ktore zaczynaja sie na A

            > SELECT * FROM Customers
              WHERE LastName LIKE '%son';  -- wszystkie rekordy ktore koncza sie na son

            > SELECT * FROM Products
              WHERE ProductName LIKE '%phone%';   -- wszystkie produkty, które mają w nazwie słowo "phone" (np. "Smartphone", "Headphone").

            > SELECT * FROM Employees
              WHERE LastName LIKE 'Sm_th'; -- Pobiera wszystkich pracowników, których nazwisko ma pięć znaków, zaczyna się od "Sm", 
                                           -- kończy na "th", a czwarty znak może być dowolny (np. "Smith", "Smyth").

            > SELECT * FROM Employees
              WHERE FirstName NOT LIKE 'J%'; -- wszytskie rekordy ktore NIE zaczynaja sie na J

9. BETWEEN .. AND ..   // albo: NOT BETWEEN .. AND ..

    > SELECT * FROM Products                 this equals: > SELECT * FROM Products
      WHERE Price BETWEEN 50 AND 100;                       WHERE Price >= 50 AND Price <= 100;

    daty:
    > SELECT * FROM Orders
      WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'; 

    Wartości tekstowe:
    > SELECT * FROM Employees
      WHERE LastName BETWEEN 'A' AND 'M';

10. ORDER BY - do sortowania wyników zapytania w porządku rosnącym (domyślnie) lub malejącym na podstawie jednej lub wielu kolumn.

    ASC — porządek rosnący (domyślne zachowanie, można pominąć).
    DESC — porządek malejący.

    > SELECT * FROM Employees  -- porzadek rosnacy
      ORDER BY LastName ASC;

    > SELECT * FROM Products  -- porzadek malejacy
      ORDER BY Price DESC;    

    > SELECT * FROM Employees                   -- Najpierw sortuje pracowników według DepartmentID w porządku rosnącym, 
      ORDER BY DepartmentID ASC, LastName DESC; -- a następnie w ramach każdego działu sortuje ich według nazwiska w porządku malejącym.

    > SELECT * FROM Employees  -- w niektorych bazach danych mozna okreslic czy wartosci NULL beda na kncu czy poczatku
      ORDER BY Salary DESC NULLS LAST;      -- w tym przypadku na koncu

11. COUNT() -  funkcja agregująca w SQL, która służy do zliczania liczby wierszy (rekordów) w wyniku zapytania. 

    > SELECT COUNT(Salary) FROM Employees; 

    - DISTINCT - zlicza unikalne kolumny
    > SELECT COUNT(DISTINCT DepartmentID) FROM Employees;


12. AVG() - funkcja agregująca w SQL, która służy do obliczania średniej arytmetycznej wartości w wybranej kolumnie. Ignoruje wartosci NULL

    > SELECT AVG(Rating) FROM Reviews
      WHERE ProductID = 101;

    > SELECT AVG(CAST(Grade AS FLOAT)) FROM Students; -- rzutowanie Grade na float 


13. MIN() - zwraca najmniejszą wartość z wybranej kolumny.

    > SELECT MIN(Salary) FROM Employees
      WHERE DepartmentID = 3;

14. MAX() - zwraca największą wartość z wybranej kolumny.

    > SELECT MAX(Salary) FROM Employees
      WHERE DepartmentID = 3;

    > SELECT MIN(LENGTH(ProductName)), MAX(LENGTH(ProductName))   -- najkrotsza i najdluzsza nazwa produktu
      FROM Products;

15. ROUND()

    > SELECT ROUND(Price, 2) FROM Products;  -- zaokraglenie do 2 miejsc po przecinku

    > SELECT ROUND(Quantity, -1) FROM Orders;   -- zaokraglenie do dziesiątek

16. strftime - pozwala wyobrebnic cos z daty 

    > SELECT title
      FROM episodes
      WHERE strftime('%m', air_date) = '12'; 

17. GROUP BY - służy do grupowania wyników na podstawie jednej lub więcej kolumn. Umożliwia podzielenie wyników zapytania na grupy, a następnie wykonanie 
               operacji agregujących (takich jak SUM(), COUNT(), AVG(), MIN(), MAX()) na każdej z tych grup.

    > SELECT strftime("%Y", air_date) AS year,
      strftime("%m-%d", MIN(air_date)) as date
      FROM episodes
      GROUP BY year;

