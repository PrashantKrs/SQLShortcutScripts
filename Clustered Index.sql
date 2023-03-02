/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * FROM [ODS].[Prov].[vProviderAddresses]
SELECT * FROM [ODS].[Prov].[vProviderAddresses] with(noexpand);

create unique clustered index UIX_vProviderAddresses_TIN on [ODS].[Prov].[vProviderAddresses](ProviderKey);

CREATE VIEW MyView
WITH SCHEMABINDING 
AS
SELECT *
,COUNT_BIG(*) as total   --count_big is included if group by is used
FROM [ODS].[prov].[Provider]
GROUP BY OfficeZip


--refresh on demand
EXEC sp_refreshview '[ODS].[Prov].[vProviderAddresses]'
--refresh on commit