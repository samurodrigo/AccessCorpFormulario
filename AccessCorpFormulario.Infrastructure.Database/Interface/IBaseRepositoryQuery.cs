using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Infrastructure.Database.Interface
{
    public interface IBaseRepositoryQuery<T> where T : class
    {
        Task<T> GetById(int id);
        Task<IEnumerable<T>> List();
    }
}
