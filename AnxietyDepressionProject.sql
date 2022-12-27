SELECT *
FROM AnxietyDepression7DaysData addd 

-- Filter to data of interest

Select Symptoms, Value as Percent, ConfidenceInterval, SubdemographicPhase, State, TimeperiodStartDate, TimePeriodEndDate,
FROM AnxietyDepression7DaysData addd 

-- Which subdemographic has the highest rate and lowest of symptoms. Excluding nulls since baseline reports no data.
Select Symptoms, Value as Percent, ConfidenceInterval, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate 
FROM AnxietyDepression7DaysData addd
WHERE Percent and ConfidenceInterval is NOT NULL
Group by Subdemographic 
Order by Percent DESC

Select Symptoms, Value as Percent, ConfidenceInterval, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate 
FROM AnxietyDepression7DaysData addd
WHERE Percent and ConfidenceInterval is NOT NULL
Group by Subdemographic 
Order by Percent ASC

-- Older adults 70-79 have the lowest rates of symptoms. 

-- Transgender demographic, bisexual, and disability subdemographic has the highest percentage of symptoms of anxiety/depression, anxiety, and depression within past 7 days during phase 3

-- Which demographic has the highest percentage of symptoms when specific to depressive disorder or anxiety

Select Symptoms, Value as Percent, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Percent
AND ConfidenceInterval is NOT NULL
AND Symptoms = 'Symptoms of Depressive Disorder'
GROUP BY Subdemographic 
ORDER BY Percent DESC

Select Symptoms, Value as Percent,Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate,  ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Percent
AND ConfidenceInterval is NOT NULL
AND Symptoms = 'Symptoms of Anxiety Disorder'
GROUP BY Subdemographic
ORDER BY Percent DESC

-- Transgender still the highest in both symptoms.

-- Who are most affected during phases 1 and 2?

Select Symptoms,Value as Percent, Phase, State, TimeperiodStartDate, TimePeriodEndDate, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Value 
AND ConfidenceInterval is NOT NULL
AND Phase = 1 
Order by Value DESC

Select Symptoms, Value as Percent, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Value 
AND ConfidenceInterval is NOT NULL
AND Phase = 2
Order by Value DESC

-- Young adults (18-29) and non-hispanic races are among highest effected in both phase 1 and 2.

-- The state of Oregon also appears to be within the top 10 

-- Where is the transgender population and with disabilities?

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Value 
AND ConfidenceInterval is NOT NULL
AND Phase = 1
AND Subdemographic = 'Transgender'

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Value 
AND ConfidenceInterval is NOT NULL
AND Phase = 1
AND Subdemographic = 'With disability'

-- Neither Transgender or disability subdemographic is represented during phase 1 and phase 2 of data collection. Indicating a huge gap in the representation of these groups.

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Value 
AND ConfidenceInterval is NOT NULL
AND Subdemographic = 'With disability'

-- Who is most effected when stratified by year?

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Percent 
AND ConfidenceInterval is NOT NULL
AND TimePeriodStartDate LIKE '%2020%'
ORDER BY Percent DESC

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Percent 
AND ConfidenceInterval is NOT NULL
AND TimePeriodStartDate LIKE '%2021%'
ORDER BY Percent DESC

Select Symptoms, Subdemographic, Phase, State, TimeperiodStartDate, TimePeriodEndDate, Value as Percent, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Percent 
AND ConfidenceInterval is NOT NULL
AND TimePeriodStartDate LIKE '%2022%'
ORDER BY Percent DESC

-- Young adults are the most effected at year 2020, with transgender population most effected in 2021 and 2022. 

-- Average percentage affected in entire population and create view. 


Create View TotalPercentageAnxietyDespressiveDisorder as
Select Symptoms, Subdemographic, avg(value) as PercentageOfSymptoms, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Symptoms = 'Symptoms of Anxiety Disorder or Depressive Disorder'
GROUP BY Subdemographic
ORDER BY PercentageOfSymptoms DESC

Create View TotalPercentageAnxietyDisorder as
Select Symptoms, Subdemographic, avg(value) as PercentageOfSymptoms, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Symptoms = 'Symptoms of Anxiety Disorder'
GROUP BY Subdemographic
ORDER BY PercentageOfSymptoms DESC

Create View TotalPercentageDepressiveDisorder as
Select Symptoms, Subdemographic, avg(value) as PercentageOfSymptoms, ConfidenceInterval
FROM AnxietyDepression7DaysData addd
WHERE Symptoms = 'Symptoms of Depressive Disorder'
GROUP BY Subdemographic
ORDER BY PercentageOfSymptoms DESC

-- This data analysis does show, that the transgender population, people with disabilities, and young adults (18-29), had significant impacts on mental health symptoms during 2020-2022.
-- Public policy and mental health resources should create a system to address these issues. 





