
$(function () {

    esconderOuMostrar(true, "btnAdicinarCampoParaCombobox");
    habilitarOuDesabilitar(false, "adiconarMaisCampos");
    addEvents();
});

$(document).on('click', '#removerLabel', function () {
    $(this).parent().remove();
});

$(document).on('click', '.excluir-linha-tabela', function () {
    $(this).parent().parent().remove();
});

function addEvents() {
    $("#idTipoCampo").on("change", function () {
        var tipoCampo = $(this).find(":selected").text();

        if (tipoCampo.toUpperCase() == "DROPBOX") {
            esconderOuMostrar(false, "btnAdicinarCampoParaCombobox");
        } else {
            esconderOuMostrar(true, "btnAdicinarCampoParaCombobox");
        }
        verificarTipoCampoPreenchidos();
        removerLabelCombo();
    });

    $("#idTipoValorCampo").on("change", function () {
        verificarTipoCampoPreenchidos();
    });

    $("#btnAdicinarCampoParaCombobox").on("click", function () {
        addValoresCombo();
    });

    $("#btnAdiconarMaisCampos").on("click", function () {
        adiconarMaisCampos();
        removerLabelCombo();
    });

    $("#btnSalvar").on("click", function () {
        salvar();
    });
}

function Campos(tipoCampo, tipovalorCampo, valorCampo, valoresCombobox) {
    this.tipoCampo = tipoCampo;
    this.tipovalorCampo = tipovalorCampo;
    this.valorCampo = valorCampo;
    this.valoresCombobox = valoresCombobox;
}

function salvar() {
    var tableCampos = $("#table-campos tbody tr");
    var dados = [];

    $("#table-campos tbody tr").each(function () {

        var tipoCampo = $(this).find(".tipoCampo").text();
        var tipovalorCampo = $(this).find(".tipoValorCampo").text();
        var valoresCombobox = [];
        var valorCampo = "";


        if (tipoCampo === "Dropbox") {
            valoresCombobox = addVoresCombobox($(this).find(".dados-combobox"));
        } else {
            valorCampo = $(this).find(".campo-simples").text();
        }

        var campos = new Campos(tipoCampo, tipovalorCampo, valorCampo, valoresCombobox);

        dados.push(campos);
    });

    console.log(dados);
}

function addVoresCombobox(valoresCampo) {

    var valoresCombobox = [];

    $(valoresCampo).find("label").each(function () {

        valoresCombobox.push($(this).text());
    });

    return valoresCombobox;
}

function adiconarMaisCampos() {
    var idTipoCampo = $("#idTipoCampo").find(":selected").text();

    var tipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
    var html = "<tr>";
    html += "<td class='tipoCampo'>" + idTipoCampo + "</td>";
    html += "<td class='tipoValorCampo'>" + tipoValorCampo + "</td>";

    if (idTipoCampo === "Dropbox") {
        valorCampo = removerSpan($("#addValoresCombo").html());
        html += "<td class='dados-combobox'>" + valorCampo + "</td>";
    } else {
        html += "<td class='campo-simples'>" + $("#ValorCampo").val() + "</td>";
    }

    html += "<td><button type='button' class='btn btn-primary excluir-linha-tabela' >Excluir</button></td>";
    html += "</tr>";

    $("#table-campos").append(html);
}

function removerLabelCombo() {
    $("#addValoresCombo").find("label").remove();
}

function removerSpan(html) {

    var isTrue = true;

    while (isTrue) {

        if (html.indexOf("</span>") >= 0) {

            html = html.replace('<span id="removerLabel">X</span>', "");
        } else {
            isTrue = false;
        }
    }

    return html;
}

function addValoresCombo() {
    var idTipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
    var valorCampo = $("#ValorCampo").val();

    $("#addValoresCombo").append("<label class='label-valores-campo-combo label label-primary'>" + valorCampo + "<span id='removerLabel'>X</span></label>");

}

function esconderOuMostrar(ehEsconder, id) {
    if (ehEsconder) {
        $("#" + id).hide();
    } else {
        $("#" + id).show();
    }
}

function habilitarOuDesabilitar(ehHabilitar, id) {
    if (ehHabilitar) {
        $("#" + id).prop("disabled", false);
    } else {
        $("#" + id).prop("disabled", true);
    }
}

function verificarTipoCampoPreenchidos() {
    var todosCamposPreenchidos = true;

    var idTipoCampo = $("#idTipoCampo").find(":selected").text();
    var idTipoValorCampo = $("#idTipoValorCampo").find(":selected").text();
    var valorCampo = $("#ValorCampo").val();

    if (idTipoCampo === "-- Selecionar --") {
        todosCamposPreenchidos = false;
    }

    if (idTipoValorCampo === "-- Selecionar --") {
        todosCamposPreenchidos = false;
    }

    if (todosCamposPreenchidos) {
        habilitarOuDesabilitar(true, "adiconarMaisCampos");
    } else {
        habilitarOuDesabilitar(false, "adiconarMaisCampos");
    }
}

