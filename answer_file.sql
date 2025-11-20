-- Student Name: Pinhas Menahem Erlich
-- Class: hermon
-- ID: 322683962


-- Question 1
-- SQL: SELECT COUNT(*) FROM `imdb_top_1000` WHERE `IMDB_Rating` > 8;

-- Answer:322


-- Question 2
-- SQL: SELECT MAX(IMDB_Rating) FROM `imdb_top_1000`;

-- Answer:9.3


-- Question 3
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Genre` LIKE 'Drama';

-- Answer:289


-- Question 4
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Genre` LIKE 'Action';

-- Answer:172


-- Question 5
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Released_Year` = 2010;

-- Answer:23


-- Question 6
-- SQL:SELECT MIN(Runtime) FROM `imdb_top_1000`;

-- Answer:45


-- Question 7
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Meta_score` > 85;

-- Answer:249


-- Question 8
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Gross` > 100000000;

-- Answer:186


-- Question 9
-- SQL:SELECT AVG(IMDB_Rating) FROM `imdb_top_1000`;

-- Answer:7.94930


-- Question 10
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Certificate` LIKE 'R';

-- Answer:146


-- Question 11
-- SQL:SELECT `Genre`, COUNT(*) AS total_genre FROM `imdb_top_1000` GROUP BY `Genre` ORDER BY total_genre DESC;

-- Answer:Drama


-- Question 12
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Genre` LIKE '%Adventure%' AND `Released_Year` > 2010 AND `Certificate` NOT LIKE 'PG%';

-- Answer:13


-- Question 13
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Runtime` BETWEEN 95 AND 140;

-- Answer:669


-- Question 14
-- SQL:SELECT `Released_Year`, COUNT(*) AS total_year FROM `imdb_top_1000` WHERE `Released_Year` > 1940 GROUP BY `Released_Year` ORDER BY total_year;

-- Answer:1943


-- Question 15
-- SQL:SELECT MAX(Gross) FROM `imdb_top_1000` WHERE `Genre` LIKE 'Comedy';

-- Answer:9600000


-- Question 16
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `IMDB_Rating` BETWEEN 7.3 AND 8.1;

-- Answer:805


-- Question 17
-- SQL:SELECT AVG(Meta_score) FROM `imdb_top_1000` WHERE `Genre` LIKE 'Thriller';

-- Answer:81


-- Question 18
-- SQL:SELECT COUNT(*) FROM `imdb_top_1000` WHERE `Released_Year` < 1980;

-- Answer:276


-- Question 19
-- SQL:SELECT `Genre`, AVG(IMDB_Rating) AS avg_genre FROM `imdb_top_1000` GROUP BY `Genre` ORDER BY avg_genre;

-- Answer:Family, Thriller אותו דבר


-- Question 20
-- SQL:SELECT MAX(Runtime) FROM `imdb_top_1000` WHERE `Genre` LIKE 'Horror';

-- Answer:122


-- Question 21
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE YEAR(date) = 2020;

-- Answer:1465


-- Question 22
-- SQL:SELECT MAX(casualties) FROM `disasters`;

-- Answer:445


-- Question 23
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE `disaster_type` LIKE 'Flood';

-- Answer:996


-- Question 24
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE `disaster_type` LIKE 'Earthquake' AND `country` IN ('Brazil', 'India');

-- Answer:99


-- Question 25
-- SQL:SELECT AVG(casualties) FROM `disasters` WHERE `disaster_type` IN ('Wildfire', 'Hurricane') AND `response_time_hours` < 10;

-- Answer:123.9360


-- Question 26
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE casualties = 0;

-- Answer:27


-- Question 27
-- SQL:SELECT MIN(economic_loss_usd) FROM `disasters`;

-- Answer:876.16


-- Question 28
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE `economic_loss_usd` > 1000000000;

-- Answer:0


-- Question 29
-- SQL:SELECT YEAR(date) ,COUNT(*) FROM `disasters` GROUP BY YEAR(date) ORDER BY COUNT(*) DESC LIMIT 1;

