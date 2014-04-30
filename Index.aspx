<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>GISO</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/script.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        var text = {
            es:{
                title:'Introduzca datos de acceso',
                labelUser:'Nombre de usuario',
                labelPassword:'Contraseña',
                action:'Acceder',
                errorTitle:'Error de acceso',
                errorText:'Los datos no son válido para el acceso a la aplicación'
            },
            ca:{
                title:"Insereixi dades d'accés",
                labelUser:"Nom d'usuari",
                labelPassword:'Paraula de pas',
                action: 'Accedir',
                errorTitle: 'Error de acceso',
                errorText: "Les dades no son vàlides per accedir a l'aplicació"
            },
            en:{
                title:'Enter data access',
                labelUser:'Username',
                labelPassword:'Password',
                action: 'Login',
                errorTitle: 'Login error',
                errorText: 'Data are not valid for application access'
            }
        };

        function LanguageChanged(language) {
            switch (language) {
                case 'es-es':
                    $('#TextTitle').html(text.es.title);
                    $('#TextUsername').html(text.es.labelUser);
                    $('#TextPassword').html(text.es.labelPassword);
                    $('#ErrorTitle').html(text.es.errorTitle);
                    $('#ErrorText').html(text.es.errorText);
                    $('#BtnSaveUser').val(text.es.action);
                    break;
                case 'ca-es':
                    $('#TextTitle').html(text.ca.title);
                    $('#TextUsername').html(text.ca.labelUser);
                    $('#TextPassword').html(text.ca.labelPassword);
                    $('#ErrorTitle').html(text.ca.errorTitle);
                    $('#ErrorText').html(text.ca.errorText);
                    $('#BtnSaveUser').val(text.ca.action);
                    break;
                case 'en-us':
                    $('#TextTitle').html(text.en.title);
                    $('#TextUsername').html(text.en.labelUser);
                    $('#TextPassword').html(text.en.labelPassword);
                    $('#ErrorTitle').html(text.en.errorTitle);
                    $('#ErrorText').html(text.en.errorText);
                    $('#BtnSaveUser').val(text.en.action);
                    break;
            }
        }

        window.onload = function () {
            LanguageChanged('es-es');
        }

        function Login() {
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
                    'password': $('#TxtPassword').val()
                };

                $.ajax({
                    type: "POST",
                    url: webMethod,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data, null, 2),
                    success: function (msg) {
                        var result = msg.d;
                        if (result.CompanyId == 0) {
                            $('#ErrorMessage').show();
                            return false;
                        }
                        if (result.CompanyId == 1) {
                            document.location = 'admin';
                        }
                        else if (result.CompanyId == 2) {
                            document.location = 'CompanySelect.aspx';
                        }
                        else {
                            $('#UserId').val(result.Id);
                            $('#CompanyId').val(result.CompanyId);
                            $('#MainMenu').submit();
                        }
                    },
                    error: function (msg) {
                        alert('weke' + msg);
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
    </script>
</head>

<body>
    <img src="images/login/login_bg2.jpg" class="login_bg" alt="" />
    
	<div class="login_warper">
    
        <table width="95%" cellspacing="5" class="login_form">
          <tr>
           <td colspan="2" align="center">
            <h1><span id="TextTitle"></span></h1>
           </td>
          </tr>
          <tr>
            <td><label for="username"><strong><span id="TextUsername"></span>:</strong></label></td>
            <td><input type="text" id="TxtUserName" class="_100F login_inputfield" /></td>
          </tr>
          <tr>
            <td><label for="password"><strong><span id="TextPassword"></span>:</strong></label></td>
            <td><input type="password" id="TxtPassword" class="_100F login_inputfield" /></td>
          </tr>
          <tr>
            <td colspan="2" align="right">
                <input type="button" value="Guardar cambios" class="float_r" id="BtnLogin" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
                <input type="button" value="es" class="float_l grey" id="BtnLangEs" />
                &nbsp;
                <input type="button" value="ca" class="float_l grey" id="BtnLangCa" />
                &nbsp;
                <input type="button" value="en" class="float_l grey" id="BtnLangEn" />
            </td>
          </tr>
        </table>
        <div class="notification error png_bg" id="ErrorMessage">
            <a href="#" class="close_notification"><img src="images/icons/cross_grey_small.png" title="Close this notification" alt="close"></a>
            <div>
                <strong><span id="ErrorTitle"></span></strong>:<span id="ErrorText"></span> 
            </div>
        </div>
        <form id="MainMenu" method="post" action="InitSession.aspx" style="display:none;">
            <input type="text" id="UserId" name="UserId" />
            <input type="text" id="CompanyId" name="CompanyId" />
        </form>
     
    </div>

</body>
</html>

