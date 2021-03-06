USE [master]
GO
/****** Object:  Database [Cleverest]    Script Date: 08.10.2020 17:50:32 ******/
CREATE DATABASE [Cleverest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cleverest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cleverest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cleverest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Cleverest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cleverest] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cleverest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cleverest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cleverest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cleverest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cleverest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cleverest] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cleverest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cleverest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cleverest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cleverest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cleverest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cleverest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cleverest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cleverest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cleverest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cleverest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cleverest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cleverest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cleverest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cleverest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cleverest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cleverest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cleverest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cleverest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cleverest] SET  MULTI_USER 
GO
ALTER DATABASE [Cleverest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cleverest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cleverest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cleverest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cleverest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cleverest] SET QUERY_STORE = OFF
GO
USE [Cleverest]
GO
/****** Object:  Table [dbo].[Complaints]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaints](
	[Id] [nvarchar](36) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](36) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [nvarchar](36) NOT NULL,
	[TestId] [nvarchar](36) NULL,
	[Topic] [nvarchar](50) NULL,
	[Text] [nvarchar](max) NOT NULL,
	[VarA] [nvarchar](max) NOT NULL,
	[VarB] [nvarchar](max) NOT NULL,
	[VarC] [nvarchar](max) NOT NULL,
	[VarD] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Login] [nvarchar](50) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Topic] [nvarchar](50) NOT NULL,
	[ModeratorId] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestsForCheck]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestsForCheck](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Topic] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[Id] [nvarchar](36) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[About] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](36) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddComplaint]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddComplaint]
	
	@Id nvarchar (36),
	@Text nvarchar (MAX),
	@UserId nvarchar(36)
AS
BEGIN

	SET NOCOUNT OFF;

    INSERT INTO Complaints (Id, Text, UserId) VALUES (@Id, @Text, @UserId)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPoints]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPoints]
	
	@Login nvarchar(50),
	@Points INT
AS
BEGIN

	SET NOCOUNT OFF;

	DECLARE @OldPoints INT;
	SET @OldPoints = (SELECT Points FROM Rating Where Login = @Login)

    UPDATE Rating SET Points = (@Points + @OldPoints) Where Login = @Login
END
GO
/****** Object:  StoredProcedure [dbo].[AddQuestion]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddQuestion]
	
	@Id nvarchar(36),
	@TestId nvarchar(36),
	@Topic nvarchar(50),
	@Text nvarchar(MAX),
	@VarA nvarchar(MAX),
	@VarB nvarchar(MAX),
	@VarC nvarchar(MAX),
	@VarD nvarchar(MAX),
	@Answer nvarchar(1)
AS
BEGIN
	
	SET NOCOUNT OFF;

    INSERT INTO Questions (Id, TestId, Topic, Text, VarA, VarB, VarC, VarD, Answer) 
	VALUES (@Id, @TestId, @Topic, @Text, @VarA, @VarB, @VarC, @VarD, @Answer)
END
GO
/****** Object:  StoredProcedure [dbo].[AddTest]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTest]

	@Id nvarchar(36),
	@Name nvarchar(50),
	@Topic nvarchar (50),
	@ModeratorId nvarchar(36)

AS
BEGIN
	
	SET NOCOUNT OFF;

    INSERT INTO Tests (Id, Name, Topic, ModeratorId ) VALUES(@Id, @Name, @Topic, @ModeratorId)
END
GO
/****** Object:  StoredProcedure [dbo].[AddTestForCheck]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddTestForCheck]
	
	@Id nvarchar(36),
	@Name nvarchar(50),
	@Topic nvarchar (50)

AS
BEGIN
	
	SET NOCOUNT OFF;

    INSERT INTO TestsForCheck(Id, Name, Topic) VALUES(@Id, @Name, @Topic)

END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
	
	@Id nvarchar(36),
	@Login nvarchar(50),
	@Password nvarchar(50)

AS
BEGIN
	
	SET NOCOUNT OFF;

	DECLARE @StartRole nvarchar(50) = 'Player'
	DECLARE @StartPoints INT = 0
   
	INSERT INTO Users (Id, Login, Password, Role) VALUES (@Id, @Login, @Password, @StartRole)

	INSERT INTO Rating (Login, Points) VALUES (@Login, @StartPoints)

	INSERT INTO UserInformation (Id) VALUES (@Id)
END
GO
/****** Object:  StoredProcedure [dbo].[AvailableLogin]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AvailableLogin]
	
	@Login nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM Users WHERE Login = @Login 

END
GO
/****** Object:  StoredProcedure [dbo].[CanLogin]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CanLogin]
	
	@Login nvarchar(50),
	@Password nvarchar(50)

AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM Users WHERE Login = @Login AND Password = @Password

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllByRole]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllByRole]
	
	@Role nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT * FROM Users WHERE Role = @Role

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTests]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllTests]
	
AS
BEGIN

	SET NOCOUNT ON;

    
	SELECT * FROM Tests
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetAllUsers]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[GetAnswer]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAnswer]
	
	@Id nvarchar(36)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT Answer From Questions Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetComplaints]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetComplaints]
	

AS
BEGIN

	SET NOCOUNT ON;

	SELECT * FROM Complaints
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionsByTopic]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetQuestionsByTopic]
	
	@Topic nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM Questions WHERE Topic = @Topic
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionsForTest]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetQuestionsForTest]
	
	@Id nvarchar(36)

AS
BEGIN

	SET NOCOUNT ON;

    
	SELECT * FROM Questions WHERE TestId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetRating]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRating]
	

AS
BEGIN

	SET NOCOUNT ON;

	SELECT * FROM Rating ORDER BY Points DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRole]
	
	@Login nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT Role FROM Users WHERE Login = @Login

END
GO
/****** Object:  StoredProcedure [dbo].[GetTestById]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTestById]
	
	@Id nvarchar(36)
AS
BEGIN

	SET NOCOUNT ON;

    
	SELECT * FROM Tests WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[GetTestForCheck]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTestForCheck]
	
	@Id nvarchar(36)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT * FROM TestsForCheck WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetTestsByTopic]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTestsByTopic]
	
	@Topic nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM Tests WHERE Topic = @Topic
END
GO
/****** Object:  StoredProcedure [dbo].[GetTestsForCheck]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTestsForCheck]
	

AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM TestsForCheck
END
GO
/****** Object:  StoredProcedure [dbo].[GetTop]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTop]
	
	@Counter INT
AS
BEGIN

	SET NOCOUNT ON;

    
	SELECT TOP (@Counter) * FROM Rating ORDER BY Points DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserId]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserId]
	
	@login nvarchar(50)
AS
BEGIN
	

	SET NOCOUNT ON;

    SELECT Id FROM Users Where Login = @login

END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInformation]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserInformation]
	
	@Id nvarchar(36)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT Name, Surname, Country, About FROM UserInformation WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[RemoveComplaint]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveComplaint]
	
	@Id nvarchar(36)
AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE Complaints WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromCheck]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveFromCheck]
	
	@id nvarchar(36)
AS
BEGIN

	SET NOCOUNT ON;

	DELETE TestsForCheck WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[RemoveTest]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveTest]
	
	@Id nvarchar(36)
AS
BEGIN

	SET NOCOUNT OFF;

	DELETE Tests Where Id = @Id
	DELETE Questions WHERE TestId = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[RemoveUser]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveUser]

	@Id nvarchar(36)
AS
BEGIN
	
	SET NOCOUNT OFF;

	DECLARE @Login nvarchar(50) = (SELECT Login FROM Users WHERE Id = @Id)

    DELETE Users Where Id = @Id
	DELETE Rating Where Login = @Login
END
GO
/****** Object:  StoredProcedure [dbo].[SetRole]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SetRole]
	
	@Id nvarchar(36),
	@Role nvarchar (50)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @Login nvarchar(50) = (SELECT Login FROM Users WHERE Id = @Id)
   
	UPDATE Users SET Role = @Role WHERE Id = @Id
	DELETE Rating WHERE Login = @Login

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserInformation]    Script Date: 08.10.2020 17:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserInformation]

	@Login nvarchar(50),
	@Name nvarchar(50),
	@Surname nvarchar(50),
	@Country nvarchar(50),
	@About nvarchar(MAX)

AS
BEGIN
	
	SET NOCOUNT OFF;

	DECLARE @Id nvarchar(36)
	SET @Id = (SELECT Id FROM Users Where Login = @Login)

    UPDATE UserInformation SET Name = @Name, Surname = @Surname, Country = @Country, About = @About WHERE Id = @Id

END
GO
USE [master]
GO
ALTER DATABASE [Cleverest] SET  READ_WRITE 
GO
