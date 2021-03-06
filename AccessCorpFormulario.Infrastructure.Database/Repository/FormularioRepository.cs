﻿using AccessCorpFormulario.Domain.Domain;
using AccessCorpFormulario.Infrastructure.Database.Interface;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessCorpFormulario.Infrastructure.Database.Repository
{
    public class FormularioRepository : BaseRepository, IFormularioRepository
    {
        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Task<FormularioDomain> GetById(int id)
        {
            throw new NotImplementedException();
        }

        public int Insert(FormularioDomain t)
        {
            using (var db = GetConnection())
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("@IdFormulario", dbType: DbType.Int32, direction: ParameterDirection.Output);
                p.AddDynamicParams(
                    new
                    {
                        NomeFormulario = t.NomeFormulario,
                        DataVencimentoInicio = t.DataVencimentoInicio,
                        DataVencimentoFim = t.DataVencimentoFim,
                        DescricaoFormulario = t.DescricaoFormulario
                    });

                int resultado = db.Execute("sp_formulario_Inserir", p, commandType: CommandType.StoredProcedure);
                if (resultado != 0)
                {
                    return p.Get<int>("@IdFormulario");
                }
                return 0;
            }
        }

        public Task<IList<FormularioDomain>> List()
        {
            throw new NotImplementedException();
        }

        public void Update(FormularioDomain t)
        {
            throw new NotImplementedException();
        }
    }
}
