
//$(function () {

//    $("#erro-quantidade-linha-obrigatorio").hide();
//    esconderOuMostrar(true, "btnAdicinarCampoParaCombobox");
//    habilitarOuDesabilitar(false, "adiconarMaisCampos");
//    addEvents();
//});

//$(document).on('click', '#removerLabel', function () {
//    $(this).parent().remove();
//});

//$(document).on('click', '.excluir-linha-tabela', function () {
//    $(this).parent().parent().remove();
//});

//function addEvents() {

//    $("form").submit(function () {

//        var formValid = $(this).valid() & validarQuatidadeLinhaTabela();

//        if (formValid) {
//            salvar();
//        }

//        return false;
//    });

//    $("#idTipoCampo").on("change", function () {
//        var tipoCampo = $(this).find(":selected").text();

//        if (tipoCampo.toUpperCase() == "DROPBOX") {
//            esconderOuMostrar(false, "btnAdicinarCampoParaCombobox");
//        } else {
//            esconderOuMostrar(true, "btnAdicinarCampoParaCombobox");
//        }
//        verificarTipoCampoPreenchidos();
//        removerLabelCombo();
//    });

//    $("#idTipoValorCampo").on("change", function () {
//        verificarTipoCampoPreenchidos();
//    });

//    $("#btnAdicinarCampoParaCombobox").on("click", function () {
//        addValoresCombo();
//    });

//    $("#btnAdiconarMaisCampos").on("click", function () {
//        adiconarMaisCampos();
//        removerLabelCombo();
//        validarQuatidadeLinhaTabela();
//    });
//}

//function validarQuatidadeLinhaTabela() {
//    var ehValido = true;
//    if ($("#table-campos tbody tr ").length < 10) {
//        $("#erro-quantidade-linha-obrigatorio").show();
//        ehValido = false;
//    } else {
//        $("#erro-quantidade-linha-obrigatorio").hide();
//        ehValido = true;
//    }
//    return ehValido;
//}

//function salvar() {
//    var tableCampos = $("#table-campos tbody tr");
//    var dadosTabela = [];
//    var nomeFormulario = $("#NomeFormulario").val();
//    var dataVencimentoInicio = $("#DataVencimentoInicio").val();
//    var dataVencimentoFim = $("#DataVencimentoFim").val();
//    var descricaoFormulario = $("#DescricaoFormulario").val();


//    $("#table-campos tbody tr").each(function () {

//        var idTipoCampo = $(this).find(".tipoCampo").data("id");
//        var idTipovalorCampo = $(this).find(".tipoValorCampo").data("id");
//        var valoresCombobox = [];
//        var valorCampo = "";

//        if (idTipoCampo === 2) {// Valores para o Campo Combobox
//            valoresCombobox = addValoresCombobox($(this).find(".dados-combobox"));
//        } else {
//            valorCampo = $(this).find(".campo-simples").text();
//        }

//        var campos = new Campos(idTipoCampo, idTipovalorCampo, valorCampo , valoresCombobox);

//        dadosTabela.push(campos);
//    });

//    var formulario = new FormularioCampo(nomeFormulario, dataVencimentoInicio, dataVencimentoFim, descricaoFormulario, dadosTabela);

//    console.log(formulario);

//    cadastrarFormulario(formulario);
//}

//function Campos(tipoCampo, tipovalorCampo, valorCampo, valoresCombobox) {
//    this.IdTipoCampo = tipoCampo;
//    this.IdTipovalorCampo = tipovalorCampo;
//    this.ValorCampo = valorCampo;
//    this.ValoresCombobox = valoresCombobox;
//}

//function FormularioCampo(nomeFormulario, dataVencimentoInicio, dataVencimentoFim, descricaoFormulario, formularioCampos) {
//    this.NomeFormulario = nomeFormulario;
//    this.DataVencimentoInicio = dataVencimentoInicio;
//    this.DataVencimentoFim = dataVencimentoFim;
//    this.DescricaoFormulario = descricaoFormulario;
//    this.FormularioCampos = formularioCampos;
//}

//function addValoresCombobox(valoresCampo) {

//    var valoresCombobox = [];

//    $(valoresCampo).find("label").each(function () {

//        valoresCombobox.push($(this).text());
//    });

//    return valoresCombobox;
//}

//function adiconarMaisCampos() {
//    var tipoCampo = $("#idTipoCampo").find(":selected").text();
//    var idTipoCampo = $("#idTipoCampo").find(":selected").val();

//    var tipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
//    var idTipoValorCampo = $("#idTipoValorCampo").find(":selected").val();

//    var html = "<tr>";
//    html += "<td class='tipoCampo' data-id='" + idTipoCampo + "'>" + tipoCampo + "</td>";
//    html += "<td class='tipoValorCampo' data-id='" + idTipoValorCampo + "'>" + tipoValorCampo + "</td>";

//    if (tipoCampo === "Dropbox") {
//        var valorCampo = removerSpan($("#addValoresCombo").html());
//        html += "<td class='dados-combobox'>" + valorCampo + "</td>";
//    } else {
//        html += "<td class='campo-simples'>" + $("#ValorCampo").val() + "</td>";
//    }

//    html += "<td><button type='button' class='btn btn-primary excluir-linha-tabela' >Excluir</button></td>";
//    html += "</tr>";

//    $("#table-campos").append(html);
//}

//function removerLabelCombo() {
//    $("#addValoresCombo").find("label").remove();
//}

//function removerSpan(html) {

//    var isTrue = true;

//    while (isTrue) {

//        if (html.indexOf("</span>") >= 0) {

//            html = html.replace('<span id="removerLabel">X</span>', "");
//        } else {
//            isTrue = false;
//        }
//    }

//    return html;
//}

//function addValoresCombo() {
//    var idTipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
//    var valorCampo = $("#ValorCampo").val();

//    $("#addValoresCombo").append("<label class='label-valores-campo-combo label label-primary'>" + valorCampo + "<span id='removerLabel'>X</span></label>");

//}

//function esconderOuMostrar(ehEsconder, id) {
//    if (ehEsconder) {
//        $("#" + id).hide();
//    } else {
//        $("#" + id).show();
//    }
//}

//function habilitarOuDesabilitar(ehHabilitar, id) {
//    if (ehHabilitar) {
//        $("#" + id).prop("disabled", false);
//    } else {
//        $("#" + id).prop("disabled", true);
//    }
//}

//function verificarTipoCampoPreenchidos() {
//    var todosCamposPreenchidos = true;

//    var idTipoCampo = $("#idTipoCampo").find(":selected").text();
//    var idTipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
//    var valorCampo = $("#ValorCampo").val();

//    if (idTipoCampo === "-- Selecionar --") {
//        todosCamposPreenchidos = false;
//    }

//    if (idTipoValorCampo === "-- Selecionar --") {
//        todosCamposPreenchidos = false;
//    }

//    if (todosCamposPreenchidos) {
//        habilitarOuDesabilitar(true, "adiconarMaisCampos");
//    } else {
//        habilitarOuDesabilitar(false, "adiconarMaisCampos");
//    }
//}

