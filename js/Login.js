$(document).ready(function () {
    $('#ErrorMessage').hide();
    $('#BtnLogin').click(Login);
});

function Login() {
    $('#ErrorMessage').hide();
    var ok = true;
    var errorMessage = '';
    if ($('#TxtUserName').val() == '') {
        ok = false;
        $('#TxtUserName').css('background-color', '#f00');
        errorMessage = 'El nombre de usuario es obligatorio.';
    }
    else {
        $('#TxtUserName').css('background-color', 'transparent');
    }

    if ($('#TxtPassword').val() == '') {
        ok = false;
        $('#TxtPassword').css('background-color', '#f00');
        if (errorMessage != '') {
            errorMessage += '<br />';
        }
        errorMessage += 'La contraseña es obligatoria.';
    }
    else {
        $('#TxtPassword').css('background-color', 'transparent');
    }

    if (ok) {
        var webMethod = "/Async/LoginActions.asmx/GetLogin";
        var data = {
            'userName': $('#TxtUserName').val(),
            'password': $('#TxtPassword').val(),
            'company': $('#TxtCompany').val(),
            'ip': ip
        };

        $.ajax({
            type: "POST",
            url: webMethod,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data, null, 2),
            success: function (msg) {
                var result = msg.d;
                if (result.Id == -1) {
                    alert('Acceso no válido');
                }
                else if (result.CompanyId == 1) {
                    document.location = 'admin';
                }
                else if (result.CompanyId == 2) {
                    document.location = 'CompanySelect.aspx';
                }
                else {
                    $('#UserId').val(result.Id);
                    $('#CompanyId').val(result.CompanyId);
                    $('#LoginForm').submit();
                }
            },
            error: function (msg) {
                alert(msg);
            }
        });
    }
    else {
        $('#ErrorMessage').html(errorMessage);
        $('#ErrorMessage').show();
    }
}

function LoginResultToRext(value) {
    for (var x = 0; x < LoginResult.length; x++) {
        if (LoginResult[x].value == value) {
            return LoginResult[x].text;
        }
    }

    return 'undefined';
}