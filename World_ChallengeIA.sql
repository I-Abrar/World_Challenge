#Challenge for World
Show databases;
Use World;
Show tables;

select* from city;
select* from country;
select* from countrylanguage;

#1 Using COUNT, get the number of cities in the USA.
select count(id) from city
where CountryCode='USA';

#2 Find out the population and life expectancy for people in Argentina.
select Population, lifeExpectancy from country
where name="Argentina";

#3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT * FROM country 
WHERE lifeExpectancy IS NOT NULL ORDER BY lifeExpectancy DESC LIMIT 1;

#4 Using JOIN ... ON, find the capital city of Spain.
select city.name from country JOIN city on country.capital = city.id
where country.code ='ESP';

#5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
select countrylanguage.Language, country.region from country join countrylanguage on country.code = countrylanguage.countrycode
where region = 'Southeast Asia';

#6 Using a single query, list 25 cities around the world that start with the letter F
select name from city where name LIKE 'F%' limit 25;

#7 Using COUNT and JOIN ... ON, get the number of cities in China.
select count(city.name) from country join city on country.code = city.countrycode
where code ='CHN';

#8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Name, Population FROM country
WHERE population IS NOT NULL AND Population!=0 ORDER BY population ASC LIMIT 1;

#9 Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(distinct name)
FROM country;

#10 What are the top ten largest countries by area?
select name, surfaceArea from country where surfacearea > 1 order by surfacearea desc limit 10;

#11 List the five largest cities by population in Japan.
select name, population from city where population > 1
and countrycode = 'JPN' order by population desc limit 5;

#12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
#Elisabeth was the mistake! :)
update country
set HeadOfState = 'Elizabeth II';

select name, code, HeadOfState from country where HeadOfState = 'Elizabeth II';

#13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
select* from (
select name, population, surfacearea, (population/surfacearea) as ratio
from country
where population is not null
and population !=0
) as populationToAreaRatio
order by ratio limit 10;

#14 List every unique world language.
select distinct language from countrylanguage;

#15 List the names and GNP of the world's top 10 richest countries.
select name, gnp from country where gnp > 1 order by gnp desc limit 10;

#16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
