using AccessCorpFormulario.AplicationService.Service.Interfaces;
using AccessCorpFormulario.Domain.Domain;
using AccessCorpFormulario.Domain.ModelView;
using AccessCorpFormulario.Domain.ModelView.Mappers;
using AccessCorpFormulario.Infrastructure.Database.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace AccessCorpFormulario.AplicationService.Service.Implementations
{
    public class FormularioApplicionServie : IFormularioApplicionServie
    {
        private readonly IFormularioRepository _formularioRepository;
        private readonly IFormularioCamposRepository _formularioCamposRepository;
        private readonly IValorCampoRepository _valorCampoRepository;

        public FormularioApplicionServie(IFormularioRepository formularioRepository, IFormularioCamposRepository formularioCamposRepository, IValorCampoRepository valorCampoRepository)
        {
            _formularioRepository = formularioRepository;
            _formularioCamposRepository = formularioCamposRepository;
            _valorCampoRepository = valorCampoRepository;
        }

        public void Delete(int id)
        {
            _formularioRepository.Delete(id);
        }

        public Task<FormularioModelView> GetById(int id)
        {
            var formulario = _formularioRepository.GetById(id);

            return null;
        }

        public void Insert(FormularioModelView t)
        {
            using (TransactionScope scope = new TransactionScope())
            {
                var formularioDomain = FormlarioMapper.FormularioDomainToFormularioModelView(t);

                var idFormulario = _formularioRepository.Insert(formularioDomain);

                foreach (var formularioCampo in formularioDomain.FormularioCampos)
                {
                    formularioCampo.FormularioDomain = new FormularioDomain() { IdFormulario = idFormulario };
                    _formularioCamposRepository.Insert(formularioCampo);

                    if (formularioCampo.ValoresCombobox != null && formularioCampo.ValoresCombobox.Count > 0)
                    {
                        ValorCampoDomain valorCampoDomain = null;

                        foreach (var item in formularioCampo.ValoresCombobox)
                        {
                            valorCampoDomain = new ValorCampoDomain() {IdFormulario = idFormulario, IdTipoCampo = formularioCampo.TipoCampo.IdTipoCampo, ValorCampo = item };

                            _valorCampoRepository.Insert(valorCampoDomain);
                        }
                    }
                    else
                    {
                        var valorCampoDomain = new ValorCampoDomain() { IdFormulario = idFormulario, IdTipoCampo = formularioCampo.TipoCampo.IdTipoCampo, ValorCampo = formularioCampo.ValorCampo };
                        _valorCampoRepository.Insert(valorCampoDomain);
                    }
                }

                scope.Complete();
            }
        }

        public Task<IList<FormularioModelView>> List()
        {
            var lista = _formularioRepository.List();

            return null;
        }

        public void Update(FormularioModelView t)
        {
            _formularioRepository.Update(null);
        }
    }
}
