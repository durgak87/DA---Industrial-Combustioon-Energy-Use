create database fuel;
use fuel;
-- Q1
SELECT fuel_type, SUM(mmbtu_Total) 
FROM data 
WHERE fuel_type IN ('Ethane', 'Ethanol (100%)')
GROUP BY fuel_type;
-- Q2
select facility_name,avg(gwht_total) from data where facility_name = "3M Company";
-- Q3
SELECT Unit_Name, reporting_year, sum(GWht_Total)
FROM data
WHERE reporting_year BETWEEN 1950 AND 2020
GROUP BY Unit_Name, reporting_year
ORDER BY sum(GWht_Total) desc;
-- Q4
select  COALESCE(NULLIF(MECS_Region, ''), 'Others') as Region,
sum(mmbtu_total)/(select sum(mmbtu_total) from data) * 100 as mmbtu_perc, 
sum(gwht_total)/(select sum(gwht_total) from data) *100 as gwht_perc
from data 
group by mecs_region
order by gwht_perc desc;
-- Q5
SELECT PRIMARY_NAICS_TITLE, Facility_Name, Fuel_Type,
       COUNT(*) AS Total_Count,
       SUM(MMBtu_Total) AS Total_MMBtu,
       SUM(GWht_Total) AS Total_GWht
FROM data
GROUP BY PRIMARY_NAICS_TITLE, Facility_Name, Fuel_Type
ORDER BY Total_MMBtu desc, PRIMARY_NAICS_TITLE, Facility_Name, Fuel_Type;