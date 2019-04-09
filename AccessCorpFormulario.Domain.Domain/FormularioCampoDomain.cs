using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Domain.Domain
{
    public class FormularioCampoDomain
    {
        public FormularioDomain Formulario { get; set; }
        public TipoCampoDomain TipoCampo { get; set; }
        public TipoValorCampoDomain TipoValorCampo { get; set; }

        public List<FormularioCampoDomain> ListaFormularioCampoDomain { get; set; }

        public FormularioCampoDomain()
        {
            //ListaFormularioCampoDomain = new List<FormularioCampoDomain>
            //{
            //    new FormularioCampoDomain()
            //    {
            //        Formulario = this.Formulario,
            //        TipoCampo = this.TipoCampo,
            //        TipoValorCampo = this.TipoValorCampo
            //    }
            //};
        }
    }
}
