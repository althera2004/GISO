$(document).ready(function () {
    $('#BtnNewVersion').click(Versioned);
    $('#BtnSave').click(Update);
});

function Versioned() {
    // public ActionResult Versioned(int documentId, int userId, int companyId, int version)
    var webMethod = "/Async/DocumentActions.asmx/Versioned";

    var data = {
        'documentId': documentId,
        'userId': userId,
        'companyId': companyId,
        'version': $('#TxtRevision').val()
    };

    $.ajax({
        type: "POST",
        url: webMethod,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(data, null, 2),
        success: function (msg) {
            var result = msg.d;
            if (result.CompanyId == 1) {
                document.location = 'admin';
            }
            else if (result.CompanyId == 2) {
                document.location = 'CompanySelect.aspx';
            }
            else {
                document.location = document.location + '';
            }
        },
        error: function (msg) {
            alert(msg);
        }
    });
}


function Update() {
    // public ActionResult Update(int documentId, int userId, int companyId, Document document)
    var webMethod = "/Async/DocumentActions.asmx/Update";

    var fechaBaja = null;
    if ($('#TxtFechaBaja').val() != '') {
        fechaBaja = GetDate($('#TxtFechaBaja').val(), '/');
    }

    var newDocument = {
        'Id': documentId,
        'Codigo': $('#TxtCodigo').val(),
        'Desription': $('#TxtDocumento').val(),
        'Ubicacion': $('#TxtUbicacion').val(),
        'FechaBaja': fechaBaja,
        'Origen': $('#CmbOrigen').val() == 0,
        'Conservacion': $('#TxtConservacion').val(),
        'ConservacionTipo': $('#cmbconservacion').val()
    };

    var categoryId = $('#CmbCategoria').val();
    var procedenciaId = $('#CmbProcedencia').val();
    var categoryName = '';
    var procedenciaName = '';

    for (var x = 0; x < categorias.length; x++) {
        if (categorias[x].value == categoryId * 1) {
            categoryName = categorias[x].key;
            break;
        }
    }

    for (var x = 0; x < procedencias.length; x++) {
        if (procedencias[x].value == procedenciaId * 1) {
            procedenciaName = procedencias[x].key;
            break;
        }
    }

    var data = {
        'documentId': documentId,
        'userId': userId,
        'companyId': companyId,
        'document': newDocument,
        'categoryId': categoryId,
        'procedenciaId': procedenciaId,
        'categoryName': categoryName,
        'procedenciaName': procedenciaName
    };

    $.ajax({
        type: "POST",
        url: webMethod,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(data, null, 2),
        success: function (msg) {
            var result = msg.d;
            if (result.CompanyId == 1) {
                document.location = 'admin';
            }
            else if (result.CompanyId == 2) {
                document.location = 'CompanySelect.aspx';
            }
            else {
                document.location = document.location + '';
            }
        },
        error: function (msg) {
            alert(msg);
        }
    });

}