-- Answer:2023


-- Question 30
-- SQL:SELECT YEAR(date) FROM `disasters` WHERE `severity_index` > 4 AND `aid_amount_usd` > 50000 GROUP BY YEAR(date) LIMIT 1;

-- Answer:2018


-- Question 31
-- SQL:SELECT `disaster_type`, COUNT(*) FROM `disasters` GROUP BY disaster_type ORDER BY COUNT(*) DESC LIMIT 1;

-- Answer:Landslide


-- Question 32
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE `disaster_type` LIKE '%Storm%';

-- Answer:1005


-- Question 33
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE `casualties` BETWEEN 50 AND 500;

-- Answer:7701


-- Question 34
-- SQL:SELECT YEAR(date), COUNT(*) FROM `disasters` GROUP BY YEAR(date) ORDER BY COUNT(*) LIMIT 1;

-- Answer:2019


-- Question 35
-- SQL:SELECT MAX(economic_loss_usd) FROM `disasters` WHERE `disaster_type` LIKE 'Flood';

-- Answer:21803567.75



-- Question 36
-- SQL:SELECT COUNT(*) FROM `disasters` WHERE (YEAR(date) BETWEEN 2010 AND 2024) AND (`severity_index` > 5);

-- Answer:5110


-- Question 37
-- SQL:SELECT AVG(casualties) FROM `disasters` WHERE (`disaster_type` LIKE 'Earthquake') AND (`recovery_days` > 40 OR `response_time_hours` BETWEEN 5 AND 15);

-- Answer:111.5781


-- Question 38
-- SQL:SELECT MAX(economic_loss_usd), MAX(severity_index) FROM `disasters`

-- Answer:24442640.70


-- Question 39
-- SQL:SELECT `date`, `country`, `disaster_type`, `severity_index`, `casualties`,`economic_loss_usd`, `response_time_hours`, `aid_amount_usd`, `response_efficiency_score`, `recovery_days`,(recovery_days +(response_time_hours / 24)) AS totla_days FROM `disasters` ORDER BY totla_days LIMIT 1;

-- Answer:3.029583 זה מספר הימים התשובה עצמה בגוף הטבלה


-- Question 40
-- SQL:SELECT YEAR(date),(economic_loss_usd + aid_amount_usd) AS totla_amount FROM `disasters` ORDER BY totla_amount DESC LIMIT 1;

-- Answer:2021

יצירת טבלת imdb_tearly: CREATE TABLE imdb_yearly AS SELECT Released_Year AS year_value, SUM( CASE WHEN Genre LIKE '%Action%' AND Genre NOT LIKE '%Comedy%' THEN 1 ELSE 0 END ) AS action_count, SUM( CASE WHEN Genre LIKE '%Comedy%' AND Genre NOT LIKE '%Action%' THEN 1 ELSE 0 END ) AS comedy_count FROM imdb_top_1000 GROUP BY Released_Year;

יצירת עמודה year_value: ALTER TABLE disasters ADD COLUMN year_value INT;


עדכון השנה: UPDATE disasters SET `year_value` = YEAR(date);

יצירת טבלה disasters_for_years: CREATE TABLE disasters_for_years AS
SELECT YEAR(date) AS value_year, COUNT(*) AS count_disaster
FROM `disasters` 
GROUP BY value_year

פקודת ה join: SELECT imdb_yearly.year_value, imdb_yearly.action_count, imdb_yearly.comedy_count, disasters_for_years.count_disaster FROM disasters_for_years INNER JOIN imdb_yearly ON disasters_for_years.value_year = imdb_yearly.year_value ORDER BY disasters_for_years.count_disaster;

הנתונים מראים בבירור שאין קשר בין מספר האסונות למספר סרטי האקשן
בעוד שבשנה בה היה עליה במספר האסונות אכן היה הכפלה במספר סרטי האקשן, בפועל בשנה בה היה הכי הרבה אסונות לא היו סרטי אקשן בכלל!!

-- Research Section
-- SQL:

-- Answer: 
