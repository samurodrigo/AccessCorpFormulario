using AccessCorpFormulario.Domain.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Domain.ModelView.Mappers
{
    public static class FormlarioMapper
    {
        public static FormularioDomain FormularioDomainToFormularioModelView(FormularioModelView formularioModelView)
        {
            var formularioDomain = new FormularioDomain();

            if (formularioDomain != null)
            {
                formularioDomain.IdFormulario = formularioModelView.IdFormulario;
                formularioDomain.NomeFormulario = formularioModelView.NomeFormulario;
                formularioDomain.DescricaoFormulario = formularioModelView.DescricaoFormulario;
                formularioDomain.DataVencimentoInicio = formularioModelView.DataVencimentoInicio;
                formularioDomain.DataVencimentoFim = formularioModelView.DataVencimentoFim;

                if (formularioModelView.FormularioCampos != null && formularioModelView.FormularioCampos.Count > 0)
                {
                    FormularioCampoDomain formularioCampoDomain = null;

                    foreach (var formularioCampo in formularioModelView.FormularioCampos)
                    {
                        formularioDomain.FormularioCampos = new List<FormularioCampoDomain>();

                        formularioCampoDomain = new FormularioCampoDomain();
                        formularioCampoDomain.TipoValorCampo = new TipoValorCampoDomain { IdTipoValorCampo = formularioCampo.IdTipovalorCampo };
                        formularioCampoDomain.TipoCampo = new TipoCampoDomain { IdTipoCampo = formularioCampo.IdTipoCampo };

                        if (formularioCampo.IdTipovalorCampo == 1)// DropDownList / Combobox
                        {
                            formularioCampoDomain.ValoresCombobox = formularioCampo.ValoresCombobox;
                        }
                        else
                        {
                            formularioCampoDomain.ValorCampo = formularioCampo.ValorCampo;
                        }

                        formularioDomain.FormularioCampos.Add(formularioCampoDomain);
                    }
                }
            }

            return formularioDomain;
        }
    }
}
