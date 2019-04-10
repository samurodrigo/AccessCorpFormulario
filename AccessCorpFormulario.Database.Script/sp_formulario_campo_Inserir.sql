
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
	