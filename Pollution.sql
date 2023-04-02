

--1.Which entity had the highest number of deaths due to outdoor air pollution in 2019?

SELECT TOP 1 
	 entity
	,[Year] 
	,MAX([Deaths - Cause: Risk: Outdoor air pollution]) AS Higest_Death
FROM 
	number_of_death_factors
WHERE 
	[Year] = '2019'
GROUP BY 
	 entity
	,[Year]
ORDER BY 
	Higest_Death DESC


--2.What's the higest Number of deaths in china 2019 for all factors?

SELECT
	Entity, 
	[Year], 
	MAX([Deaths - Cause: Outdoor air pollution]) AS [Deaths - Outdoor air pollution],
	MAX([Deaths - Cause: High systolic blood pressure]) AS [Deaths - High systolic blood pressure],
	MAX([Deaths - Cause: Diet high in sodium ]) AS [Deaths - Diet high in sodium],
	MAX([Deaths - Cause: Diet low in whole grains ]) AS [Deaths - Diet low in whole grains],
	MAX([Deaths - Cause: Alcohol use - Sex: Both ]) AS [Deaths - Alcohol use],
	MAX([Deaths - Cause: Diet low in fruits]) AS [Deaths - Diet low in fruits],
	MAX([Deaths - Cause: Unsafe water source ]) AS [Deaths - Unsafe water source],
	MAX([Deaths - Cause: Secondhand smoke ]) AS [Deaths - Secondhand smoke],
	MAX([Deaths - Cause: Low birth weight ]) AS [Deaths - Low birth weight],
	MAX([Deaths - Cause: Child wasting ]) AS [Deaths - Child wasting],
	MAX([Deaths - Cause: Unsafe sex]) AS [Deaths - Unsafe sex],
	MAX([Deaths - Cause: Diet low in nuts and seeds ]) AS [Deaths - Diet low in nuts and seeds],
	MAX([Deaths - Cause: Household air pollution ]) AS [Deaths - Household air pollution],
	MAX([Deaths - Cause: Diet low in vegetables ]) AS [Deaths - Diet low in vegetables],
	MAX([Deaths - Cause: Low physical activity ]) AS [Deaths - Low physical activity],
	MAX([Deaths - Cause: Smoking]) AS [Deaths - Smoking],
	MAX([Deaths - Cause: High fasting plasma glucose]) AS [Deaths - High fasting plasma glucose],
	MAX([Deaths - Cause: Air pollution]) AS [Deaths - Air pollution],
	MAX([Deaths - Cause: High body-mass index ]) AS [Deaths - High body-mass index],
	MAX([Deaths - Cause: Unsafe sanitation ]) AS [Deaths - Unsafe sanitation],
	MAX([Deaths - Cause: No access to handwashing facility]) AS [Deaths - No access to handwashing facilities],
	MAX([Deaths - Cause: Drug use - Sex: Both ]) AS [Deaths - Drug use],
	MAX([Deaths - Cause: Low bone mineral density ]) AS [Deaths - Low bone mineral density],
	MAX([Deaths - Cause: Vitamin A deficiency ]) AS [Deaths - Vitamin A deficiency],
	MAX([Deaths - Cause: Child stunting ]) AS [Deaths - Child stunting],
	MAX([Deaths - Cause: Risk: Discontinued breastfeeding ]) AS [Deaths - Discontinued breastfeeding],
	MAX([Deaths - Cause: Risk: Non-exclusive breastfeeding ]) AS [Deaths - Non-exclusive breastfeeding],
	MAX([Deaths - Cause: Iron deficiency - Sex: Both]) AS [Deaths - Iron deficinecy]
FROM
	[dbo].[number_of_death_factors]
WHERE
	[YEAR] = '2019' and ENTITY = 'china'
GROUP BY 
	Entity, 
	[Year];



--3.What was the overall trend in deaths due to unsafe water source between 1990 and 2019?

SELECT
     [year]
    ,[entity]
    ,SUM([Deaths - Cause: All causes - Risk: Unsafe water source - Sex: Bo]) AS [Total deaths]
FROM 
    [number_of_death_factors]
WHERE 
    [year] BETWEEN '1990' AND '2019' 
GROUP BY
    [year]
    ,[entity]
ORDER BY
	[year];


--4.What is the total number of deaths due to smoking for all entities and years?

SELECT 
     entity 
    ,[year]
    ,SUM([Deaths - Cause: Secondhand smoke - Sex: Both]) AS Total_Smoking_Deaths
FROM 
    [dbo].[number_of_death_factors]
GROUP BY 
    entity, 
    [year]
ORDER BY 
    [year]


