using AccessCorpFormulario.AplicationService.Service.Interfaces;
using AccessCorpFormulario.Domain.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace AccessCorpFormulario.Apresentation.API.Controllers
{
    [RoutePrefix("api/v1/tipo-valor-campo")]
    public class TipoValorCampoController : ApiController
    {
        private readonly ITipoValorCampoApplicionServie _tipoValorCampoApplicionServie;

        public TipoValorCampoController(ITipoValorCampoApplicionServie tipoValorCampoApplicionServie)
        {
            _tipoValorCampoApplicionServie = tipoValorCampoApplicionServie;
        }

        [Route("lista")]
        [HttpGet]
        public List<TipoValorCampoModelView> GetLista()
        {
            return ListaTipoValorCampoMock();
        }

        //public async Task<IHttpActionResult> ListaTipoValorCampo()
        //{
        //    var lista = await _tipoValorCampoApplicionServie.List();

        //    if (lista != null && lista.ToList().Count() > 0)
        //    {
        //        return Ok(lista);
        //    }
        //    else
        //    {
        //        return BadRequest("Não tem dados no banco de dados.");
        //    }
        //}

        public List<TipoValorCampoModelView> ListaTipoValorCampoMock()
        {
            var lista = new List<TipoValorCampoModelView>
            {
                new TipoValorCampoModelView { NomeTipoValorCampo = "Texto", IdTipoValorCampo = 1 },
                new TipoValorCampoModelView { NomeTipoValorCampo = "Numérico", IdTipoValorCampo = 2 },
                new TipoValorCampoModelView { NomeTipoValorCampo = "Moeda", IdTipoValorCampo = 3 }
            };

            return lista;
        }
    }
}
