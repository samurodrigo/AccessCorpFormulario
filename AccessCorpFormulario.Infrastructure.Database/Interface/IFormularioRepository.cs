using AccessCorpFormulario.Domain.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Infrastructure.Database.Interface
{
    public interface IFormularioRepository : IBaseRepositoryAction<FormularioDomain>
    {
    }
}