--5.Which risk factor had the highest number of deaths in 2019?
	SELECT
	  'Air pollution' as Risk_Factor,
	  SUM([Deaths - Cause: All causes - Risk: Outdoor air pollution - OWID]+[Deaths - Cause: All causes - Risk: Household air pollution from ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
	  'High systolic blood pressure' as Risk_Factor,
	  SUM([Deaths - Cause: All causes - Risk: High systolic blood pressure]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT 
		'High Sodium' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Diet high in sodium - Sex: Bo]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		'Low in Whole Grain' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Diet low in whole grains - Se]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Alcohol' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Alcohol use - Sex: Both - Age]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low in Fruits' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Diet low in fruits - Sex: Bot]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Unsafe Water' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Unsafe water source - Sex: Bo]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Passive Smoking ' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Secondhand smoke - Sex: Both]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low Birth Weight' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Low birth weight - Sex: Both ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Child Wasting' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Child wasting - Sex: Both - A]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Unsafe Sex' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Unsafe sex - Sex: Both - Age:]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low in Nuts & Seeds' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Diet low in nuts and seeds - ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low in Vegetables' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Diet low in vegetables - Sex:]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low Physical Actvity' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Low physical activity - Sex: ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Smoking' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Smoking - Sex: Both - Age: Al]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'High Sugar' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: High fasting plasma glucose -]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Obesity' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: High body-mass index - Sex: B]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Unsafe Sanitation' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Unsafe sanitation - Sex: Both]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'No Access to Handwashing' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: No access to handwashing faci]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Drug Use' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Drug use - Sex: Both - Age: A]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low Bone Mineral Density' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Low bone mineral density - Se]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low in Vitamin A' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Vitamin A deficiency - Sex: B]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Child Stunting' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Child stunting - Sex: Both - ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Discontinued Breastfeeding' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Discontinued breastfeeding - ]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Non-Exclusive Breastfeeding' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Non-exclusive breastfeeding -]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'
	UNION ALL
	SELECT
		 'Low in Iron' as Risk_Fastor,
		SUM([Deaths - Cause: All causes - Risk: Iron deficiency - Sex: Both -]) AS Total_Deaths
	FROM [dbo].[number_of_death_factors]
	WHERE [Year] = '2019'

	ORDER BY Total_Deaths DESC;


--6.How did the number of deaths due to child wasting change over time for Afghanistan?
 
 SELECT
	 entity
	,[year]
	,[Deaths - Cause: Child wasting - Sex: Both - A] as Child_wasting_deaths
FROM [dbo].[number_of_death_factors]
WHERE
	entity = 'Afghanistan'
GROUP BY 
	 entity
	,[year]
	,[Deaths - Cause: Child wasting - Sex: Both - A];

--7.Which entity had the highest number of deaths due to unsafe sanitation in 2019?

SELECT TOP 1
	 entity
	,[year]
	,[Deaths - Cause:  Unsafe sanitation - Sex: Both] as Unsafe_Sanitation
FROM 
	[dbo].[number_of_death_factors]
WHERE 
	[year] = '2019'
ORDER BY 
	Unsafe_Sanitation DESC;

--8.--8.What is the overall trends in Air Pollution Deaths and is there any co-relation between Indoor & Outdoor Pollution?

SELECT 
	 [year]
	,SUM([Deaths - Cause: All causes - Risk: Household air pollution from ]) AS Indoor_deaths
    ,SUM([Deaths - Cause: All causes - Risk: Outdoor air pollution - OWID ]) AS Outdoor_deaths
FROM
	[dbo].[number_of_death_factors]
GROUP BY 
	[year]
ORDER BY
	[year];


--9.What was the overall trend in deaths due to air pollution between 1990 and 2019?

SELECT 
	[year],
	SUM([Deaths - Cause: Air pollution - Sex: Both - A]) as Total_Air_Pollution_Deaths
FROM 
	[dbo].[number_of_death_factors]
WHERE
	[year] BETWEEN 1990 AND 2019
GROUP BY
	[year]
ORDER BY
	[year];


--10.Which entity had the highest number of deaths due to high systolic blood pressure in 2019?

SELECT TOP 1
	entity,
	[year],
	[Deaths - Cause:  High systolic blood pressure ] as Blood_Pressure_Deaths
FROM
	[dbo].[number_of_death_factors]
WHERE 
	[year] = '2019'
ORDER BY
	[Deaths - Cause: All causes - Risk: High systolic blood pressure ] DESC;


--11.Which entity has higest deaths form Air Pollution?

SELECT 
	entity,
	[year],
	SUM([Deaths - Cause: All causes - Risk: Household air pollution from ]+[Deaths - Cause: All causes - Risk: Outdoor air pollution - OWID ]) AS Air_Pollution
FROM
	[dbo].[number_of_death_factors]
GROUP BY 
	entity,
	[year]
ORDER BY [Year],Air_Pollution DESC;


--12.How did the number of deaths due to non-exclusive breastfeeding change over time for all entities?

SELECT 
	 entity
	,[year]
	,SUM([Deaths - Cause: All causes - Risk: Non-exclusive breastfeeding -]) as Total_Non_Exclusive_Breastfeeding_Deaths
FROM 
	[dbo].[number_of_death_factors]
GROUP BY 
	 entity
	,[year]
ORDER BY 
	[year];


--13.Which country had the highest percentage increase in deaths due to high systolic blood pressure between 2018 and 2019?
SELECT 
	 entity
    ,AVG([Deaths - Cause: All causes - Risk: Unsafe water source - Sex: Bo]) as avg_deaths
    ,AVG([Deaths - Cause: All causes - Risk: High systolic blood pressure ]) as avg_risk_factor
    ,STDEVP([Deaths - Cause: All causes - Risk: Unsafe water source - Sex: Bo]) as stdev_deaths
    ,STDEVP([Deaths - Cause: All causes - Risk: Unsafe water source - Sex: Bo]) as stdev_risk_factor
    ,COUNT(*) as n
FROM 
	[dbo].[number_of_death_factors]
WHERE
	[Year] >= 2010 AND [Year] <= 2020
GROUP BY
	entity;


