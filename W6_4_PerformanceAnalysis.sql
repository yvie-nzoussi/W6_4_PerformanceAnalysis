-- ==============================================
-- Deliverable W6.4: Performance Analysis
-- Tables: PersonTest and ProductTest
-- ==============================================

-- ===============================
-- TABLE 1: PersonTest
-- ===============================

-- 1️⃣ Slow query on a non-indexed column
SELECT BusinessEntityID, FirstName, LastName
FROM PersonTest
WHERE MiddleName = 'A';

-- 2️⃣ Check if the index already exists and drop it if necessary
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_PersonTest_MiddleName')
    DROP INDEX IX_PersonTest_MiddleName ON PersonTest;

-- 3️⃣ Create the recommended index
CREATE NONCLUSTERED INDEX IX_PersonTest_MiddleName
ON PersonTest(MiddleName);

-- 4️⃣ Re-run the query after creating the index
SELECT BusinessEntityID, FirstName, LastName
FROM PersonTest
WHERE MiddleName = 'A';

-- 5️⃣ Check existing indexes on the table
EXEC sp_helpindex 'PersonTest';

-- ===============================
-- TABLE 2: ProductTest
-- ===============================

-- 1️⃣ Slow query on a non-indexed column
SELECT ProductID, Name, ProductNumber
FROM ProductTest
WHERE Color = 'Red';

-- 2️⃣ Check if the index already exists and drop it if necessary
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_ProductTest_Color')
    DROP INDEX IX_ProductTest_Color ON ProductTest;

-- 3️⃣ Create the recommended index
CREATE NONCLUSTERED INDEX IX_ProductTest_Color
ON ProductTest(Color);

-- 4️⃣ Re-run the query after creating the index
SELECT ProductID, Name, ProductNumber
FROM ProductTest
WHERE Color = 'Red';

-- 5️⃣ Check existing indexes on the table
EXEC sp_helpindex 'ProductTest';

-- ===============================================
-- END OF SCRIPT
-- ===============================================
