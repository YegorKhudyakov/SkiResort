USE [master]
GO
/****** Object:  Database [SkiResort]    Script Date: 22.03.2023 22:17:05 ******/
CREATE DATABASE [SkiResort]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkiResort', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SkiResort.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkiResort_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SkiResort_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SkiResort] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkiResort].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkiResort] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkiResort] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkiResort] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkiResort] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkiResort] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkiResort] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SkiResort] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkiResort] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkiResort] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkiResort] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkiResort] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkiResort] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkiResort] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkiResort] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkiResort] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SkiResort] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkiResort] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkiResort] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkiResort] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkiResort] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkiResort] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkiResort] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkiResort] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkiResort] SET  MULTI_USER 
GO
ALTER DATABASE [SkiResort] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkiResort] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkiResort] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkiResort] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkiResort] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkiResort] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SkiResort] SET QUERY_STORE = OFF
GO
USE [SkiResort]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Name] [nvarchar](50) NOT NULL,
	[ClientCode] [int] IDENTITY(1,1) NOT NULL,
	[PassportData] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedServices]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedServices](
	[OrdedId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_OrderedServices] PRIMARY KEY CLUSTERED 
(
	[OrdedId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](50) NOT NULL,
	[DateOfCreation] [date] NOT NULL,
	[OrderTime] [time](7) NOT NULL,
	[ClientCode] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[CloseDate] [nchar](10) NULL,
	[RentalTime] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersStatutes]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersStatutes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrdersStatutes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ServiceCode] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkersPositionId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](30) NOT NULL,
	[Passwords] [nvarchar](30) NULL,
	[LastEntrance] [datetime] NULL,
	[IsSucces] [bit] NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkersPositions]    Script Date: 22.03.2023 22:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkersPositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_WorkersPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Фролов Андрей Иванович', 45462526, N'Серия 1180 Номер 176596', CAST(N'2001-07-14' AS Date), N'344288, г. Нальчик, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Николаев Даниил Всеволодович', 45462527, N'Серия 2280 Номер 223523', CAST(N'2001-02-10' AS Date), N'614164, г. Нальчик, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Снегирев Макар Иванович', 45462528, N'Серия 4560 Номер 354155', CAST(N'1998-05-21' AS Date), N'394242, г. Нальчик, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Иванов Иван Ильич', 45462529, N'Серия 9120 Номер 554296', CAST(N'1998-10-01' AS Date), N'660540, г. Нальчик, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Филиппова Анна Глебовна', 45462530, N'Серия 2367 Номер 558134', CAST(N'1976-05-31' AS Date), N'125837, г. Нальчик, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Иванов Михаил Владимирович', 45462531, N'Серия 7101 Номер 669343', CAST(N'1985-11-04' AS Date), N'125703, г. Нальчик, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Власов Дмитрий Александрович', 45462532, N'Серия 3455 Номер 719630', CAST(N'1998-08-17' AS Date), N'625283, г. Нальчик, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Серова Екатерина Львовна', 45462533, N'Серия 2377 Номер 871623', CAST(N'1984-10-24' AS Date), N'614611, г. Нальчик, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Борисова Ирина Ивановна', 45462534, N'Серия 8755 Номер 921148', CAST(N'1976-10-14' AS Date), N'454311, г. Нальчик, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Зайцев Никита Артёмович', 45462535, N'Серия 4355 Номер 104594', CAST(N'1999-10-14' AS Date), N'660007, г. Нальчик, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Медведев Святослав Евгеньевич', 45462536, N'Серия 2791 Номер 114390', CAST(N'1985-07-13' AS Date), N'603036, г. Нальчик, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Коротков Кирилл Алексеевич', 45462537, N'Серия 5582 Номер 126286', CAST(N'1976-05-26' AS Date), N'450983, г. Нальчик, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Калашникова Арина Максимовна', 45462538, N'Серия 2978 Номер 133653', CAST(N'1999-08-13' AS Date), N'394782, г. Нальчик, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Минина Таисия Кирилловна', 45462539, N'Серия 7512 Номер 141956', CAST(N'1985-10-13' AS Date), N'603002, г. Нальчик, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Наумов Серафим Романович', 45462540, N'Серия 5046 Номер 158433', CAST(N'1999-04-15' AS Date), N'450558, г. Нальчик, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Воробьева Василиса Евгеньевна', 45462541, N'Серия 2460 Номер 169505', CAST(N'1999-01-13' AS Date), N'394060, г. Нальчик, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Калинин Александр Андреевич', 45462542, N'Серия 3412 Номер 174593', CAST(N'1999-01-07' AS Date), N'410661, г. Нальчик, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Кузнецова Милана Владиславовна', 45462543, N'Серия 4950 Номер 183034', CAST(N'1999-01-24' AS Date), N'625590, г. Нальчик, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Фирсов Егор Романович', 45462544, N'Серия 5829 Номер 219464', CAST(N'1993-09-02' AS Date), N'625683, г. Нальчик, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Зимина Агния Александровна', 45462545, N'Серия 6443 Номер 208059', CAST(N'1998-09-03' AS Date), N'400562, г. Нальчик, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Титов Андрей Глебович', 45462546, N'Серия 7079 Номер 213265', CAST(N'1985-10-23' AS Date), N'614510, г. Нальчик, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Орлов Николай Егорович', 45462547, N'Серия 8207 Номер 522702', CAST(N'1985-07-27' AS Date), N'410542, г. Нальчик, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Кузнецова Аиша Михайловна', 45462548, N'Серия 9307 Номер 232158', CAST(N'1998-10-04' AS Date), N'620839, г. Нальчик, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Куликов Никита Георгиевич', 45462549, N'Серия 1357 Номер 242839', CAST(N'1999-04-23' AS Date), N'443890, г. Нальчик, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Карпова София Егоровна', 45462550, N'Серия 1167 Номер 256636', CAST(N'1993-10-01' AS Date), N'603379, г. Нальчик, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Смирнова Дарья Макаровна', 45462551, N'Серия 1768 Номер 266986', CAST(N'1976-03-22' AS Date), N'603721, г. Нальчик, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Абрамова Александра Мироновна', 45462552, N'Серия 1710 Номер 427875', CAST(N'1999-03-26' AS Date), N'410172, г. Нальчик, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Наумов Руслан Михайлович', 45462553, N'Серия 1806 Номер 289145', CAST(N'1999-10-11' AS Date), N'420151, г. Нальчик, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Бочаров Никита Матвеевич', 45462554, N'Серия 1587 Номер 291249', CAST(N'1997-06-29' AS Date), N'125061, г. Нальчик, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Соловьев Давид Ильич', 45462555, N'Серия 1647 Номер 306372', CAST(N'1984-03-06' AS Date), N'630370, г. Нальчик, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Васильева Валерия Дмитриевна', 45462556, N'Серия 1742 Номер 316556', CAST(N'1999-09-30' AS Date), N'614753, г. Нальчик, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Макарова Василиса Андреевна', 45462557, N'Серия 1474 Номер 326347', CAST(N'1999-04-08' AS Date), N'426030, г. Нальчик, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Алексеев Матвей Викторович', 45462558, N'Серия 1452 Номер 339539', CAST(N'1998-08-02' AS Date), N'450375, г. Нальчик, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Никитина Полина Александровна', 45462559, N'Серия 2077 Номер 443480', CAST(N'1976-09-19' AS Date), N'625560, г. Нальчик, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Окулова Олеся Алексеевна', 45462560, N'Серия 2147 Номер 357518', CAST(N'1999-04-03' AS Date), N'630201, г. Нальчик, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Захарова Полина Яновна', 45462561, N'Серия 2687 Номер 363884', CAST(N'1976-04-21' AS Date), N'190949, г. Нальчик, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Зайцев Владимир Давидович', 45462562, N'Серия 2376 Номер 443711', CAST(N'1998-01-26' AS Date), N'350501, г. Нальчик, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Иванов Виталий Даниилович', 45462563, N'Серия 2568 Номер 386237', CAST(N'1976-08-11' AS Date), N'450048, г. Нальчик, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Захаров Матвей Романович', 45462564, N'Серия 2556 Номер 439376', CAST(N'1993-07-12' AS Date), N'644921, г. Нальчик, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Иванов Степан Степанович', 45462565, N'Серия 2737 Номер 407501', CAST(N'1998-09-19' AS Date), N'614228, г. Нальчик, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Ткачева Милана Тимуровна', 45462566, N'Серия 2581 Номер 441645', CAST(N'1998-05-24' AS Date), N'350940, г. Нальчик, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Семенов Даниил Иванович', 45462567, N'Серия 2675 Номер 427933', CAST(N'1976-01-04' AS Date), N'344990, г. Нальчик, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Виноградов Вячеслав Дмитриевич', 45462568, N'Серия 2967 Номер 434531', CAST(N'1976-07-12' AS Date), N'410248, г. Нальчик, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Соболева Николь Фёдоровна', 45462569, N'Серия 3070 Номер 449655', CAST(N'1976-05-02' AS Date), N'400839, г. Нальчик, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Тихонова Анна Львовна', 45462570, N'Серия 3108 Номер 451174', CAST(N'1985-03-23' AS Date), N'450539, г. Нальчик, ул. Заводская, 3, кв. 81', N'corine16@von.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Кузнецова Ульяна Савельевна', 45462571, N'Серия 3250 Номер 464705', CAST(N'1999-06-03' AS Date), N'614591, г. Нальчик, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Смирнова Анна Германовна', 45462572, N'Серия 3392 Номер 471644', CAST(N'1997-07-18' AS Date), N'400260, г. Нальчик, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Черепанова Анна Давидовна', 45462573, N'Серия 3497 Номер 487819', CAST(N'1985-11-06' AS Date), N'660924, г. Нальчик, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Григорьев Максим Кириллович', 45462574, N'Серия 3560 Номер 491260', CAST(N'1999-05-26' AS Date), N'644133, г. Нальчик, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Голубев Даниэль Александрович', 45462575, N'Серия 3620 Номер 506034', CAST(N'1999-06-14' AS Date), N'450698, г. Нальчик, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Миронов Юрий Денисович', 45462576, N'Серия 3774 Номер 511438', CAST(N'1985-01-26' AS Date), N'620653, г. Нальчик, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Терехов Михаил Андреевич', 45462577, N'Серия 3862 Номер 521377', CAST(N'1976-07-06' AS Date), N'644321, г. Нальчик, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Орлова Алиса Михайловна', 45462578, N'Серия 3084 Номер 535966', CAST(N'1997-02-24' AS Date), N'603653, г. Нальчик, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Кулаков Константин Даниилович', 45462579, N'Серия 4021 Номер 541528', CAST(N'1993-06-20' AS Date), N'410181, г. Нальчик, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Кудрявцев Максим Романович', 45462580, N'Серия 4109 Номер 554053', CAST(N'1998-05-10' AS Date), N'394207, г. Нальчик, ул. Свердлова, 31, кв. 28', N'danika58@rath.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Соболева Кира Фёдоровна', 45462581, N'Серия 4537 Номер 564868', CAST(N'1998-03-14' AS Date), N'420633, г. Нальчик, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Коновалов Арсений Максимович', 45462582, N'Серия 4914 Номер 572471', CAST(N'1985-02-18' AS Date), N'445720, г. Нальчик, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Гусев Михаил Дмитриевич', 45462583, N'Серия 4445 Номер 581302', CAST(N'1999-11-23' AS Date), N'400646, г. Нальчик, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Суханова Варвара Матвеевна', 45462584, N'Серия 4743 Номер 598180', CAST(N'1993-09-13' AS Date), N'644410, г. Нальчик, ул. Красная, 17, кв. 69', N'vmoore@gmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Орлова Ясмина Васильевна', 45462585, N'Серия 4741 Номер 601821', CAST(N'1984-06-24' AS Date), N'400750, г. Нальчик, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Васильева Ксения Константиновна', 45462586, N'Серия 4783 Номер 612567', CAST(N'1999-08-01' AS Date), N'660590, г. Нальчик, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Борисова Тамара Данииловна', 45462587, N'Серия 4658 Номер 621200', CAST(N'1993-05-29' AS Date), N'426083, г. Нальчик, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Дмитриев Мирон Ильич', 45462588, N'Серия 4908 Номер 634613', CAST(N'1985-04-13' AS Date), N'410569, г. Нальчик, ул. Парковая, 36, кв. 17', N'obartell@franecki.info')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Лебедева Анна Александровна', 45462589, N'Серия 5092 Номер 642468', CAST(N'1985-03-30' AS Date), N'443375, г. Нальчик, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Пономарев Артём Маркович', 45462590, N'Серия 5155 Номер 465274', CAST(N'1984-06-02' AS Date), N'614316, г. Нальчик, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Борисова Елена Михайловна', 45462591, N'Серия 5086 Номер 666893', CAST(N'1976-05-23' AS Date), N'445685, г. Нальчик, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Моисеев Камиль Максимович', 45462592, N'Серия 5333 Номер 675375', CAST(N'1999-06-17' AS Date), N'614505, г. Нальчик, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Герасимова Дарья Константиновна', 45462593, N'Серия 5493 Номер 684572', CAST(N'1984-10-13' AS Date), N'426629, г. Нальчик, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Михайлова Мария Марковна', 45462594, N'Серия 5150 Номер 696226', CAST(N'1976-12-02' AS Date), N'603743, г. Нальчик, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com')
