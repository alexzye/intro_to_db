--
--  CSC 365: build all databases
--

-- AIRLINES

-- set echo on

-- BAKERY
-- set echo on
source BAKERY/BAKERY-setup.sql
-- set echo off
source BAKERY/BAKERY-insert.sql

-- CARS
-- set echo on
source CARS/CARS-setup.sql
-- set echo off
source CARS/CARS-insert.sql

-- CSU
-- set echo on
source CSU/CSU-setup.sql
-- set echo off
source CSU/CSU-insert.sql


-- INN
-- set echo on
source INN/INN-setup.sql
-- set echo off
source INN/INN-insert.sql

source MARATHON/MARATHON-setup.sql
source MARATHON/MARATHON-insert.sql

-- STUDENTS
-- set echo on
source STUDENTS/STUDENTS-setup.sql
-- set echo off
source STUDENTS/STUDENTS-insert.sql;

-- WINE
-- set echo on
source WINE/WINE-setup.sql
-- set echo off
source WINE/WINE-insert.sql;


-- KATZENJAMMER

source KATZENJAMMER/KATZENJAMMER-setup.sql
source KATZENJAMMER/KATZENJAMMER-insert.sql;

-- source lab7-all.sql


-- set echo on
-- done








