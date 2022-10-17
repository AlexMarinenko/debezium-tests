CREATE DATABASE testDB;
GO
USE testDB;
EXEC sys.sp_cdc_enable_db;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE ACCOUNT_TRAN_ALL (
    [ID] [bigint] IDENTITY(1,1) NOT NULL,
    [ACCOUNT_ID] [int] NOT NULL,
    [DATETIME] [datetime] NOT NULL,
    [TRAN_TYPE] [varchar](10) NOT NULL,
    [AMOUNT_REAL] [numeric](38, 18) NULL,
    [BALANCE_REAL] [numeric](38, 18) NULL,
    [PLATFORM_TRAN_ID] [nvarchar](100) NULL,
    [GAME_TRAN_ID] [nvarchar](100) NULL,
    [GAME_ID] [varchar](100) NULL,
    [PLATFORM_ID] [int] NULL,
    [payment_id] [int] NULL,
    [ROLLED_BACK] [int] NULL,
    [ROLLBACK_TRAN_ID] [bigint] NULL,
    [AMOUNT_RELEASED_BONUS] [numeric](38, 18) NOT NULL,
    [AMOUNT_PLAYABLE_BONUS] [numeric](38, 18) NOT NULL,
    [BALANCE_RELEASED_BONUS] [numeric](38, 18) NOT NULL,
    [BALANCE_PLAYABLE_BONUS] [numeric](38, 18) NOT NULL,
    [AMOUNT_UNDERFLOW] [numeric](38, 18) NULL,
    [AMOUNT_RAW_LOYALTY] [bigint] NOT NULL,
    [BALANCE_RAW_LOYALTY] [bigint] NOT NULL,
    [TRANSACTION_ON_HOLD_ID] [bigint] NULL,
    [SSW_TRAN_ID] [bigint] NULL,
    [REFERENCE] [varchar](100) NULL,
    [BRAND_ID] [int] NULL,
    [MachineID] [int] NULL
)
GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [PK_admin_all_ACCOUNT_TRAN_ALL] PRIMARY KEY CLUSTERED
-- (
-- 	[ID] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_ACCOUNT_ID_DATETIME] ON ACCOUNT_TRAN_ALL
-- (
-- 	[ACCOUNT_ID] ASC,
-- 	[DATETIME] ASC
-- )
-- INCLUDE([TRAN_TYPE],[AMOUNT_RAW_LOYALTY],[BALANCE_RAW_LOYALTY],[BRAND_ID],[payment_id],[AMOUNT_REAL],[AMOUNT_PLAYABLE_BONUS],[AMOUNT_RELEASED_BONUS],[REFERENCE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- SET ANSI_PADDING ON
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_BRAND_ID_PLATFORM_TRAN_ID] ON ACCOUNT_TRAN_ALL
-- (
-- 	[BRAND_ID] ASC,
-- 	[PLATFORM_TRAN_ID] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_DATETIME] ON ACCOUNT_TRAN_ALL
-- (
-- 	[DATETIME] ASC
-- )
-- INCLUDE([ID],[ACCOUNT_ID],[TRAN_TYPE],[AMOUNT_REAL],[BALANCE_REAL],[PLATFORM_TRAN_ID],[GAME_TRAN_ID],[GAME_ID],[PLATFORM_ID],[ROLLBACK_TRAN_ID],[AMOUNT_RELEASED_BONUS],[AMOUNT_PLAYABLE_BONUS],[BALANCE_RELEASED_BONUS],[BALANCE_PLAYABLE_BONUS]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_DATETIME_ACCOUNT_ID] ON ACCOUNT_TRAN_ALL
-- (
-- 	[DATETIME] ASC,
-- 	[ACCOUNT_ID] ASC
-- )
-- INCLUDE([AMOUNT_REAL],[AMOUNT_PLAYABLE_BONUS],[AMOUNT_RELEASED_BONUS]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_DATETIME_ROLLED_BACK] ON ACCOUNT_TRAN_ALL
-- (
-- 	[DATETIME] ASC,
-- 	[ROLLED_BACK] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- SET ANSI_PADDING ON
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_GAME_TRAN_ID_PLATFORM_ID_ACCOUNT_ID] ON ACCOUNT_TRAN_ALL
-- (
-- 	[GAME_TRAN_ID] ASC,
-- 	[PLATFORM_ID] ASC,
-- 	[ACCOUNT_ID] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_payment_id] ON ACCOUNT_TRAN_ALL
-- (
-- 	[payment_id] ASC
-- )
-- INCLUDE([ACCOUNT_ID],[DATETIME],[TRAN_TYPE],[AMOUNT_REAL],[BALANCE_REAL],[AMOUNT_RELEASED_BONUS],[BALANCE_RELEASED_BONUS]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- SET ANSI_PADDING ON
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_PLATFORM_TRAN_ID_PLATFORM_ID] ON ACCOUNT_TRAN_ALL
-- (
-- 	[PLATFORM_TRAN_ID] ASC,
-- 	[PLATFORM_ID] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_ROLLBACK_TRAN_ID] ON ACCOUNT_TRAN_ALL
-- (
-- 	[ROLLBACK_TRAN_ID] ASC
-- )
-- INCLUDE([ID],[PLATFORM_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_ROLLED_BACK_DATETIME] ON ACCOUNT_TRAN_ALL
-- (
-- 	[ROLLED_BACK] ASC,
-- 	[DATETIME] ASC
-- )
-- INCLUDE([ACCOUNT_ID],[TRAN_TYPE],[AMOUNT_REAL],[GAME_TRAN_ID],[GAME_ID],[PLATFORM_ID],[AMOUNT_RELEASED_BONUS],[AMOUNT_PLAYABLE_BONUS]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- SET ANSI_PADDING ON
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_TRAN_TYPE_DATETIME] ON ACCOUNT_TRAN_ALL
-- (
-- 	[TRAN_TYPE] ASC,
-- 	[DATETIME] ASC
-- )
-- INCLUDE([ID],[ACCOUNT_ID],[AMOUNT_REAL],[BALANCE_REAL],[GAME_ID],[PLATFORM_ID],[payment_id],[AMOUNT_RELEASED_BONUS],[AMOUNT_PLAYABLE_BONUS],[BALANCE_RELEASED_BONUS],[BALANCE_PLAYABLE_BONUS],[AMOUNT_UNDERFLOW],[AMOUNT_RAW_LOYALTY],[BALANCE_RAW_LOYALTY],[REFERENCE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Data]
-- GO
-- SET ANSI_PADDING ON
-- GO
-- CREATE NONCLUSTERED INDEX [IDX_admin_all_ACCOUNT_TRAN_ALL_TRAN_TYPE_DATETIME_ROLLED_BACK] ON ACCOUNT_TRAN_ALL
-- (
-- 	[TRAN_TYPE] ASC,
-- 	[DATETIME] ASC,
-- 	[ROLLED_BACK] ASC
-- )
-- INCLUDE([ACCOUNT_ID],[PLATFORM_ID],[AMOUNT_PLAYABLE_BONUS],[BRAND_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_ROLLED_BACK]  DEFAULT ((0)) FOR [ROLLED_BACK]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_AMOUNT_RELEASED_BONUS]  DEFAULT ((0)) FOR [AMOUNT_RELEASED_BONUS]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_AMOUNT_PLAYABLE_BONUS]  DEFAULT ((0)) FOR [AMOUNT_PLAYABLE_BONUS]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_BALANCE_RELEASED_BONUS]  DEFAULT ((0)) FOR [BALANCE_RELEASED_BONUS]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_BALANCE_PLAYABLE_BONUS]  DEFAULT ((0)) FOR [BALANCE_PLAYABLE_BONUS]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_AMOUNT_UNDERFLOW]  DEFAULT ((0)) FOR [AMOUNT_UNDERFLOW]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_AMOUNT_RAW_LOYALTY]  DEFAULT ((0)) FOR [AMOUNT_RAW_LOYALTY]
-- GO
-- ALTER TABLE ACCOUNT_TRAN_ALL ADD  CONSTRAINT [DF_admin_all_ACCOUNT_TRAN_ALL_BALANCE_RAW_LOYALTY]  DEFAULT ((0)) FOR [BALANCE_RAW_LOYALTY]
-- GO

EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'ACCOUNT_TRAN_ALL', @role_name = NULL, @supports_net_changes = 0;
