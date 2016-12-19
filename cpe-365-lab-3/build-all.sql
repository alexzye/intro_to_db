--
--  CSC 365: build all databases
--

-- AIRLINES

-- set echo on
source AIRLINES/AIRLINES-setup.sql
-- set echo off
source AIRLINES/AIRLINES-build-airports100.sql
source AIRLINES/AIRLINES-build-airlines.sql
source AIRLINES/AIRLINES-build-flights.sql
source AIRLINES/AIRLINES-modify.sql

-- BAKERY
-- set echo on
source BAKERY/BAKERY-setup.sql
-- set echo off
source BAKERY/BAKERY-build-goods.sql
source BAKERY/BAKERY-build-customers.sql
source BAKERY/BAKERY-build-receipts.sql
source BAKERY/BAKERY-build-items.sql
source BAKERY/BAKERY-modify.sql

-- CARS
-- set echo on
source CARS/CARS-setup.sql
-- set echo off
source CARS/CARS-build-continents.sql
source CARS/CARS-build-countries.sql
source CARS/CARS-build-car-makers.sql
source CARS/CARS-build-model-list.sql
source CARS/CARS-build-car-names.sql
source CARS/CARS-build-cars-data.sql
source CARS/CARS-modify.sql

-- CSU
-- set echo on
source CSU/CSU-setup.sql
-- set echo off
source CSU/CSU-build-Campuses.sql
source CSU/CSU-build-disciplines.sql
source CSU/CSU-build-degrees.sql
source CSU/CSU-build-discipline-enrollments.sql
source CSU/CSU-build-enrollments.sql
source CSU/CSU-build-faculty.sql
source CSU/CSU-build-csu-fees.sql
source CSU/CSU-modify.sql

-- INN
-- set echo on
source INN/INN-setup.sql
-- set echo off
source INN/INN-build-Rooms.sql
source INN/INN-build-Reservations.sql
source INN/INN-modify.sql

-- MARATHON
-- set echo on
source MARATHON/MARATHON-setup.sql
-- set echo off
source MARATHON/MARATHON-build-marathon.sql

-- STUDENTS
-- set echo on
source STUDENTS/STUDENTS-setup.sql
-- set echo off
source STUDENTS/STUDENTS-build-teachers.sql
source STUDENTS/STUDENTS-build-list.sql
source STUDENTS/STUDENTS-modify.sql

-- WINE
-- set echo on
source WINE/WINE-setup.sql
-- set echo off
source WINE/WINE-build-grapes.sql
source WINE/WINE-build-appellations.sql
source WINE/WINE-build-wine.sql
source WINE/WINE-modify.sql


-- KATZENJAMMER

source KATZENJAMMER/KATZENJAMMER-setup.sql
source KATZENJAMMER/KATZENJAMMER-build-Band.sql
source KATZENJAMMER/KATZENJAMMER-build-Songs.sql
source KATZENJAMMER/KATZENJAMMER-build-Albums.sql
source KATZENJAMMER/KATZENJAMMER-build-Tracklists.sql
source KATZENJAMMER/KATZENJAMMER-build-Instruments.sql
source KATZENJAMMER/KATZENJAMMER-build-Performance.sql
source KATZENJAMMER/KATZENJAMMER-build-Vocals.sql
source KATZENJAMMER/KATZENJAMMER-modify.sql



-- source clean-all.sql;


-- source clean-all.sql


-- set echo on
-- done








