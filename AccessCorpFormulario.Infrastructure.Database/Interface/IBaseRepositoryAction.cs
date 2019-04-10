using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Infrastructure.Database.Interface
{
    public interface IBaseRepositoryAction<T> where T: class
    {
        int Insert(T t);
        void Update(T t);
        void Delete(int id);
    }
}
