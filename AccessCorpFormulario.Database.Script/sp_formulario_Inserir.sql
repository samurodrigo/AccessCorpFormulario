
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

