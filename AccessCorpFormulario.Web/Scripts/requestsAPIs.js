function cadastrarFormulario(dados) {
    var url = "http://localhost:54740/api/v1/Formulario/cadastrar";

    OnPost(dados, url);
}

function OnPost(dados, url) {

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(dados),
        contentType: "application/json; charset=utf-8",
        success: function onSuccess() {
            alert("OK");
        },
        error: function onError(e, status, response) {
            alert("Erro no server. Tente mais tarde.");
        }
    });
}