INSERT [dbo].[Clients] ([Name], [ClientCode], [PassportData], [BirthDate], [Address], [Email]) VALUES (N'Коршунов Кирилл Максимович', 45462595, N'Серия 1308 Номер 703305', CAST(N'1985-05-22' AS Date), N'450750, г. Нальчик, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (1, 31)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (1, 34)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (1, 336)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (1, 353)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (2, 45)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (2, 57)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (2, 88)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (2, 98)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (3, 45)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (3, 57)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (3, 88)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (3, 92)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (4, 44)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (4, 45)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (4, 57)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (4, 88)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (4, 92)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 34)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 45)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 89)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 98)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 336)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (5, 353)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (6, 31)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (6, 34)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (6, 353)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (7, 45)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (7, 89)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (7, 98)
INSERT [dbo].[OrderedServices] ([OrdedId], [ServiceId]) VALUES (7, 99)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (1, N'45462526/12.03.2022', CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), 45462526, 1, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (2, N'45462527/13.03.2022', CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), 45462527, 2, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (3, N'45462528/14.03.2022', CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), 45462528, 2, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (4, N'45462529/15.03.2022', CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), 45462529, 1, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (5, N'45462530/16.03.2022', CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), 45462530, 3, N'16.04.2022', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (6, N'45462531/17.03.2022', CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), 45462531, 1, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (7, N'45462532/18.03.2022', CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), 45462532, 1, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (8, N'45462533/19.03.2022', CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), 45462533, 2, N'          ', 360)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (9, N'45462534/20.03.2022', CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), 45462534, 2, N'          ', 720)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (10, N'45462535/21.03.2022', CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), 45462535, 1, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (11, N'45462536/22.03.2022', CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), 45462536, 3, N'22.03.2022', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (12, N'45462537/23.03.2022', CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), 45462537, 2, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (13, N'45462538/24.03.2022', CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), 45462538, 2, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (14, N'45462539/25.03.2022', CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), 45462539, 2, N'          ', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (15, N'45462540/26.03.2022', CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), 45462540, 3, N'26.04.2022', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (16, N'45462541/27.03.2022', CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), 45462541, 1, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (17, N'45462542/28.03.2022', CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), 45462542, 2, N'          ', 360)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (18, N'45462543/29.03.2022', CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), 45462543, 2, N'          ', 720)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (19, N'45462544/30.03.2022', CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), 45462544, 1, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (20, N'45462545/31.03.2022', CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), 45462545, 1, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (21, N'45462546/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), 45462546, 3, N'01.04.2022', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (22, N'45462547/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462547, 1, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (23, N'45462548/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462548, 1, N'          ', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (24, N'45462549/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462549, 2, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (25, N'45462550/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), 45462550, 2, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (26, N'45462551/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), 45462551, 2, N'          ', 360)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (27, N'45462552/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), 45462552, 2, N'          ', 720)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (28, N'45462553/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), 45462553, 3, N'08.04.2022', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (29, N'45462554/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), 45462554, 1, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (30, N'45462555/10.04.2022', CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), 45462555, 2, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (31, N'45462556/11.04.2022', CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), 45462556, 2, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (32, N'45462557/12.04.2022', CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), 45462557, 1, N'          ', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (33, N'45462558/13.04.2022', CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), 45462558, 1, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (34, N'45462559/14.04.2022', CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), 45462559, 1, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (35, N'45462560/15.04.2022', CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), 45462560, 2, N'          ', 360)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (36, N'45462561/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462561, 2, N'          ', 720)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (37, N'45462562/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462562, 2, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (38, N'45462563/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462563, 3, N'04.04.2022', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (39, N'45462564/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), 45462564, 2, N'          ', 120)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (40, N'45462565/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), 45462565, 1, N'          ', 600)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (41, N'45462566/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), 45462566, 3, N'07.04.2022', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (42, N'45462567/08.04.2022', CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), 45462567, 2, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (43, N'45462568/09.04.2022', CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), 45462568, 2, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (44, N'45462569/01.04.2022', CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), 45462569, 2, N'          ', 360)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (45, N'45462570/02.04.2022', CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), 45462570, 2, N'          ', 720)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (46, N'45462571/03.04.2022', CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), 45462571, 2, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (47, N'45462572/04.04.2022', CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), 45462572, 3, N'04.04.2022', 320)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (48, N'45462573/05.04.2022', CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), 45462573, 1, N'          ', 480)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (49, N'45462574/06.04.2022', CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), 45462574, 1, N'          ', 240)
INSERT [dbo].[Orders] ([Id], [OrderCode], [DateOfCreation], [OrderTime], [ClientCode], [OrderStatus], [CloseDate], [RentalTime]) VALUES (50, N'45462575/07.04.2022', CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), 45462575, 1, N'          ', 360)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersStatutes] ON 

