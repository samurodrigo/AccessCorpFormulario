﻿using AccessCorpFormulario.Domain.Domain;
using AccessCorpFormulario.Domain.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.AplicationService.Service.Interfaces
{
    public interface IFormularioApplicionServie: IBaseAplicationServiceQuery<FormularioModelView>, IBaseAplicationServiceAction<FormularioModelView>
    {

    }
}
