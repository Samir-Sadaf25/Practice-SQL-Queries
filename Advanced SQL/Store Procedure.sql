
use [AspnetB13]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Alter PROCEDURE [dbo].[GetProducts]
	
	@PageIndex int,
	@PageSize int,
	@OrderBy nvarchar(50),
	@Name nvarchar(250) = '%',
	@PriceFrom float = null,
	@PriceTo float = null,
	@Total int output,
	@TotalDisplay int output

AS
BEGIN
   Declare @sql nvarchar(2000);
	Declare @paramList nvarchar(MAX);

	Declare @countSql nvarchar(2000);
	Declare @countParamList nvarchar(MAX);

	-- Total data count
	Select @Total = count(*) from Products;

	-- Preparing count query
	SET @countSql = 'select @xTotalDisplay = count(*) from Products 
					where 1 = 1 ';

	IF @Name IS NOT NULL
	SET @countSql = @countSql + ' AND Name LIKE ''%'' + @xName + ''%'''

	IF @PriceFrom IS NOT NULL
	SET @countSql = @countSql + ' AND Price >= @xPriceFrom'

	IF @PriceTo IS NOT NULL
	SET @countSql = @countSql + ' AND Price <= @xPriceTo'


	-- Preparing main query
	SET @sql = 'select * from Products where 1 = 1 ';

	IF @Name IS NOT NULL
	SET @sql = @sql + ' AND Name LIKE ''%'' + @xName + ''%'''

	IF @PriceFrom IS NOT NULL
	SET @sql = @sql + ' AND Price >= @xPriceFrom'

	IF @PriceTo IS NOT NULL
	SET @sql = @sql + ' AND Price <= @xPriceTo'

	SET @sql = @sql + ' Order by ' + @OrderBy + ' OFFSET @xPageSize * (@xPageIndex - 1)
	ROWS FETCH NEXT @xPageSize ROWS ONLY';

	-- Preparing count parameters
	SELECT @countParamList = '@xName nvarchar(250),
		@xPriceFrom float,
		@xPriceTo float,
		@xTotalDisplay int output';

	-- Executing count sql
	exec sp_executesql @countSql, @countParamList,
		@Name,
		@PriceFrom,
		@PriceTo,
		@xTotalDisplay = @TotalDisplay output;

	-- Preparing sql parameters
	SELECT @paramList = '@xName nvarchar(250),
		@xPriceFrom float,
		@xPriceTo float,
		@xPageIndex int,
		@xPageSize int';

	-- Executing sql
	exec sp_executesql @sql, @paramList,
		@Name,
		@PriceFrom,
		@PriceTo,
		@PageIndex,
		@PageSize

	print @countSql;
	print @sql;
END
GO