INSERT [dbo].[OrdersStatutes] ([Id], [Name]) VALUES (1, N'Новая')
INSERT [dbo].[OrdersStatutes] ([Id], [Name]) VALUES (2, N'В прокате')
INSERT [dbo].[OrdersStatutes] ([Id], [Name]) VALUES (3, N'Закрыта')
SET IDENTITY_INSERT [dbo].[OrdersStatutes] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (31, N'Прокат сноуборда', N'JUR8R', 1200.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (34, N'Прокат обуви для сноуборда', N'JKFBJ09', 400.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (44, N'Обучение катанию на сноуборде', N'DHBGFY563', 1000.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (45, N'Прокат защитных подушек для сноубордистов', N'JFH7382', 300.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (57, N'Подъем на 1 уровень', N'JHVSJF6', 500.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (88, N'Подъем на 2  уровень', N'DJHGBS982', 750.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (89, N'Прокат очков для лыжников', N'OIJNB12', 150.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (92, N'Обучение катанию на горных лыжах', N'HJBUJE21J', 1000.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (98, N'Прокат шлема', N'63748HF', 300.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (99, N'Прокат вартушки', N'BSFBHV63', 200.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (123, N'Подъем на 3 уровень', N'638VVNQ3', 1200.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (336, N'Прокат лыж', N'8HFJHG443', 1000.0000)
INSERT [dbo].[Services] ([Id], [Name], [ServiceCode], [Price]) VALUES (353, N'Прокат лыжных палок', N'87FDJKHJ', 100.0000)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (26, 1, N'Иванов Иван Иванович', N'Ivanov@namecomp.ru', N'2L6KZG', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (27, 1, N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (28, 2, N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (29, 3, N'Миронов Вениамин Куприянович', N'mironov@namecomp.ru', N'YOyhfR', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (30, 3, N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 0)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (31, 3, N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (32, 1, N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (33, 1, N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 0)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (34, 1, N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
INSERT [dbo].[Workers] ([Id], [WorkersPositionId], [Name], [Login], [Passwords], [LastEntrance], [IsSucces]) VALUES (35, 1, N'Смирнова Ульяна Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ', CAST(N'2022-05-15T13:13:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkersPositions] ON 

INSERT [dbo].[WorkersPositions] ([Id], [Name]) VALUES (1, N'Продавец')
INSERT [dbo].[WorkersPositions] ([Id], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[WorkersPositions] ([Id], [Name]) VALUES (3, N'Старший смены')
SET IDENTITY_INSERT [dbo].[WorkersPositions] OFF
GO
ALTER TABLE [dbo].[OrderedServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderedServices_Orders] FOREIGN KEY([OrdedId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderedServices] CHECK CONSTRAINT [FK_OrderedServices_Orders]
GO
ALTER TABLE [dbo].[OrderedServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderedServices_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[OrderedServices] CHECK CONSTRAINT [FK_OrderedServices_Services]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientCode])
REFERENCES [dbo].[Clients] ([ClientCode])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrdersStatutes] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrdersStatutes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrdersStatutes]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_WorkersPositions] FOREIGN KEY([WorkersPositionId])
REFERENCES [dbo].[WorkersPositions] ([Id])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_WorkersPositions]
GO
USE [master]
GO
ALTER DATABASE [SkiResort] SET  READ_WRITE 
GO
