using AccessCorpFormulario.Domain.Domain;
using AccessCorpFormulario.Domain.ModelView;
using AccessCorpFormulario.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AccessCorpFormulario.Web.Controllers
{
    public class FormularioController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Cadastro()
        {
            var model = new CadastroFormularioCampoModelView();
            
            model.ListaTipoCampo = MockModelView.ListaTipoCampo();
            model.ListaTipoValorCampo = MockModelView.ListaTipoValorCampo();

            return View(model);
        }

        [HttpPost]
        public ActionResult Cadastro(FormularioModelView formulario)
        {

            var model = new CadastroFormularioCampoModelView();

            model.ListaTipoCampo = MockModelView.ListaTipoCampo();
            model.ListaTipoValorCampo = MockModelView.ListaTipoValorCampo();

            return View(model);
        }

        [HttpGet]
        public ActionResult Lista()
        {

            return View(MockModelView.MockListaFormularioModelView());
        }
        



    }
}