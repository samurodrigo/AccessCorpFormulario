(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormularioCadastroController', FormularioCadastroController);

    FormularioCadastroController.$inject = ['$location', '$timeout', 'FormularioCadastroService'];

    function FormularioCadastroController($location, $timeout, FormularioCadastroService) {
        /* jshint validthis:true */
        var vm = this;
        vm.campo = {};
        vm.campos = [];

        activate();

        function activate() {
            FormularioCadastroService
                .getTipoCampo()
                .then(function (response) {
                    $timeout(function () {
                        vm.tiposCampo = response.data;
                    });
                })
                .catch(function (error) {
                    console.log(error);
                });

            FormularioCadastroService
                .getValorCampo()
                .then(function (response) {
                    $timeout(function () {
                        vm.valoresCampo = response.data;
                    });
                })
                .catch(function (error) {
                    console.log(error);
                });

            vm.salvarFormulario = function () {
                var dados = {
                    NomeFormulario: vm.nomeFormulario,
                    DataVencimentoInicio: vm.dataVencimentoInicio,
                    DataVencimentoFim: vm.dataVencimentoFim,
                    DescricaoFormulario: vm.descricaoFormulario,
                    Ativo: true,
                    Situacao: "",
                    FormularioCampos: vm.campos.map(function (campo) {
                        return {
                            IdTipoCampo: campo.tipoCampo.IdTipoCampo,
                            IdTipovalorCampo: campo.tipoValorCampo.IdTipoValorCampo,
                            ValorCampo: campo.valorCampo,
                            ValoresCombobox: campo.valores || []
                        };
                    })                 
                };
                FormularioCadastroService.postFormulario(dados);
            };
            vm.adicionarCampo = function () {
                vm.campos.push(angular.copy(vm.campo));
                vm.campo = {};
            };
            vm.excluirCampo = function (campo) {
                vm.campos.splice(vm.campos.indexOf(campo), 1);
            };
            vm.adicionarValorCampoParaCombobox = function (campo, valor) {
                if (!campo.valores)
                    campo.valores = [];
                var existe = campo.valores.find(function (item) {
                    return item === valor;
                });
                if (!existe) {
                    campo.valores.push(angular.copy(valor));
                    vm.campo.valorCampo = "";
                }
                else {
                    alert("O valor informado já foi inserido");
                }
            };

            vm.removerValorCampoParaCombobox = function (campo, valor) {
                campo.valores.splice(campo.valores.indexOf(valor), 1);
            };
        }
    }
})();
