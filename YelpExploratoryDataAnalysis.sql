Part 1: Yelp Dataset Profiling and Understanding

-- Profile the data by finding the total number of records for each of the tables below:

--i. Attribute table = 10000
--ii. Business table = 10000
--iii. Category table = 10000
--iv. Checkin table = 10000
--v. elite_years table = 10000
--vi. friend table = 10000
--vii. hours table = 10000
--viii. photo table = 10000
--ix. review table = 10000
--x. tip table = 10000
--xi. user table = 10000
--	


--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

--i. Business = 10000
--ii. Hours = 1562
--iii. Category = 2643
--iv. Attribute = 1115
--v. Review = ID = 10000, business_id = 8090, 9581
--vi. Checkin = 493
--vii. Photo = ID = 10000, business_id = 6493
--viii. Tip = user_id = 537, business_id = 3979
--ix. User = 10000
--x. Friend = 11
--xi. Elite_years = 2780

--Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

--	Answer: NO
	
	
--	SQL code used to arrive at answer: 

SELECT id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos

FROM USER

WHERE ID IS null OR name IS null or review_count IS NULL or yelping_since IS NULL OR useful IS NULL OR funny IS NULL OR COOL IS NULL OR fans IS NULL OR average_stars IS NULL OR COMPLIMENT_HOT IS NULL OR COMPLIMENT_MORE IS NULL OR COMPLIMENT_PROFILE IS NULL OR COMPLIMENT_CUTE IS NULL OR COMPLIMENT_LIST IS NULL OR COMPLIMENT_NOTE IS NULL OR COMPLIMENT_PLAIN IS NULL OR COMPLIMENT_FUNNY IS NULL OR COMPLIMENT_WRITER IS NULL OR COMPLIMENT_PHOTOS IS NULL
	
	

	
--4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

--	i. Table: Review, Column: Stars
	
--		min: 1		max: 5		avg:  3.7082
		
	
--	ii. Table: Business, Column: Stars
	
--		min:1.0	max:5.0	avg: 3.6549
		
	
--	iii. Table: Tip, Column: Likes
	
--		min: 0 		max: 2		avg: 0.0144
		
	
--	iv. Table: Checkin, Column: Count
	
--		min: 1		max: 53	 	avg: 1.9414
		
	
--	v. Table: User, Column: Review_count
	
--		min: 0 		max:2000		avg:24.2995
		


--5. List the cities with the most reviews in descending order:

--	SQL code used to arrive at answer: 

SELECT city, SUM(review_count) as TotalReviews
FROM business
GROUP BY city
ORDER BY TotalReviews DESC
	
	
--	Copy and Paste the Result Below:
	
--+-----------------+--------------+
--| city            | TotalReviews |
--+-----------------+--------------+
--| Las Vegas       |        82854 |
--| Phoenix         |        34503 |
--| Toronto         |        24113 |
--| Scottsdale      |        20614 |
--| Charlotte       |        12523 |
--| Henderson       |        10871 |
--| Tempe           |        10504 |
--| Pittsburgh      |         9798 |
--| Montréal        |         9448 |
--| Chandler        |         8112 |
--| Mesa            |         6875 |
--| Gilbert         |         6380 |
--| Cleveland       |         5593 |
--| Madison         |         5265 |
--| Glendale        |         4406 |
--| Mississauga     |         3814 |
--| Edinburgh       |         2792 |
--| Peoria          |         2624 |
--| North Las Vegas |         2438 |
--| Markham         |         2352 |
--| Champaign       |         2029 |
--| Stuttgart       |         1849 |
--| Surprise        |         1520 |
--| Lakewood        |         1465 |
--| Goodyear        |         1155 |
--+-----------------+--------------+
--(Output limit exceeded, 25 of 362 total rows shown)

	
--6. Find the distribution of star ratings to the business in the following cities:

--i. Avon

--SQL code used to arrive at answer: 

SELECT stars, sum(review_count) as count 
FROM business
WHERE city = 'Avon'
GROUP BY stars


--Copy and Paste the Resulting Table Below (2 columns – star rating and count):
-- +-------+-------+
--| stars | count |
--+-------+-------+
--|   1.5 |    10 |
--|   2.5 |     6 |
--|   3.5 |    88 |
--|   4.0 |    21 |
--|   4.5 |    31 |
--|   5.0 |     3 |
--+-------+-------+


