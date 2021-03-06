USE [AccessCorp]
GO
/****** Object:  StoredProcedure [dbo].[sp_valor_campo_Inserir]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP PROCEDURE [dbo].[sp_valor_campo_Inserir]
GO
/****** Object:  StoredProcedure [dbo].[sp_s_get_formulario_campos]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP PROCEDURE [dbo].[sp_s_get_formulario_campos]
GO
/****** Object:  StoredProcedure [dbo].[sp_formulario_Inserir]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP PROCEDURE [dbo].[sp_formulario_Inserir]
GO
/****** Object:  StoredProcedure [dbo].[sp_formulario_campo_Inserir]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP PROCEDURE [dbo].[sp_formulario_campo_Inserir]
GO
ALTER TABLE [dbo].[ValorCampo] DROP CONSTRAINT [FK_ValorCampo_TipoValorCampo]
GO
ALTER TABLE [dbo].[ValorCampo] DROP CONSTRAINT [FK_ValorCampo_Formulario]
GO
ALTER TABLE [dbo].[FormularioCampos] DROP CONSTRAINT [FK_FormularioCampos_TipoValorCampo1]
GO
ALTER TABLE [dbo].[FormularioCampos] DROP CONSTRAINT [FK_FormularioCampos_TipoCampo1]
GO
ALTER TABLE [dbo].[FormularioCampos] DROP CONSTRAINT [FK_FormularioCampos_Formulario1]
GO
/****** Object:  Table [dbo].[ValorCampo]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP TABLE [dbo].[ValorCampo]
GO
/****** Object:  Table [dbo].[TipoValorCampo]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP TABLE [dbo].[TipoValorCampo]
GO
/****** Object:  Table [dbo].[TipoCampo]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP TABLE [dbo].[TipoCampo]
GO
/****** Object:  Table [dbo].[FormularioCampos]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP TABLE [dbo].[FormularioCampos]
GO
/****** Object:  Table [dbo].[Formulario]    Script Date: 4/10/2019 7:51:22 AM ******/
DROP TABLE [dbo].[Formulario]
GO
/****** Object:  Table [dbo].[Formulario]    Script Date: 4/10/2019 7:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formulario](
	[IdFormulario] [int] IDENTITY(1,1) NOT NULL,
	[NomeFormulario] [varchar](50) NOT NULL,
	[DataVencimentoInicio] [datetime] NOT NULL,
	[DataVencimentoFim] [datetime] NOT NULL,
	[DescricaoFormulario] [varchar](100) NULL,
 CONSTRAINT [PK_Formulario] PRIMARY KEY CLUSTERED 
(
	[IdFormulario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormularioCampos]    Script Date: 4/10/2019 7:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormularioCampos](
	[IdFormulario] [int] NOT NULL,
	[IdTipoCampo] [int] NOT NULL,
	[IdTipoValorCampo] [int] NOT NULL,
	[DescricaoCampo] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCampo]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCampo](
	[IdTipoCampo] [int] IDENTITY(1,1) NOT NULL,
	[NamoTipoCampo] [varchar](30) NULL,
 CONSTRAINT [PK_TipoCampo] PRIMARY KEY CLUSTERED 
(
	[IdTipoCampo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoValorCampo]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoValorCampo](
	[IdTipoValorCampo] [int] IDENTITY(1,1) NOT NULL,
	[NamoTipoValorCampo] [varchar](30) NULL,
 CONSTRAINT [PK_TipoValorCampo] PRIMARY KEY CLUSTERED 
(
	[IdTipoValorCampo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValorCampo]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValorCampo](
	[IdTipoCampo] [int] NOT NULL,
	[ValorCampo] [varchar](30) NOT NULL,
	[IdFormulario] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Formulario] ON 

INSERT [dbo].[Formulario] ([IdFormulario], [NomeFormulario], [DataVencimentoInicio], [DataVencimentoFim], [DescricaoFormulario]) VALUES (4, N'Nome do formulário', CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2012-01-01T00:00:00.000' AS DateTime), N'Descrição formulário')
INSERT [dbo].[Formulario] ([IdFormulario], [NomeFormulario], [DataVencimentoInicio], [DataVencimentoFim], [DescricaoFormulario]) VALUES (5, N'Nome do formulário', CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2012-01-01T00:00:00.000' AS DateTime), N'Descrição formulário')
INSERT [dbo].[Formulario] ([IdFormulario], [NomeFormulario], [DataVencimentoInicio], [DataVencimentoFim], [DescricaoFormulario]) VALUES (8, N'Nome do formulário', CAST(N'2010-01-01T00:00:00.000' AS DateTime), CAST(N'2012-01-01T00:00:00.000' AS DateTime), N'Descrição formulário')
SET IDENTITY_INSERT [dbo].[Formulario] OFF
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (4, 3, 3, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (5, 3, 3, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 1, 1, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 1, 1, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 1, 1, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 1, 1, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 2, 1, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 2, 2, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 3, 3, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 3, 3, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 3, 3, NULL)
INSERT [dbo].[FormularioCampos] ([IdFormulario], [IdTipoCampo], [IdTipoValorCampo], [DescricaoCampo]) VALUES (8, 3, 3, NULL)
SET IDENTITY_INSERT [dbo].[TipoCampo] ON 

INSERT [dbo].[TipoCampo] ([IdTipoCampo], [NamoTipoCampo]) VALUES (1, N'Textbox')
INSERT [dbo].[TipoCampo] ([IdTipoCampo], [NamoTipoCampo]) VALUES (2, N'Dropbox')
INSERT [dbo].[TipoCampo] ([IdTipoCampo], [NamoTipoCampo]) VALUES (3, N'Radio Button')
SET IDENTITY_INSERT [dbo].[TipoCampo] OFF
SET IDENTITY_INSERT [dbo].[TipoValorCampo] ON 

INSERT [dbo].[TipoValorCampo] ([IdTipoValorCampo], [NamoTipoValorCampo]) VALUES (1, N'Texto')
INSERT [dbo].[TipoValorCampo] ([IdTipoValorCampo], [NamoTipoValorCampo]) VALUES (2, N'Numérico')
INSERT [dbo].[TipoValorCampo] ([IdTipoValorCampo], [NamoTipoValorCampo]) VALUES (3, N'Moeda')
SET IDENTITY_INSERT [dbo].[TipoValorCampo] OFF
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 4)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 5)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (1, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (1, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (1, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (1, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (2, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (2, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (2, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (2, N'asdsaf', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (2, N'', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 8)
INSERT [dbo].[ValorCampo] ([IdTipoCampo], [ValorCampo], [IdFormulario]) VALUES (3, N'5757', 8)
ALTER TABLE [dbo].[FormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCampos_Formulario1] FOREIGN KEY([IdFormulario])
REFERENCES [dbo].[Formulario] ([IdFormulario])
GO
ALTER TABLE [dbo].[FormularioCampos] CHECK CONSTRAINT [FK_FormularioCampos_Formulario1]
GO
ALTER TABLE [dbo].[FormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCampos_TipoCampo1] FOREIGN KEY([IdTipoCampo])
REFERENCES [dbo].[TipoCampo] ([IdTipoCampo])
GO
ALTER TABLE [dbo].[FormularioCampos] CHECK CONSTRAINT [FK_FormularioCampos_TipoCampo1]
GO
ALTER TABLE [dbo].[FormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_FormularioCampos_TipoValorCampo1] FOREIGN KEY([IdTipoValorCampo])
REFERENCES [dbo].[TipoValorCampo] ([IdTipoValorCampo])
GO
ALTER TABLE [dbo].[FormularioCampos] CHECK CONSTRAINT [FK_FormularioCampos_TipoValorCampo1]
GO
ALTER TABLE [dbo].[ValorCampo]  WITH CHECK ADD  CONSTRAINT [FK_ValorCampo_Formulario] FOREIGN KEY([IdFormulario])
REFERENCES [dbo].[Formulario] ([IdFormulario])
GO
ALTER TABLE [dbo].[ValorCampo] CHECK CONSTRAINT [FK_ValorCampo_Formulario]
GO
ALTER TABLE [dbo].[ValorCampo]  WITH CHECK ADD  CONSTRAINT [FK_ValorCampo_TipoValorCampo] FOREIGN KEY([IdTipoCampo])
REFERENCES [dbo].[TipoValorCampo] ([IdTipoValorCampo])
GO
ALTER TABLE [dbo].[ValorCampo] CHECK CONSTRAINT [FK_ValorCampo_TipoValorCampo]
GO
/****** Object:  StoredProcedure [dbo].[sp_formulario_campo_Inserir]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_formulario_campo_Inserir]
(
	 @IdTipoCampo int,
	 @IdTipoValorCampo int,
	 @IdFormulario int,
	 @DescricaoCampo nvarchar(150)
)
as
    insert into FormularioCampos(IdTipoCampo,IdTipoValorCampo,IdFormulario,DescricaoCampo)
	values(@IdTipoCampo,@IdTipoValorCampo,@IdFormulario,@DescricaoCampo)
	
GO
/****** Object:  StoredProcedure [dbo].[sp_formulario_Inserir]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_formulario_Inserir]
(
     @IdFormulario int output,
	 @NomeFormulario nvarchar(50),
	 @DataVencimentoInicio datetime,
	 @DataVencimentoFim datetime,
	 @DescricaoFormulario nvarchar(100)
)
as
    insert into Formulario(NomeFormulario,DataVencimentoInicio,DataVencimentoFim,DescricaoFormulario)
	values(@NomeFormulario,@DataVencimentoInicio,@DataVencimentoFim,@DescricaoFormulario)
	set @IdFormulario = SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[sp_s_get_formulario_campos]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- use AccessCorp

CREATE PROCEDURE [dbo].[sp_s_get_formulario_campos]
AS
BEGIN
	SELECT		
		f.*,
		'splitTipoCampo',
		tc.*,
		'splitTipoValorCampo',
		tvc.*
	FROM
		FormularioCampos AS FC
	INNER JOIN 
		Formulario AS F
	ON 
		FC.IdFormulario = F.IdFormulario
	INNER JOIN
		TipoCampo AS TC
	ON
		FC.IdTipoCampo = TC.IdTipoCampo
	INNER JOIN 
		TipoValorCampo AS TVC
	ON
		FC.IdTipoValorCampo = TVC.IdTipoValorCampo		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_valor_campo_Inserir]    Script Date: 4/10/2019 7:51:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_valor_campo_Inserir]
(
	 @IdTipoCampo int,
	 @IdFormulario int,
	 @ValorCampo nvarchar(30)
)
as
    insert into ValorCampo(IdTipoCampo,IdFormulario,ValorCampo)
	values				  (@IdTipoCampo,@IdFormulario,@ValorCampo)
	
GO
