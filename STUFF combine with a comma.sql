select DISTINCT P.MemberKey, PTL.PrimaryInsurance
FROM [Mem].[COB] P
LEFT JOIN 
(
SELECT DISTINCT [MemberKey] 
,STUFF((SELECT  DISTINCT ', ' + [PLO_PlanName]
FROM [Mem].[COB] A
WHERE A.[MemberKey] = B.[MemberKey]
	AND A.DeletedFlag = 0 
	AND (A.EndDate IS NULL OR A.EndDate >= GETDATE())
	AND A.PriorityDescription = 'PRIMARY'
FOR XML PATH('')), 1, 2, '') AS PrimaryInsurance
FROM [Mem].[COB] B
) AS PTL
ON P.[MemberKey] = PTL.[MemberKey]
WHERE P.DeletedFlag = 0 
AND (P.EndDate IS NULL OR P.EndDate >= GETDATE())
AND P.PriorityDescription = 'PRIMARY'
and P.MemberKey = 69


--select top 100 * from 
--[Mem].[COB] P
--WHERE P.DeletedFlag = 0 
--AND (P.EndDate IS NULL OR P.EndDate >= GETDATE())
--AND P.PriorityDescription = 'PRIMARY'


--select PTL.*
--from [prov].[Provider] P
--	LEFT JOIN 
--	(
--	SELECT DISTINCT ProviderKey 
--	,STUFF((SELECT  DISTINCT ', ' + LineOfBusinessCode
--	FROM [Form].[ProviderTINLOB] A
--	WHERE A.ProviderKey = B.ProviderKey
--	FOR XML PATH('')), 1, 2, '') AS LineOfBusinessCode
--	FROM [Form].[ProviderTINLOB] B
--	) AS PTL
--	ON P.ProviderKey = PTL.ProviderKey


--	select * from  [Form].[ProviderTINLOB]
--	where ProviderKey = '760'



--	select distinct PIN.*
--	from [mem].MemberID M
--	LEFT JOIN
--	(
--	SELECT DISTINCT P.MemberKey, PTL.PrimaryInsurance -- Primary Insurance for active records
--	FROM [Mem].[COB] P
--	LEFT JOIN 
--	(
--	SELECT DISTINCT [MemberKey] 
--	,STUFF((SELECT  DISTINCT ', ' + [PLO_PlanName]
--	FROM [Mem].[COB] A
--	WHERE A.[MemberKey] = B.[MemberKey] 
--	AND A.DeletedFlag = 0 
--	AND (A.EndDate IS NULL OR A.EndDate >= GETDATE())
--	AND A.PriorityDescription = 'PRIMARY'
--	FOR XML PATH('')), 1, 2, '') AS PrimaryInsurance
--	FROM [Mem].[COB] B
--	) AS PTL
--	ON P.[MemberKey] = PTL.[MemberKey]
--	WHERE P.DeletedFlag = 0 
--	AND (P.EndDate IS NULL OR P.EndDate >= GETDATE())
--	AND P.PriorityDescription = 'PRIMARY'
--	) PIN 
--	ON M.MemberKey = PIN.MemberKey
--	where M.MemberKey = 705027


--		SELECT DISTINCT top 100 P.MemberKey, count(distinct [PLO_PlanName]) as cn -- Primary Insurance for active records
--	FROM [Mem].[COB] P
--	group by MemberKey
--	having count(distinct [PLO_PlanName]) > 3
--		order by 2 desc


--	select distinct MemberKey ,[PLO_PlanName],EndDate
--		FROM [Mem].[COB] P
--		where MemberKey = '697555'
--	and	P.DeletedFlag = 0 
--	AND (P.EndDate IS NULL OR P.EndDate >= GETDATE())
--	AND P.PriorityDescription = 'PRIMARY'




----704789
----988573
----815135
----884869

--select * from form.GetActiveMemberDetails
--where memberKey in ( 697555,705027)