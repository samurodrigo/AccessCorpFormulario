using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Domain.ModelView
{
    public class FormularioModelView
    {
        public int IdFormulario { get; set; }
       
        [Display(Name = "Nome")]
        public string NomeFormulario { get; set; }

        [Display(Name = "Data vencimento início")]
        public string DataVencimentoInicio { get; set; }

        [Display(Name = "Data vencimento fim")]
        public string DataVencimentoFim { get; set; }

        [Display(Name = "Descrição Formulário")]
        public string DescricaoFormulario { get; set; }

        [Display(Name = "Está ativo?")]
        private bool Ativo { get; set; }

        [Display(Name = "Situação")]
        public string Situacao
        {
            get
            {
                return Ativo ? "Ativo" : "Inativo";
            }
        }

        public List<FormularioCampoModelView> FormularioCampos { get; set; }
    }
}
