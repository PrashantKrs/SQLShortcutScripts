Declare @FunctionName varchar(250) = 'FnGetAllMemberDetails'

Declare @RemoveComments varchar(max) =
(SELECT
substring(ROUTINE_DEFINITION,charindex('*/',ROUTINE_DEFINITION)+2,LEN(ROUTINE_DEFINITION)) 
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE
ROUTINE_TYPE = 'FUNCTION' AND
ROUTINE_NAME LIKE @FunctionName
)

declare @ParceForEnd varchar(max) =
(select replace(@RemoveComments,' FROM ','charend'))

select @ParceForEnd

declare @FinalScript varchar(max) =
(select substring(@ParceForEnd,charindex('select',@ParceForEnd)+6,(charindex('charend',@ParceForEnd)-charindex('select',@ParceForEnd)-6)) )

select value as FunctionOutputFields from string_split(@FinalScript,',')

--select charindex('SELECT',@RemoveComments)+6,charindex('charend',@RemoveComments),charindex('select',@RemoveComments)-6

--declare @FinalScript varchar(max) =
--(select substring(@RemoveComments,246,568 ))

--select value as FunctionOutputFields from string_split(@FinalScript,',')