--ii. Beachwood
--
--SQL code used to arrive at answer:

SELECT stars, sum(review_count) as count
FROM business
WHERE city = 'Beachwood'
GROUP BY stars


--Copy and Paste the Resulting Table Below (2 columns – star rating and count):
--		
--+-------+-------+
--| stars | count |
--+-------+-------+
--|   2.0 |     8 |
--|   2.5 |     3 |
--|   3.0 |    11 |
--|   3.5 |     6 |
--|   4.0 |    69 |
--|   4.5 |    17 |
--|   5.0 |    23 |
--+-------+-------+


--7. Find the top 3 users based on their total number of reviews:
--		
--	SQL code used to arrive at answer:

SELECT id, name, review_count
FROM user
ORDER BY review_count DESC
LIMIT 3

--	Copy and Paste the Result Below:
--+------------------------+--------+--------------+
--| id                     | name   | review_count |
--+------------------------+--------+--------------+
--| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
--| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
--| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
--+------------------------+--------+--------------+
		


--8. Does posing more reviews correlate with more fans?
--
--	Please explain your findings and interpretation of the results: 

After inputting the following query:

SELECT id, name, review_count, fans
FROM user
ORDER BY review_count desc

--I received the following result:
-- +------------------------+-----------+--------------+------+
--| id                     | name      | review_count | fans |
--+------------------------+-----------+--------------+------+
--| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |  253 |
--| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |   50 |
--| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 |   76 |
--| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon      |         1246 |  101 |
--| -FZBTkAZEXoP7CYvRV2ZwQ | William   |         1215 |  126 |
--| --2vR0DIsmQ6WfcSzKWigw | Harald    |         1153 |  311 |
--| -gokwePdbXjfS0iF7NsUGA | eric      |         1116 |   16 |
--| -DFCC64NXgqrxlO8aLU5rg | Roanna    |         1039 |  104 |
--| -8EnCioUmDygAbsYZmTeRQ | Mimi      |          968 |  497 |
--| -0IiMAZI2SsQ7VmyzJjokQ | Christine |          930 |  173 |
--| -fUARDNuXAfrOn4WLSZLgA | Ed        |          904 |   38 |
--| -hKniZN2OdshWLHYuj21jQ | Nicole    |          864 |   43 |
--| -9da1xk7zgnnfO1uTVYGkA | Fran      |          862 |  124 |
--| -B-QEUESGWHPE_889WJaeg | Mark      |          861 |  115 |
--| -kLVfaJytOJY2-QdQoCcNQ | Christina |          842 |   85 |
--| -kO6984fXByyZm3_6z2JYg | Dominic   |          836 |   37 |
--| -lh59ko3dxChBSZ9U7LfUw | Lissa     |          834 |  120 |
--| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |          813 |  159 |
--| -l9giG8TSDBG1jnUBUXp5w | Alison    |          775 |   61 |
--| -dw8f7FLaUmWR7bfJ_Yf0w | Sui       |          754 |   78 |
--| -AaBjWJYiQxXkCMDlXfPGw | Tim       |          702 |   35 |
--| -jt1ACMiZljnBFvS6RRvnA | L         |          696 |   10 |
--| -IgKkE8JvYNWeGu8ze4P8Q | Angela    |          694 |  101 |
--| -hxUwfo3cMnLTv-CAaP69A | Crissy    |          676 |   25 |
--| -H6cTbVxeIRYR-atxdielQ | Lyn       |          675 |   45 |
--+------------------------+-----------+--------------+------+
--(Output limit exceeded, 25 of 10000 total rows shown)

--It appears that there a moderate correlation between total amount of reviews and total amount of fans. 
--However, a more in-depth analysis with the correct correlation coefficient is needed to ascertain the effect. 
	
--9. Are there more reviews with the word "love" or with the word "hate" in them?

--	Answer: There are more reviews with the word love than hate. Love = 1780. Hate = 232

--	SQL code used to arrive at answer:

SELECT count(text) as Num_Love
FROM review
WHERE text like '%love%'

