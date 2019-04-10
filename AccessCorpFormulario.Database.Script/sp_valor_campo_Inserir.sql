CREATE procedure [dbo].[sp_valor_campo_Inserir]
(
	 @IdTipoCampo int,
	 @IdFormulario int,
	 @ValorCampo nvarchar(30)
)
as
    insert into ValorCampo(IdTipoCampo,IdFormulario,ValorCampo)
	values				  (@IdTipoCampo,@IdFormulario,@ValorCampo)
	