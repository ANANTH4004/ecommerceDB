
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/16/2022 10:26:09
-- Generated from EDMX file: D:\c#\ecommerceDB\ecommerceDB\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EcommerceDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_OrderProduct_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK_OrderProduct_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderProduct] DROP CONSTRAINT [FK_OrderProduct_Product];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[LoginDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LoginDetails];
GO
IF OBJECT_ID(N'[dbo].[OrderProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderProduct];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Products1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products1];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LoginDetails'
CREATE TABLE [dbo].[LoginDetails] (
    [id] int  NOT NULL,
    [userId] nvarchar(max)  NULL,
    [password] nvarchar(max)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [amount] float  NOT NULL,
    [LoginDetail_id] int  NOT NULL
);
GO

-- Creating table 'Products1'
CREATE TABLE [dbo].[Products1] (
    [prodId] int IDENTITY(1,1) NOT NULL,
    [prodName] nvarchar(max)  NOT NULL,
    [desc] nvarchar(max)  NOT NULL,
    [price] float  NOT NULL,
    [img] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderProduct'
CREATE TABLE [dbo].[OrderProduct] (
    [Orders_Id] int  NOT NULL,
    [Products1_prodId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'LoginDetails'
ALTER TABLE [dbo].[LoginDetails]
ADD CONSTRAINT [PK_LoginDetails]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [prodId] in table 'Products1'
ALTER TABLE [dbo].[Products1]
ADD CONSTRAINT [PK_Products1]
    PRIMARY KEY CLUSTERED ([prodId] ASC);
GO

-- Creating primary key on [Orders_Id], [Products1_prodId] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [PK_OrderProduct]
    PRIMARY KEY CLUSTERED ([Orders_Id], [Products1_prodId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Orders_Id] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [FK_OrderProduct_Orders]
    FOREIGN KEY ([Orders_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products1_prodId] in table 'OrderProduct'
ALTER TABLE [dbo].[OrderProduct]
ADD CONSTRAINT [FK_OrderProduct_Products1]
    FOREIGN KEY ([Products1_prodId])
    REFERENCES [dbo].[Products1]
        ([prodId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderProduct_Products1'
CREATE INDEX [IX_FK_OrderProduct_Products1]
ON [dbo].[OrderProduct]
    ([Products1_prodId]);
GO

-- Creating foreign key on [LoginDetail_id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_LoginDetailOrder]
    FOREIGN KEY ([LoginDetail_id])
    REFERENCES [dbo].[LoginDetails]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LoginDetailOrder'
CREATE INDEX [IX_FK_LoginDetailOrder]
ON [dbo].[Orders]
    ([LoginDetail_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------