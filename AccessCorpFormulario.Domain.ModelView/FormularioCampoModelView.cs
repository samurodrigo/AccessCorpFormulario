using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace AccessCorpFormulario.Domain.ModelView
{
    public class FormularioCampoModelView
    {
        public int Id { get; set; }

        [Display(Name = "Nome do formulário")]
        public string NomeFormulario { get; set; }

        [Display(Name = "Data vencimento início")]
        public string DataVencimentoInicio { get; set; }

        [Display(Name = "Data vencimento fim")]
        public string DataVencimentoFim { get; set; }

        [Display(Name = "Descrição formulário")]
        public string DescricaoFormulario { get; set; }

        [Display(Name = "Tipo de Campo")]
        public int IdTipoCampo { get; set; }


        [Display(Name = "Tipo do valor de campo")]
        public int IdTipoValorCampo { get; set; }

        [Display(Name = "Valor do Campo")]
        public string ValorCampo { get; set; }
        
        [Display(Name = "Lista do tipo de campo")]
        public List<ListItem> ListaTipoCampo { get; set; }

        [Display(Name = "Lista do tipo do valor de campo")]
        public List<ListItem> ListaTipoValorCampo { get; set; }

        public List<string> MyProperty { get; set; }
    }
}
