/*
Alex Ye
aye01@calpoly.edu
*/
-- Q1
SELECT DISTINCT a.Airline, a.Abbrev
FROM `airlines` a, `flights` f
WHERE a.Id = f.Airline
AND (f.Source = "KKI" OR f.Dest = "KKI")
ORDER BY a.Airline;

-- Q2
SELECT DISTINCT f.FlightNo, ap.Code, a.Airline, ap.Name
FROM `airlines` a, `flights` f, `airports100` ap
WHERE f.Airline = a.Id
AND f.Dest = "KKI"
AND a.Abbrev = "UAL"
AND f.Dest = ap.Code
ORDER BY f.FlightNo ASC;

-- Q3
SELECT DISTINCT f.FlightNo, f1.FlightNo 
FROM `airlines` a, `flights` f, `airports100` ap, `flights` f1
WHERE f.Source = "AXX"
AND f.Dest = f1.Source
AND f1.FlightNo = f.FlightNo + 1
AND f.Airline = a.Id
AND a.Abbrev = "Northwest";

-- Q4
SELECT DISTINCT f.Airline, f1.Airline
FROM `airlines` a, `flights` f, `airports100` ap, `flights` f1, `airlines` a2, `airports100` ap1
WHERE f.Dest = f1.Source
AND f.Airline = a.Id
AND f1.Airline = a2.Id
AND a.Id > a2.Id
AND ((a.Abbrev = "USAir" AND a2.Abbrev = "AirTran") OR (a2.Abbrev = "USAir" AND a.Abbrev = "AirTran"));

-- Q5
