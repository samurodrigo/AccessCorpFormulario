-- use AccessCorp

CREATE PROCEDURE sp_s_get_formulario_campos
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


