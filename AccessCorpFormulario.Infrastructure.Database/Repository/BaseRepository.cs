using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace AccessCorpFormulario.Infrastructure.Database.Repository
{
    public class BaseRepository
    {
        private readonly string StringConnection;

        public BaseRepository()
        {
            StringConnection = ConfigurationManager.ConnectionStrings["databaseAccessCorp"].ConnectionString;
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(StringConnection);
        }
    }
}
