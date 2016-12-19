/*
Alex Ye
aye01@calpoly.edu
*/

-- Q1
SELECT makers.Name
FROM `car-makers` makers, `countries` country
WHERE makers.Country = country.CountryId
AND country.Name = "japan";

-- Q2
SELECT DISTINCT data.Year
FROM `cars-data` data, `car-names` names
WHERE data.Id = names.MakeId
AND names.Model = "fiat"
ORDER BY data.Year 
ASC;

-- Q3
SELECT names.description, data.Year, data.Horsepower, data.Mpg
FROM `cars-data` data, `car-names` names
WHERE data.Id = names.MakeId
AND names.Model = "Volkswagen"
AND data.Year <= 1982
AND data.Year >= 1980
ORDER BY data.Horsepower
DESC;

-- Q4
SELECT names.description, makers.Name
FROM `car-names` names, `car-makers` makers, `cars-data` data, `model-list` model
WHERE data.Id = names.MakeId
AND names.Model = model.Model
AND model.Maker = makers.Id
AND data.Cylinders != 4
AND data.Year = 1979
AND data.Mpg > 20
AND data.Accelerate < 15;

-- Q5
SELECT names.description, data.Year, data.Weight/data.Horsepower
FROM `car-names` names, `cars-data` data, `model-list` model, `car-makers` makers, `countries` country
WHERE data.Id = names.MakeId
AND names.Model = model.Model
AND model.Maker = makers.Id
AND makers.Country = country.CountryId
AND country.Name = "france"
AND data.Weight IS NOT NULL
AND data.Horsepower IS NOT NULL
ORDER BY data.Weight/data.Horsepower
DESC;