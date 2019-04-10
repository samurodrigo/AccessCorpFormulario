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
    [RoutePrefix("api/v1/tipo-campo")]
    public class TipoCampoController : ApiController
    {
        private readonly ITipoCampoApplicionServie _tipoCampoApplicionServie;

        public TipoCampoController(ITipoCampoApplicionServie tipoCampoApplicionServie)
        {
            _tipoCampoApplicionServie = tipoCampoApplicionServie;
        }

        [Route("lista")]
        [HttpGet]
        public List<TipoCampoModelView> GetLista()
        {
            return ListaTipoCampoMock();
        }
       // public async Task<IHttpActionResult> ListaTipoCampo()
       //{
       //     var lista = await _tipoCampoApplicionServie.List();

        //     if (lista != null && lista.ToList().Count() > 0)
        //     {
        //         return Ok(lista);
        //     }
        //     else
        //     {
        //         return BadRequest("Não tem dados no banco de dados.");
        //     }
        // }

        public List<TipoCampoModelView>  ListaTipoCampoMock()
        {
            var lista = new List<TipoCampoModelView>{
                
                new TipoCampoModelView{
                    NomeTipoCampo = "Textbox",
                    IdTipoCampo = 1
                },
                new TipoCampoModelView{
                    NomeTipoCampo = "Dropbox",
                    IdTipoCampo = 2
                },
                new TipoCampoModelView{
                    NomeTipoCampo = "Radio Button",
                    IdTipoCampo = 3
                }
            };

            return lista;
        }
    }
}
