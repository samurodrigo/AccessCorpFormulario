(function () {
    'use strict';

    angular
        .module('app')
        .factory('FormularioCadastroService', ['$http', 'api', FormularioCadastroService]);

    function FormularioCadastroService($http, api) {
        var service = {
            getTipoCampo: getTipoCampo,
            getValorCampo: getValorCampo,
            postFormulario: postFormulario
        };

        return service;

        function getTipoCampo() {
            return $http({
                method: 'GET',
                url: api + '/tipo-campo/lista'
            });
        }

        function getValorCampo() {
            return $http({
                method: 'GET',
                url: api + '/tipo-valor-campo/lista'
            });
        }

        function postFormulario(data) {
            return $http({
                method: "POST",
                url: api + '/Formulario/cadastrar',
                data: data
            });
        }
    }
})();