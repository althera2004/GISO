<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="/css/common.css" />
    <script type="text/javascript" src="js/const.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/Login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td class="Label">Usuario:<span class="Required">*</span></td>
                <td><input type="text" name="TxtUserName" id="TxtUserName" class="InputData" placeholder="Nombre de usuario" /></td>
            </tr>
            <tr>
                <td class="Label">Contrase&ntilde;a:<span class="Required">*</span></td>
                <td><input type="password" name="TxtPassword" id="TxtPassword" class="InputData" placeholder="Contraseña"  /></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="button" id="BtnLogin" value="Acceder" class="InputButton" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="ErrorMessage" class="ErrorMessage"></div>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <form id="MainMenu" method="post" action="MainMenu.aspx">
        <input type="text" id="UserId" name="UserId" />
        <input type="text" id="CompanyId" name="CompanyId" />
    </form>
</body>
</html>
