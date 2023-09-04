USE StajTakip
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	_Admin_Categories_All @Islem='GetList'
*/

create PROCEDURE [dbo].[_Admin_Ogrenciler_All]
(
	@OgrenciId as int=0,
	@OgrenciAdi as nvarchar(255)='',
	@OgrenciSoyadi as nvarchar(255)='',
	@OgrenciNo as int=0,
	@OgrenciBolum as int=0,
	@OgrenciKullaniciAdi AS nvarchar(50)='',
	@OgrenciSifre AS nvarchar(50)='',
	@Islem AS nvarchar(50)='',
	@IsActiva as bit=1,
	@IsDeleted as bit=0,
	@OutputNewId AS int output 
	
)
AS
BEGIN  -- Main Begin
	SET NOCOUNT ON;
		DECLARE @sorgu AS nvarchar(max)=''
		SET @sorgu=''
		IF @Islem='GetList'
			BEGIN
				
				SELECT * FROM Category
		  
			END
		ELSE IF (@Islem='Insert')
			BEGIN
				insert into Categories 
					(CategoryName,TopCategoryId,CategorySort,CreateDate,CategoryApproval,TypeId,Ozet,Icerik,CategoryImage,ArticleImages)
				values 
					(@CategoryName,@TopCategoryId,@CategorySort,GETDATE(),@IsActive,@CategoryType,@Ozet,@Icerik,@CategoryImage,@ArticleImages)
					
				SET @OutputNewId =@@IDENTITY
				
			END
		ELSE IF (@Islem='Update')
			BEGIN
				update Categories  set 
				CategoryName=@CategoryName,
				TopCategoryId=@TopCategoryId,
				CategorySort=@CategorySort,
				CategoryApproval=@IsActive,
				TypeId = @CategoryType,
				Ozet=@Ozet,
				Icerik=@Icerik
				Where CategoryId=@CategoryId
			END
	SET NOCOUNT OFF;
END 