SELECT count(text) as Num_Love
FROM review
WHERE text like '%hate%'

	
--10. Find the top 10 users with the most fans:

SQL code used to arrive at answer:
SELECT id, name, fans
FROM user
ORDER BY fans DESC
LIMIT 10
	
--	Copy and Paste the Result Below:
--+------------------------+-----------+------+
--| id                     | name      | fans |
--+------------------------+-----------+------+
--| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
--| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
--| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
--| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
--| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
--| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
--| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
--| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
--| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
--| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
--+------------------------+-----------+------+

	
		

--Part 2: Inferences and Analysis
--
--1.	Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
--
--i. Do the two groups you chose to analyze have a different distribution of hours?
--
-- Yes. Red Rocks Canyon Visitor Center (4-5 stars) and Walgreens (2-3 stars) have slightly different distribution of hours, but open during the same day. 
--
--ii. Do the two groups you chose to analyze have a different number of reviews?
-- 
--Yes, the Red Rocks Visitor Center has 32 total reviews and Walgreens has 6 total reviews. 
--         
--iii. Are you able to infer anything from the location data provided between these two groups? Explain.
--
--Yes. There would be a larger sample of people visiting the Red Rocks Visitor Center, which is a tourist attraction, as opposed to the pharmacy/convenience store, Walgreens. 
--People visiting a tourist attraction are more likely to leave a review as opposed to a walgreens, which people a
--
--SQL code used for analysis:

SELECT
CASE
WHEN stars>=4 THEN '4-5 Stars'
WHEN (stars>=2 AND stars<=3) THEN '2-3 Stars'
END as StarCategories,
name,
city,
category,
stars,
hours,
review_count
FROM business INNER JOIN category on category.business_id = business.id
INNER JOIN hours ON hours.business_id = business.id
WHERE city='Las Vegas'
      AND category = 'Shopping'
ORDER BY stars DESC		
		
--2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
--i. Difference 1: Businesses that are closed have fewer reviews compared to businesses that are open. 
         
         
--ii.Difference 2: Businesses that are open have higher ratings when compared to businesses that are closed. 
         
         
         
--SQL code used for analysis: 

SELECT
name,
city,
category,
stars,
hours,
review_count,
is_open
FROM business INNER JOIN category on category.business_id = business.id
INNER JOIN hours ON hours.business_id = business.id
WHERE city='Mesa'
GROUP BY is_open
	
	
--3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
--
--Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
--	
--i. Indicate the type of analysis you chose to do: Is there a correlation between the total number of years a user is an *elite* member to the total number of fans. 
--         
         
--ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data: 

--I will be requiring data from two tables: user and elite_years. From there, I will select the columns “name, fans” and subtract the current year (2022) from the “years” table to calculate the total years the user has been a member. 
--I will limit the output to the top 25 for brevity. 
                           
                  
--iii. Output of your finished dataset:

--+---------+------+------------+
--| name    | fans | TotalYears |
--+---------+------+------------+
--| Lissa   |  120 |         13 |
--| Ed      |   38 |         12 |
--| Lissa   |  120 |         12 |
--| Elaine  |   18 |         11 |
--| Chris   |    2 |         11 |
--| Ed      |   38 |         11 |
--| Dominic |   37 |         11 |
--| Lissa   |  120 |         11 |
--| Dixie   |   41 |         10 |
--| Elaine  |   18 |         10 |
--| Matt    |   14 |         10 |
--| Jia     |    8 |         10 |
--| Mel     |    9 |         10 |
--| Chris   |    2 |         10 |
--| Ed      |   38 |         10 |
--| Danial  |    5 |         10 |
--| Dominic |   37 |         10 |
--| Lissa   |  120 |         10 |
--| Dixie   |   41 |          9 |
--| Brad    |    1 |          9 |
--| Elaine  |   18 |          9 |
--| Matt    |   14 |          9 |
--| Jia     |    8 |          9 |
--| Mel     |    9 |          9 |
--| Chris   |    2 |          9 |
--+---------+------+------------+
         
         
--iv. Provide the SQL code you used to create your final dataset:

Select name, fans, '2022' - year as TotalYears
FROM user
INNER JOIN elite_years ey ON ey.user_id = user.id
ORDER BY totalyears DESC
LIMIT 25
