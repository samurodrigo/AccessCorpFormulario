﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Domain.ModelView
{
    public class FormularioCampoModelView
    {
        public int IdTipoCampo { get; set; }
        public int IdTipovalorCampo { get; set; }
        public string ValorCampo { get; set; }
        public List<string> ValoresCombobox { get; set; } 
    }
}
