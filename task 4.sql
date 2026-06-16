use world ;

-- Count Cities in USA: Scenario: You've been tasked with conducting a demographic analysis of cities in the United States first step is to determine the total number of cities within the country to provide a baseline for further analysis. --
 
SELECT COUNT(*) AS total_cities
FROM city
WHERE CountryCode ='USA';

-- Scenario: As part of a global health initiative,
-- you've been assigned to identify the country with the highest life expectancy.
 -- This information will be crucial for prioritising healthcare resources and interventions. --  

select lifeexpectancy, name from country
order by lifeexpectancy desc
limit 5;

select name from city 
where name like "%new%";

select name, population from city 
order by population desc 
limit 10;

select name, population from city 
where population > 2000000 
order by (select population) desc;

select name, population from city 
where name like "%be%";

select name, population from city 
where population between 500000 and 1000000
order by (select population) desc;

select name from country 
order by name ;

select name, population from city  
order by population desc
limit 1;

select name,count(name) from city 
group by name
order by count(name) desc;

select name, population from city  
order by population asc
limit 1;

select name, population from country  
order by population desc
limit 1;

SELECT city.Name AS Capital
FROM city
JOIN country
ON city.ID = country.Capital
WHERE country. Name ='Spain';

