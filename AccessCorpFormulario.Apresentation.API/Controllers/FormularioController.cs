﻿using AccessCorpFormulario.AplicationService.Service.Interfaces;
using AccessCorpFormulario.Domain.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AccessCorpFormulario.Apresentation.API.Controllers
{
    [RoutePrefix("api/v1/Formulario")]
    public class FormularioController : ApiController
    {
        private readonly IFormularioApplicionServie _formularioApplicionServie;

        public FormularioController(IFormularioApplicionServie formularioApplicionServie)
        {
            _formularioApplicionServie = formularioApplicionServie;
        }

        [Route("cadastrar")]
        [HttpPost]
        public IHttpActionResult PostCadastrar([FromBody] FormularioModelView formulario)
        {
            _formularioApplicionServie.Insert(formulario);
            return Ok();
        }
    }
}
