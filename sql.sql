---How many rows are in the data_analyst_jobs table? 
---1793 rows
/*select count (*) from data_analyst_jobs; */

---Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
---answer: ExxonMobil
/*select * from
data_analyst_jobs
limit 10;*/

---How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
--21 jobs in TN. 27 jobs in either TN or KY.
/*Select *
from data_analyst_jobs
where location = 'TN';*/

/*Select * 
from data_analyst_jobs
where location = 'TN' or location = 'KY';*/

---How many postings in Tennessee have a star rating above 4?
--- 3 postings
/*Select *
from data_analyst_jobs
where location = 'TN' and star_rating >4;*/

---How many postings in the dataset have a review count between 500 and 1000?
---151 postings.
/*select *
from data_analyst_jobs
where review_count between 500 and 1000;*/

---Show the average star rating for each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
---Nebraska
/*select location as state, avg(star_rating) as avg_rating
from data_analyst_jobs
group by state 
order by avg_rating desc;*/

---Select unique job titles from the data_analyst_jobs table. How many are there?
---881
/*select count (distinct title)
from data_analyst_jobs;*/

---How many unique job titles are there for California companies?
---230
/*select count (distinct title)
from data_analyst_jobs
where location = 'CA';*/

---Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
--41 companies.
/*select company, avg(star_rating) as avg_rating
from data_analyst_jobs
where review_count >5000
group by company;*/

---Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
--General Motors with 4.2 rating.
/*select company, avg(star_rating) as avg_rating
from data_analyst_jobs
where review_count >5000
group by company
order by avg_rating desc;*/

---Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
---774
/*select count(distinct title) 
from data_analyst_jobs
where title ilike '%Analyst%'*/

---How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
---4. They have the word Tableau in common.
/*select distinct title 
from data_analyst_jobs
where title not ilike '%Analyst%' and title not ilike '%Analytics%';*/

---correction question 9
/*select count(*)
from (select company, sum(review_count) as total_reviews,  avg(star_rating) as avg_rating
from data_analyst_jobs
where company is not null
group by company
having sum(review_count) > 5000
order by company
) as sub_query_10*/

--correction question 10
--Google has the highest rating with 4.3.
/*select 
company, sum(review_count) as total_reviews,  round(avg(star_rating),2) as avg_rating
from data_analyst_jobs
where star_rating is not null and company is not null
group by company,star_rating
having sum(review_count) > 5000
order by round(avg(star_rating),2) desc*/




